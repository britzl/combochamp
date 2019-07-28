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
	create_champ("terry_brogan", {
		id = M.TERRY_BROGAN,
		name = "Terry \"Hollywood\" Brogan",
		speed = 20,
		stamina = 1000,
	}),
	create_champ("brett_amor", {
		id = M.BRETT_AMOR,
		name = "Brett Amor",
		speed = 25,
		stamina = 120,
	}),
	create_champ("mark_devotion", {
		id = M.MARK_DEVOTION,
		name = "Mark Devotion",
		speed = 40,
		stamina = 50,
	}),
	create_champ("green_gorgon", {
		id = M.GREEN_GORGON,
		name = "Green Gorgon",
		speed = 35,
		stamina = 75,
	}),
}
for i=1,#CHAMPS do
	local champ = CHAMPS[i]
	CHAMPS[champ.id] = champ
end


function M.get(champ)
	assert(CHAMPS[champ], "Unknown champ")
	return CHAMPS[champ]
end

function M.random()
	return CHAMPS[math.random(1, #CHAMPS)]
end

return M