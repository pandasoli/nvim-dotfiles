function mergeTables(target, ...)
	for _, t in ipairs({...}) do
		for _, v in ipairs(t) do
			table.insert(target, v)
		end
	end
	return target
end
