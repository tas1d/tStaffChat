net.Receive("tStaffChat", function()
	local t = net.ReadTable()
	chat.AddText(unpack(t))
end)