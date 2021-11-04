ESX = nil TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



-- Car Location
OpenMenuCarLocation = function ()
    local cloca = RageUI.CreateMenu('Location', 'Interaction');

    RageUI.Visible(cloca, not RageUI.Visible(cloca)) 
    while cloca do

        Citizen.Wait(0)

        RageUI.IsVisible(cloca, function()

            RageUI.Button("Blista", nil, {RightLabel = "~g~250$"}, true , {
                onSelected = function()
                    TriggerServerEvent('nlocation:blista')
                    spawnCar("blista")
                    RageUI.CloseAll()
               end
            })
    

            RageUI.Button("Scooter", nil, {RightLabel = "~g~150$"}, true , {
                onSelected = function()
                    TriggerServerEvent('nlocation:scooter')
                    spawnCar("faggio")
                    RageUI.CloseAll()
               end
            })

        end)


        if not RageUI.Visible(cloca) then FreezeEntityPosition(PlayerPedId(), false) cloca = RMenu:DeleteType('cloca', true) end

    end
end

Citizen.CreateThread(function()

    while true do

      local wait = 750

        for k, v in pairs(carlocation.position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, v.x, v.y, v.z)

            if dist <= 5.0 then
                wait = 1
                DrawMarker(22, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 25, 133, 255, 255, true, true, p19, true)   
            end
        
            if dist <= 1.1 then
                wait = 1

                ESX.ShowHelpNotification("Appuyez sur E pour intéragir") 
                if IsControlJustPressed(1,51) then
                    FreezeEntityPosition(PlayerPedId(), true)
                    OpenMenuCarLocation()
                end
            end

        end
    Citizen.Wait(wait)
    end
end)


-- Avion Location

OpenMenuAvionLocation = function ()
    local aloca = RageUI.CreateMenu('Location', 'Interaction');

    RageUI.Visible(aloca, not RageUI.Visible(aloca)) 
    while aloca do

        Citizen.Wait(0)

        RageUI.IsVisible(aloca, function()

            RageUI.Button("Dodo", nil, {RightLabel = "~g~750$"}, true , {
                onSelected = function()
                    TriggerServerEvent('nlocation:dodo')
                    spawnAvion("dodo")
                    RageUI.CloseAll()
               end
            })
    

            RageUI.Button("Luxor", nil, {RightLabel = "~g~2000$"}, true , {
                onSelected = function()
                    TriggerServerEvent('nlocation:luxor')
                    spawnAvion("luxor")
                    RageUI.CloseAll()
               end
            })

        end)


        if not RageUI.Visible(aloca) then FreezeEntityPosition(PlayerPedId(), false) aloca = RMenu:DeleteType('aloca', true) end

    end
end

Citizen.CreateThread(function()

    while true do

      local wait = 750

        for k, v in pairs(avionlocation.position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, v.x, v.y, v.z)

            if dist <= 5.0 then
                wait = 1
                DrawMarker(22, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 25, 133, 255, 255, true, true, p19, true)   
            end
        
            if dist <= 1.1 then
                wait = 1

                ESX.ShowHelpNotification("Appuyez sur E pour intéragir") 
                if IsControlJustPressed(1,51) then
                    FreezeEntityPosition(PlayerPedId(), true)
                    OpenMenuAvionLocation()
                end
            end

        end
    Citizen.Wait(wait)
    end
end)

-- Location Bateaux

OpenMenuBateauxLocation = function ()
    local bloca = RageUI.CreateMenu('Location', 'Interaction');

    RageUI.Visible(bloca, not RageUI.Visible(bloca)) 
    while bloca do

        Citizen.Wait(0)

        RageUI.IsVisible(bloca, function()

            RageUI.Button("Jetski", nil, {RightLabel = "~g~150$"}, true , {
                onSelected = function()
                    TriggerServerEvent('nlocation:jetski')
                    spawnBateaux("seashark")
                    RageUI.CloseAll()
               end
            })
    

            RageUI.Button("Tropic", nil, {RightLabel = "~g~400$"}, true , {
                onSelected = function()
                    TriggerServerEvent('nlocation:tropic')
                    spawnBateaux("tropic")
                    RageUI.CloseAll()
               end
            })

        end)


        if not RageUI.Visible(bloca) then FreezeEntityPosition(PlayerPedId(), false) bloca = RMenu:DeleteType('bloca', true) end

    end
end

Citizen.CreateThread(function()

    while true do

      local wait = 750

        for k, v in pairs(bateauxlocation.position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, v.x, v.y, v.z)

            if dist <= 5.0 then
                wait = 1
                DrawMarker(22, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 25, 133, 255, 255, true, true, p19, true)   
            end
        
            if dist <= 1.1 then
                wait = 1

                ESX.ShowHelpNotification("Appuyez sur E pour intéragir") 
                if IsControlJustPressed(1,51) then
                    FreezeEntityPosition(PlayerPedId(), true)
                    OpenMenuBateauxLocation()
                end
            end

        end
    Citizen.Wait(wait)
    end
end)

-- Function 

function spawnCar(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(car, -1033.58, -2729.02, 20.1, 241.51, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    local plaque = "LOCATION"
    SetVehicleNumberPlateText(vehicle, plaque) 
    SetPedIntoVehicle(GetPlayerPed(-1),vehicle,-1) 
end

function spawnAvion(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(car, -1182.07, -2796.91, 13.94, 150.699, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    local plaque = "LOCATION"
    SetVehicleNumberPlateText(vehicle, plaque) 
    SetPedIntoVehicle(GetPlayerPed(-1),vehicle,-1) 
end

function spawnBateaux(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(car, -1792.84, -1229.39, 0.0, 238.16, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    local plaque = "LOCATION"
    SetVehicleNumberPlateText(vehicle, plaque) 
    SetPedIntoVehicle(GetPlayerPed(-1),vehicle,-1) 
end

-- Blips

Citizen.CreateThread(function()

    local blip = AddBlipForCoord(-1038.995, -2730.788, 20.21339)

    SetBlipSprite (blip, 315) -- Model du blip
    SetBlipDisplay(blip, 4)
    SetBlipScale  (blip, 0.7) -- Taille du blip
    SetBlipColour (blip, 3) -- Couleur du blip
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName('Car Location') 
    EndTextCommandSetBlipName(blip)
end)

Citizen.CreateThread(function()

    local blip = AddBlipForCoord(-1167.424, -2736.208, 19.88737)

    SetBlipSprite (blip, 314) -- Model du blip
    SetBlipDisplay(blip, 4)
    SetBlipScale  (blip, 0.7) -- Taille du blip
    SetBlipColour (blip, 3) -- Couleur du blip
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName('Avion Location') 
    EndTextCommandSetBlipName(blip)
end)

Citizen.CreateThread(function()

    local blip = AddBlipForCoord(-1799.35, -1224.66, 1.59)

    SetBlipSprite (blip, 316) -- Model du blip
    SetBlipDisplay(blip, 4)
    SetBlipScale  (blip, 0.7) -- Taille du blip
    SetBlipColour (blip, 3) -- Couleur du blip
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName('Bateaux Location') 
    EndTextCommandSetBlipName(blip)
end)