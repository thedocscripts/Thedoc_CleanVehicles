local QBCore = exports['qb-core']:GetCoreObject()

local nondel = {
    1
}

RegisterNetEvent('Thedoc_CleanVehicles:client:delveh')
AddEventHandler('Thedoc_CleanVehicles:client:delveh', function(data)
    for veh in EnumerateVehicles() do
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if vehicle ~= veh then
            for k, v in pairs(nondel) do
                if v ~= veh then
                SetEntityAsMissionEntity(veh, true, true)
                DeleteEntity(veh)
                end
            end
        end
    end
    TriggerServerEvent('Thedoc_CleanVehicles:emptytowhitelist')
end)

RegisterNetEvent('Thedoc_CleanVehicles:getwhitelist')
AddEventHandler('Thedoc_CleanVehicles:getwhitelist', function(vhcls)
    nondel = vhcls
end)
RegisterCommand('nondel', function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    for k, v in pairs(nondel) do
        if vehicle ~= v then
            QBCore.Functions.Notify(Config.AddedToWhitelist)
            return TriggerServerEvent('Thedoc_CleanVehicles:addtowhitelist', vehicle)
        end
    end
    return QBCore.Functions.Notify(Config.AlreadyInWhitelist)
end)

RegisterNetEvent('Thedoc_CleanVehicles:client:announce', function(msg)
    QBCore.Functions.Notify(msg, 'primary', 3500)
    TriggerEvent('chat:addMessage', {
        color = { 255, 0, 0},
        multiline = true,
        args = {Config.MessageHeader ,msg}
      })
end)

