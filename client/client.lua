local QBCore = exports["qb-core"]:GetCoreObject()
local current_identifier = nil 
local IsPlayerWhitelisted = nil

RegisterNetEvent("f4st-donateprotection:reqidentifier")
AddEventHandler("f4st-donateprotection:reqidentifier", function(identifier)
    current_identifier = identifier
end)

function CheckPlayer()
    TriggerServerEvent("f4st-donateprotection:getplyidentifier")
    Wait(100)
    for k, v in pairs(FastConfig.Identifiers) do
        if v == current_identifier then 
            return true 
        end 
    end
    return false
end

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
    IsPlayerWhitelisted = CheckPlayer()
end)

AddEventHandler("playerSpawned", function()
    IsPlayerWhitelisted = CheckPlayer()
end)

AddEventHandler("onResourceStart", function()
    IsPlayerWhitelisted = CheckPlayer()
end)

CreateThread(function()
    while true do 
        Wait(6000)
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        local vehicleModel = GetEntityModel(vehicle)
        for k, v in pairs(FastConfig.WhitelistCars) do 
            if vehicleModel == GetHashKey(v) then 
                    if IsPlayerWhitelisted then 
                        FreezeEntityPosition(vehicle, false)
                    else
                        local driverSeat = GetPedInVehicleSeat(vehicle, -1)
                        if driverSeat == PlayerPedId() then
                            FreezeEntityPosition(vehicle, true)
                            QBCore.Functions.Notify(FastConfig.NotifyText, "error", 5000)
                        else 
                            FreezeEntityPosition(vehicle, false)
                        end 
                    end
            end 
        end  
    end
end)
