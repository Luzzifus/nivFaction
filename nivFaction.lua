nivFaction = CreateFrame('Frame', 'nivFaction', UIParent)
nivFaction:SetScript('OnEvent', function(self, event, ...) self[event](self, event, ...) end)

nivFactionDB = {}
ReputationFrame:HookScript("OnShow", function(...) nivFaction:RepFrameShowHook(...) end)
ReputationFrame:HookScript("OnHide", function(...) nivFaction:RepFrameHideHook(...) end)

function nivFaction:RepFrameShowHook(...)
	ReputationFrame_OnShow(...)
	local t = GetNumFactions()
	for i = 1,t do
		local n,_,_,_,_,_,_,_,h = GetFactionInfo(i)
 		if h and nivFactionDB[n] then
 			if nivFactionDB[n] == 1 then ExpandFactionHeader(i) else CollapseFactionHeader(i) end
 		end
 	end
end

function nivFaction:RepFrameHideHook(...)
	local t = GetNumFactions()
	for i = 1,t do
		local n,_,_,_,_,_,_,_,h,c = GetFactionInfo(i)
		if h then nivFactionDB[n] = c and 0 or 1 end
	end
end
