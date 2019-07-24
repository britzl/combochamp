local M = {}

M.TERRY_BROGAN = hash("terry_brogan")
M.BRETT_AMOR = hash("brett_amor")
M.GRAY_APE = hash("gray_ape")
M.GREEN_GORGON = hash("green_gorgon")
M.KID_DISCO = hash("kid_disco")
M.MARK_DEVOTION = hash("mark_devotion")


local function create_champ(animation_prefix, props)
	props.punch = hash(animation_prefix .. "_punch")
	props.kick = hash(animation_prefix .. "_kick")
	props.idle = hash(animation_prefix .. "_idle")
	props.idle_lifting = hash(animation_prefix .. "_idle_lifting")
	props.walk = hash(animation_prefix .. "_walk")
	props.walk_lifting = hash(animation_prefix .. "_walk_lifting")
	props.taunt = hash(animation_prefix .. "_taunt")
	props.back = hash(animation_prefix .. "_back")
	props.down = hash(animation_prefix .. "_down")
	props.portrait = hash(animation_prefix .. "_portrait")
	return props
end

local CHAMPS = {
	[M.TERRY_BROGAN] = create_champ("terry_brogan", {
		name = "Terry \"Hollywood\" Brogan",
		speed = 20,
		stamina = 1000,
	}),
	[M.BRETT_AMOR] = create_champ("brett_amor", {
		name = "Brett Amor",
		speed = 25,
		stamina = 120,
	}),
	[M.MARK_DEVOTION] = create_champ("mark_devotion", {
		name = "Mark Devotion",
		speed = 40,
		stamina = 50,
	}),
	[M.GREEN_GORGON] = create_champ("green_gorgon", {
		name = "Green Gorgon",
		speed = 35,
		stamina = 75,
	}),
}

function M.get(champ)
	assert(CHAMPS[champ], "Unknown champ")
	return CHAMPS[champ]
end

return M