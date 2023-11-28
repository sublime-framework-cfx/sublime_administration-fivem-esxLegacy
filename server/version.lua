local HTTPrequest <const> = "https://raw.githubusercontent.com/SUBLiME-Association/sublime_administration-fivem-esxLegacy/version.json"

CreateThread(function()
	local file, _v = LoadResourceFile(GetCurrentResourceName(), 'version.json')
	
	if file then _v = json.decode(file) else return print("[^1ERROR^0] Impossible de vérifier la version car le fichier n'existe pas!") end

	local message <const> = "^3Veuillez mettre à jour la ressource %s\n^3votre version : ^1%s ^7->^3 nouvelle version : ^2%s\n^3liens : ^4%s"
	local link <const> = "https://github.com/SUP2Ak/sublime_administration/tree/fellow-template-legacy"

	PerformHttpRequest(HTTPrequest, function(code, res, headers)
		if code == 200 then
			local _gv = json.decode(res)
			if _v.version == _gv.version then return end
			print('^9---------------------------------------------------------')
			print(message:format(_gv.script, _v.version, _gv.version, link))
			print('^9---------------------------------------------------------')
		else 
			return print("[^1ERROR^0] Impossible de vérifier la version code erreur github!") 
		end
	end, 'GET')

end)