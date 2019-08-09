local M = {}

M.LEFT = vmath.vector3(-1, 0, 0)
M.RIGHT = vmath.vector3(1, 0, 0)
M.UP = vmath.vector3(0, 1, 0)
M.DOWN = vmath.vector3(0, -1, 0)

M.NONE = vmath.vector3()

local DIRECTIONS = { M.LEFT, M.RIGHT, M.UP, M.DOWN }

function M.random()
	return DIRECTIONS[math.random(1, #DIRECTIONS)]
end

return M