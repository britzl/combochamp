local soundcontroller = require "util.soundcontroller"

local M = {}


M.PUNCH = hash("punch")
M.AUDIENCE = hash("audience")
M.BELL = hash("bell")
M.MISS = hash("miss")
M.CHEER = hash("cheer")
M.THUD = hash("thud")


function M.punch()
	soundcontroller.play_random(M.PUNCH, { gain = 0.4 })
end

function M.bell()
	soundcontroller.play_random(M.BELL, { gain = 1.0 })
end

function M.miss()
	soundcontroller.play_random(M.MISS, { gain = 1.0 })
end

function M.thud()
	soundcontroller.play_random(M.THUD, { gain = 0.3 })
end

function M.cheer()
	msg.post("/sounds", "cheer")
end


return M