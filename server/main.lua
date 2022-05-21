local QBCore = exports['qb-core']:GetCoreObject()
local timer = Config.time
local whitelist = {}



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
            TriggerClientEvent('Thedoc_CleanVehicles:client:announce', -1, Config.oneminute)
        elseif timer == 30 then
            TriggerClientEvent('Thedoc_CleanVehicles:client:announce', -1, Config.ThirtySeconds)
        elseif timer == 15 then
            TriggerClientEvent('Thedoc_CleanVehicles:client:announce', -1, Config.FifteenSeconds)
        elseif timer == 10 then
            TriggerClientEvent('Thedoc_CleanVehicles:client:announce', -1, Config.TenSeconds)
        elseif timer == 0 then
            TriggerClientEvent('Thedoc_CleanVehicles:client:delveh', -1)
            TriggerClientEvent('Thedoc_CleanVehicles:client:announce', -1, Config.DeletedAllVehs)
            timer = Config.time
        end
        Wait(1000)
    end
end)
