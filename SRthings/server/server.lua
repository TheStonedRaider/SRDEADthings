RegisterServerEvent('EveryoneTeleportEntity')
AddEventHandler('EveryoneTeleportEntity', function(ent,x,y,z) 
nent = NetworkGetEntityFromNetworkId(ent)
print("EveryoneTeleportEntity",ent,nent)

TriggerClientEvent('EveryoneTeleportEntity',-1,ent,x,y,z)
end)

RegisterServerEvent('zaphimup')
AddEventHandler('zaphimup', function(x,y,z) 


TriggerClientEvent('zaphimup',-1,x,y,z)
end)

RegisterCommand('iamagod', function(source)

TriggerClientEvent('iamagod',source)

end)


RegisterCommand('showhash', function(source)

TriggerClientEvent('showhash',source)

end)