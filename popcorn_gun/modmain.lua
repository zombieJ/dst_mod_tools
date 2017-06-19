TUNING.POPCORNGUN_USES = 20
TUNING.POPCORNGUN_DAMAGE = 28

PrefabFiles =
{
	"popcorngun"
}

Assets =
{
	Asset("ATLAS", "images/inventoryimages/popcorngun.xml"),
}

local Ingredient = GLOBAL.Ingredient
local PECIPETABS = GLOBAL.PECIPETABS
local STRINGS = GLOBAL.STRINGS
local TECH = GLOBAL.TECH

STRINGS.NAMES.POPCORNGUN = "Popcorn Gun"
STRINGS.RECIPE_DESC.POPCORNGUN = "Don't eat it!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.POPCORNGUN = "It used to be delicious"

local popcorngun = GLOBAL.Recipe("popcorngun", {
	Ingredient("corn", 2),
	Ingredient("twigs", 1),
	Ingredient("rope", 1),
	Ingredient("silk", 1)
})

popcorngun.atlas = "images/inventoryimages/popcorngun.xml"