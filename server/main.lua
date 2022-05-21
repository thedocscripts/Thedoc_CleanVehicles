local QBCore = exports['qb-core']:GetCoreObject()
local timer = 14400
local whitelist = {}

-- RegisterCommand('testss', function()
--     TriggerClientEvent('Thedoc_CleanVehicles:client:delveh', -1)
-- end)

RegisterNetEvent('Thedoc_CleanVehicles:addtowhitelist')
AddEventHandler('Thedoc_CleanVehicles:addtowhitelist', function(veh)
    whitelist[#whitelist+1] = veh
    TriggerClientEvent('Thedoc_CleanVehicles:getwhitelist', -1, whitelist)
end)



RegisterNetEvent('Thedoc_CleanVehicles:emptytowhitelist')
AddEventHandler('Thedoc_CleanVehicles:emptytowhitelist', function()
    whitelist = {1}
    TriggerClientEvent('Thedoc_CleanVehicles:getwhitelist', -1, whitelist)
end)




Citizen.CreateThread(function()
    while true do
        timer = timer - 1
        if timer == 60 then
            TriggerClientEvent('Thedoc_CleanVehicles:client:announce', -1, "La grua va a pasar en 1 minuto")
        elseif timer == 30 then
            TriggerClientEvent('Thedoc_CleanVehicles:client:announce', -1, "La grua va a pasar en 30 segundos")
        elseif timer == 15 then
            TriggerClientEvent('Thedoc_CleanVehicles:client:announce', -1, "La grua va a pasar en 15 segundos")
        elseif timer == 10 then
            TriggerClientEvent('Thedoc_CleanVehicles:client:announce', -1, "La grua va a pasar en 10 segundos")
        elseif timer == 0 then
            TriggerClientEvent('Thedoc_CleanVehicles:client:delveh', -1)
            TriggerClientEvent('Thedoc_CleanVehicles:client:announce', -1, "La grua ha borrado correctamente todos los vehiculos")
            timer = 14400
        end
        Wait(1000)
    end
end)
