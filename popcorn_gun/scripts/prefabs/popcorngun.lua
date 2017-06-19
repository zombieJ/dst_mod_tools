local assets=
{
	Asset("ANIM", "anim/popcorngun.zip"),
	Asset("ANIM", "anim/popcorn_gun.zip"),
	Asset("ATLAS", "images/inventoryimages/popcorngun.xml"),
}

local function onfinished(inst)
	inst:Remove()
end

local function onequip(inst, owner) 
	owner.AnimState:OverrideSymbol("swap_object", "popcorn_gun", "swap_spear")
	owner.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	owner.AnimState:Show("ARM_carry") 
	owner.AnimState:Hide("ARM_normal") 
end

local function onunequip(inst, owner) 
	owner.AnimState:Hide("ARM_carry") 
	owner.AnimState:Show("ARM_normal") 
end


local function fn(Sim)
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
	MakeInventoryPhysics(inst)
	
	anim:SetBank("spear")
	anim:SetBuild("popcorngun")
	anim:PlayAnimation("idle")
	
	inst:AddTag("sharp")

	inst:AddComponent("weapon")
	inst.components.weapon:SetDamage(TUNING.POPCORNGUN_DAMAGE)
	
	-------
	
	inst:AddComponent("finiteuses")
	inst.components.finiteuses:SetMaxUses(TUNING.POPCORNGUN_USES)
	inst.components.finiteuses:SetUses(TUNING.POPCORNGUN_USES)
	
	inst.components.finiteuses:SetOnFinished( onfinished )

	inst:AddComponent("inspectable")
	
	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/popcorngun.xml"
	
	inst:AddComponent("equippable")
	inst.components.equippable:SetOnEquip( onequip )
	inst.components.equippable:SetOnUnequip( onunequip )
	
	return inst
end

return Prefab( "common/inventory/popcorngun", fn, assets) 
