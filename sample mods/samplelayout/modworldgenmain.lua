local Layouts = GLOBAL.require("map/layouts").Layouts
local StaticLayout = GLOBAL.require("map/static_layout")

-- Give your layout an in-code name and point it to the exported file
Layouts["MyCustomLayout"] = StaticLayout.Get("map/static_layouts/sample_layout")

-- Add this layout to some rooms or levels.
-- In this example it's added to every "forest" room in the game
AddRoomPreInit("Forest", function(room)
	if not room.contents.countstaticlayouts then
		room.contents.countstaticlayouts = {}
	end
	room.contents.countstaticlayouts["MyCustomLayout"] = 1
end)

