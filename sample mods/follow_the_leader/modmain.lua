local SEARCH_RADIUS = 20
local FOLLOW_THE_LEADER_TAG = "ftl"
local MIN_FOLLOW_LEADER = 1
local MAX_FOLLOW_LEADER = 12
local TARGET_FOLLOW_LEADER = 2

-- Returns the current leader.
local function GetLeader(inst)
    return inst.components.follower and inst.components.follower.leader
end

local function IsValidFollower(entity)
	-- Only consider things which can move around and have a brain.  We don't want trees to try and follow us.
	return entity.components and entity.components.locomotor and entity.brain and entity.brain.bt and entity.brain.bt.root and entity ~= GLOBAL.GetPlayer()
end

local function CanBeAttacked(attacker)
	-- Don't let followers attack us.
	return not attacker:HasTag(FOLLOW_THE_LEADER_TAG)
end

local function UpdateFollowTheLeader()
	-- Only update if player has spawned.
	local player = GLOBAL.GetPlayer()
	if not player then
		return
	end

	-- Make sure our followers can't attack us.
	if player.components.combat and not player.components.combat.canbeattackedfn then
		player.components.combat.canbeattackedfn = CanBeAttacked
	end

	-- Get all entities around the player which haven't already been tagged.
    local x,y,z = player.Transform:GetWorldPosition()
    local ignore_tags = {FOLLOW_THE_LEADER_TAG}
	local entities = TheSim:FindEntities(x,y,z, SEARCH_RADIUS, {}, ignore_tags)

	-- Convert the entities to followers.
	for k,v in pairs(entities) do
		if IsValidFollower(v) then

			-- Insert a new behaviour into the brain
			local behaviours = v.brain.bt.root.children
			table.insert(behaviours, math.min(3, #behaviours), GLOBAL.Follow(v, GetLeader, MIN_FOLLOW_LEADER, TARGET_FOLLOW_LEADER, MAX_FOLLOW_LEADER, true))
	
			-- Add follower component if it doesn't already have one.
			if not v.components.follower then
				v:AddComponent("follower")
			end			

			-- Tell entity to stop combat just in case it was trying to fight us.
			if v.components.combat then
				v.components.combat:GiveUp()
			end
	
			-- Tell the entity to follow us.
			if v.components.follower.leader ~= player then
				player.components.leader:AddFollower(v)
			end

			-- Tag this entity so we don't try and convert it again.
			v:AddTag(FOLLOW_THE_LEADER_TAG)
		end
	end
end


-- Continuously check for new entities.
AddSimPostInit( function()
	GLOBAL.scheduler:ExecutePeriodic( 0.5, UpdateFollowTheLeader )	
end)
