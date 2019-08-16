local M = {}

M.TERRY_BROGAN = hash("terry_brogan")
M.BRETT_AMOR = hash("brett_amor")
M.GRAY_APE = hash("gray_ape")
M.GREEN_GORGON = hash("green_gorgon")
M.KID_DISCO = hash("kid_disco")
M.MARK_DEVOTION = hash("mark_devotion")

local SUPER_FAST = 45
local VERY_FAST = 40
local FAST = 35
local SLOW = 30
local VERY_SLOW = 25
local SUPER_SLOW = 20

local SUPER_STRONG = 120
local VERY_STRONG = 100
local STRONG = 80
local WEAK = 60
local VERY_WEAK = 40
local SUPER_WEAK = 20

local function stats_to_description(stamina, speed)
	local desc

	if speed >= SUPER_FAST then
		desc = '"Lightning fast'
	elseif speed >= VERY_FAST then
		desc = '"Very fast'
	elseif speed >= FAST then
		desc = '"Fast'
	elseif speed >= SLOW then
		desc = '"Slow'
	elseif speed >= VERY_SLOW then
		desc = '"Sluggish'
	else
		desc = '"Lumbering'
	end

	local good_speed = speed >= FAST
	local good_stamina = stamina >= STRONG
	if (good_speed and good_stamina) or (not good_speed and not good_stamina) then
		desc = desc .. " and "
	else
		desc = desc .. " but "
	end

	if stamina >= SUPER_STRONG then
		desc = desc .. "strong as a bull\""
	elseif stamina >= VERY_STRONG then
		desc = desc .. 'very tough"'
	elseif stamina >= STRONG then
		desc = desc .. 'strong"'
	elseif stamina >= WEAK then
		desc = desc .. 'scrawny"'
	elseif stamina >= VERY_WEAK then
		desc = desc .. 'really weak"'
	else
		desc = desc .. 'feeble"'
	end
	return desc
end

local function create_champ(animation_prefix, props)
	props.short_name = props.short_name or props.name
	props.stats_desc = stats_to_description(props.stamina, props.speed)
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
		short_name = "Terry Brogan",
		speed = SUPER_SLOW,
		stamina = SUPER_STRONG,
	}),
	create_champ("brett_amor", {
		id = M.BRETT_AMOR,
		name = "Brett Amor",
		speed = VERY_SLOW,
		stamina = VERY_STRONG,
	}),
	create_champ("mark_devotion", {
		id = M.MARK_DEVOTION,
		name = "Mark Devotion",
		speed = SUPER_FAST,
		stamina = VERY_WEAK,
	}),
	create_champ("green_gorgon", {
		id = M.GREEN_GORGON,
		name = "Green Gorgon",
		speed = SLOW,
		stamina = STRONG,
	}),
}
for i=1,#CHAMPS do
	local champ = CHAMPS[i]
	CHAMPS[champ.id] = champ
end

function M.all()
	return CHAMPS
end

function M.get(champ)
	assert(CHAMPS[champ], "Unknown champ")
	return CHAMPS[champ]
end

function M.random()
	return CHAMPS[math.random(1, #CHAMPS)]
end

return M