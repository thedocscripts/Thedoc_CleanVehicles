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
            --local vehccords = GetEntityCoords(veh)
            --QBCore.Functions.StartParticleAtCoord("core", "ent_amb_smoke_chicken", true, vehccords ,vector3(0,0,0), 1.0, 10.0, false, 5)
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
            QBCore.Functions.Notify("Este vehiculo a sido añadido a la whitelist")
            return TriggerServerEvent('Thedoc_CleanVehicles:addtowhitelist', vehicle)
        end
    end
    return QBCore.Functions.Notify("Este vehiculo ya esta asignado para no borrarse")
end)

RegisterNetEvent('Thedoc_CleanVehicles:client:announce', function(msg)
    QBCore.Functions.Notify(msg, 'primary', 3500)
end)

