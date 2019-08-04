local M = {}

local ALL = {
	{
		flag = "usa",
		name = "Team U.S.A.",
	},
	{
		flag = "mexico",
		name = "Mexico",
	},
	{
		flag = "sweden",
		name = "Sweden",
	},
	{
		flag = "japan",
		name = "Japan",
	},
}


function M.name(index)
	return ALL[index].name
end

function M.flag(index)
	return ALL[index].flag
end

function M.count()
	return #ALL
end

return M