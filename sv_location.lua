TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Car Location

RegisterNetEvent('nlocation:blista')
AddEventHandler('nlocation:blista', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()
	xPlayer.removeMoney(250) -- Ici pour changer le prix !
	TriggerClientEvent('esx:showNotification', source, "~g~Véhicule de location sortie .")

end)

RegisterNetEvent('nlocation:scooter')
AddEventHandler('nlocation:scooter', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()
	xPlayer.removeMoney(250) -- Ici pour changer le prix !
	TriggerClientEvent('esx:showNotification', source, "~g~Véhicule de location sortie .")

end)

-- Avion Location

RegisterNetEvent('nlocation:luxor')
AddEventHandler('nlocation:luxor', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()
	xPlayer.removeMoney(2000) -- Ici pour changer le prix !
	TriggerClientEvent('esx:showNotification', source, "~g~Avion de location sortie .")

end)

RegisterNetEvent('nlocation:dodo')
AddEventHandler('nlocation:dodo', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()
	xPlayer.removeMoney(750) -- Ici pour changer le prix !
	TriggerClientEvent('esx:showNotification', source, "~g~Avion de location sortie .")

end)

-- Bateaux Location 

RegisterNetEvent('nlocation:jetski')
AddEventHandler('nlocation:jetski', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()
	xPlayer.removeMoney(150) -- Ici pour changer le prix !
	TriggerClientEvent('esx:showNotification', source, "~g~Bateaux de location sortie .")

end)

RegisterNetEvent('nlocation:tropic')
AddEventHandler('nlocation:tropic', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()
	xPlayer.removeMoney(400) -- Ici pour changer le prix !
	TriggerClientEvent('esx:showNotification', source, "~g~Bateaux de location sortie .")

end)