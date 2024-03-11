Citizen.CreateThread(function()       -------desativa o tab
	while true do
		Citizen.Wait(1)
		local ped = PlayerPedId()
		local health = GetEntityHealth(ped)
		if health >= 101 then
		DisableControlAction(0,37,true)
		end
	end
end)

Citizen.CreateThread(function()     ------desativa a coronhada
    while true do
        Citizen.Wait(0)
		local ped = PlayerPedId()
            	if IsPedArmed(ped, 6) then
				DisableControlAction(1, 140, true)
            	DisableControlAction(1, 141, true)
            	DisableControlAction(1, 142, true)
        end
    end
end)

--CreateThread(function()        ------------desativa os sons de tiros e isso 
--	StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE");
--	SetAudioFlag("PoliceScannerDisabled",true); 
--end)

Citizen.CreateThread(function()             ------------desativa o controle no carro enquanto estiver no ar
    while true do
        Citizen.Wait(1)
        local veh = GetVehiclePedIsIn(PlayerPedId(),false)
        if DoesEntityExist(veh) and not IsEntityDead(veh) then
            local model = GetEntityModel(veh)
            if not IsThisModelABoat(model) and not IsThisModelAHeli(model) and not IsThisModelAPlane(model) and not IsThisModelABicycle(model) and not IsThisModelABike(model) and not IsThisModelAQuadbike(model) and IsEntityInAir(veh) then
                DisableControlAction(0,59)
                DisableControlAction(0,60)
                DisableControlAction(0,73)
            end
        end
    end
end)

