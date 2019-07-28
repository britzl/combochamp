local M = {}

local sound_groups = {}

local DEFAULT_PROPERTIES = {
	delay = 0,
	gain = 1.0,
}

function M.sound_group(id, sounds, settings)
	assert(id, "You must provide a sound group id")
	assert(sounds, "You must provide a list of sounds")
	for i,sound in pairs(sounds) do
		if type(sound) == "string" then
			sounds[i] = msg.url(sound)
		end
	end
	settings = settings or {}
	settings.gate_time = settings.gate_time or 0
	local sound_group = {
		id = id,
		index = 1,
		sounds = sounds,
	}
	for k,v in pairs(settings) do
		sound_group[k] = v
	end
	sound_groups[id] = sound_group
end

local function check_gate(sg)
	local now = socket.gettime()
	local time = now - (sg.time or 0)
	return time > sg.gate_time
end

local function play(sg, properties)
	local now = socket.gettime()
	sound.play(sg.sounds[sg.index], properties or DEFAULT_PROPERTIES)
	sg.time = now
	sg.index = sg.index + 1
	if sg.index > #sg.sounds then
		sg.index = 1
	end
end

function M.play_next(id, properties)
	local sg = sound_groups[id]
	assert(sg, ("You must provide a valid sound group id. Got %s"):format(tostring(id)))
	if check_gate(sg) then
		play(sg, properties)
	end
end
	
function M.play_random(id, properties)
	local sg = sound_groups[id]
	assert(sg, ("You must provide a valid sound group id. Got %s"):format(tostring(id)))
	sg.index = math.random(1, #sg.sounds)
	if check_gate(sg) then
		play(sg, properties)
	end
end

function M.play_all(id, properties)
	local sg = sound_groups[id]
	assert(sg, ("You must provide a valid sound group id. Got %s"):format(tostring(id)))
	sg.index = 1
	for i=1,#sg.sounds do
		play(sg, properties)
	end
end

function M.set_gain(id, gain)
	assert("You must provide a gain value")
	local sg = sound_groups[id]
	assert(sg, ("You must provide a valid sound group id. Got %s"):format(tostring(id)))
	for i=1,#sg.sounds do
		sound.set_gain(sg.sounds[i], gain)
	end
end



return M