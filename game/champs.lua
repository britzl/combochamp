local M = {}

M.TERRY_BROGAN = hash("terry_brogan")
M.BRETT_AMOR = hash("brett_amor")
M.GRAY_APE = hash("gray_ape")
M.GREEN_GORGON = hash("green_gorgon")
M.KID_DISCO = hash("kid_disco")
M.MARK_DEVOTION = hash("mark_devotion")


local function create_champ(name, animation_prefix)
	return {
		name = name,
		punch = hash(animation_prefix .. "_punch"),
		kick = hash(animation_prefix .. "_kick"),
		idle = hash(animation_prefix .. "_idle"),
		idle_lifting = hash(animation_prefix .. "_idle_lifting"),
		walk = hash(animation_prefix .. "_walk"),
		walk_lifting = hash(animation_prefix .. "_walk_lifting"),
		taunt = hash(animation_prefix .. "_taunt"),
		down = hash(animation_prefix .. "_down"),
	}
end

local CHAMPS = {
	[M.TERRY_BROGAN] = create_champ("Terry \"Hollywood\" Brogan", "terry_brogan"),
	[M.BRETT_AMOR] = create_champ("Brett Amor", "brett_amor"),
}

function M.get(champ)
	assert(CHAMPS[champ], "Unknown champ")
	return CHAMPS[champ]
end

return M