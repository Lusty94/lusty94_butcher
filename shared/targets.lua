local TargetType = Config.CoreSettings.Target.Type

for k,v in pairs(Config.InteractionLocations.JobAreas) do
    if TargetType == 'qb' then
        exports['qb-target']:AddBoxZone(v.name, v.coords, v.width, v.height, {
            name = v.name,
            heading = v.heading,
            debugPoly = Config.DebugPoly,
            minZ = v.minz,
            maxZ = v.maxz,
        }, {
            options = {
            {
                type = "client",
                event = v.event,
                icon = v.icon,
                label = v.label,
                job = v.job,
            }
            },
            distance = v.distance,
        })
    elseif TargetType == 'ox' then
        exports.ox_target:addBoxZone({
            coords = v.coords,
            size = v.size,
            rotation = v.heading,
            debug = Config.DebugPoly,
                options = {
                    {
                        id = v.name,
                        groups = v.job,
                        event = v.event,
                        label = v.label,
                        icon = v.icon,
                        distance = v.distance,
                    }
                }
            })
    elseif TargetType == 'custom' then
        --insert your own target code here
    end
end