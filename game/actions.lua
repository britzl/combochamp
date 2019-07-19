local directions = require "game.directions"

local M = {}

M.LEFT = hash("left")
M.RIGHT = hash("right")
M.UP = hash("up")
M.DOWN = hash("down")
M.A = hash("a")
M.B = hash("b")

M.ACTION_PRESSED = { pressed = true }
M.ACTION_RELEASED = { released = true }

local DIRECTIONS = {
	[M.LEFT] = directions.LEFT,
	[M.RIGHT] = directions.RIGHT,
	[M.UP] = directions.UP,
	[M.DOWN] = directions.DOWN,
}

function M.is_movement(action_id)
	return action_id == M.LEFT
	or action_id == M.RIGHT
	or action_id == M.UP
	or action_id == M.DOWN
end

function M.direction(action_id)
	return DIRECTIONS[action_id] or directions.NONE
end

return M