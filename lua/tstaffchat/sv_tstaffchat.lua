util.AddNetworkString("tStaffChat")

hook.Add("PlayerSay", "tStaffChat", function(ply, text)
	if string.lower(string.sub(text, 1, string.len(tStaffChat.command) + 1)) == tStaffChat.command .. " " then
		local text = string.sub(text, string.len(tStaffChat.command) + 2, string.len(text))
		local chatText = {tStaffChat.prefixcolor, tStaffChat.prefix .. " ", team.GetColor(ply:Team()), ply:Nick(), tStaffChat.textcolor, " > " .. text}
		
		for _, v in pairs(player.GetAll()) do
			if tStaffChat.staff[v:GetUserGroup()] then
				net.Start("tStaffChat")
					net.WriteTable(chatText)
				net.Send(v)
			end
		end
		return ""
	end
end)