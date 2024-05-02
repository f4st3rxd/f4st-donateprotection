local QBCore = exports["qb-core"]:GetCoreObject()

RegisterServerEvent("f4st-donateprotection:getplyidentifier")
AddEventHandler("f4st-donateprotection:getplyidentifier", function()
    local src = source 
    local Identifier = GetPlayerIdentifierByType(src, FastConfig.IdentifierType)
    TriggerClientEvent("f4st-donateprotection:reqidentifier", src, Identifier)
end)
