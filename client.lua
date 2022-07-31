-----------------------------------------------------------------------------------
local LastZone, CurrentAction, hasAlreadyEnteredMarker = nil, nil, false
local xSound = exports.xsound
-----------------------------------------------------------------------------------

RegisterNetEvent('dj_baspel:createMusicMenu', function()
    lib.registerContext({
        id = 'music_menu',
        title = Config.Language['titleMenu'],
        options = {
            {
                title = Config.Language['playSong'],
                description = Config.Language['playSongDesc'],
                arrow = false,
                event = 'dj_baspel:playMusicMenu',
            },
            {
                title = Config.Language['pauseMusic'],
                description = Config.Language['pauseMusicDesc'],
                arrow = false,
                serverEvent = 'dj_baspel:pauseMusic',
            },
            {
                title = Config.Language['resumeMusic'],
                description = Config.Language['resumeMusicDesc'],
                arrow = false,
                serverEvent = 'dj_baspel:resumeMusic',
            },
            {
                title = Config.Language['changeVolume'],
                description = Config.Language['changeVolumeDesc'],
                arrow = false,
                event = 'dj_baspel:changeVolumeMenu',
            },
            {
                title = Config.Language['stopMusic'],
                description = Config.Language['stopMusicDesc'],
                arrow = false,
                serverEvent = 'dj_baspel:stopMusic',
            },
        }
    })
    lib.showContext('music_menu')
end)

RegisterNetEvent('dj_baspel:playMusicMenu', function (YoutubeURL)
    local input = lib.inputDialog(Config.Language['songSel'], {Config.Language['url']})
    if input then
        local YoutubeURL = input[1]
        TriggerServerEvent('dj_baspel:playMusic', YoutubeURL)
    end
end)


RegisterNetEvent('dj_baspel:changeVolumeMenu', function ()
    local input = lib.inputDialog(Config.Language['musicVolume'], {Config.Language['musicVolumeNm']})
    if input then
        local volume = input[1]
        TriggerServerEvent('dj_baspel:changeVolume', volume)
    end
end)


CreateThread(function()
    while true do
        local sleep = 1500
        local playerCoords, inLocation, currentZone = GetEntityCoords(PlayerPedId()), false, false

        for i=1, #Config.Locations do
            local dist = #(playerCoords - Config.Locations[i].coords)
            if dist <= Config.Distance then
                sleep = 0
                if dist <= Config.Locations[i].distance then
                    inLocation, currentZone = true, i
                end
            end
        end

        if (inLocation and not hasAlreadyEnteredMarker) or (inLocation and LastZone ~= currentZone) then
            hasAlreadyEnteredMarker, LastZone = true, currentZone
            CurrentAction = 'musicMenu'
            lib.showTextUI(Config.Language['openMenu'])
        end

        if not inLocation and hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = false
            sleep = 1000
            CurrentAction = nil
            lib.hideTextUI()
        end
        Wait(sleep)
    end
end)

CreateThread(function ()
    while true do
        local sleep = 1500
        if CurrentAction ~= nil then
            sleep = 0
            if IsControlPressed(1, 38) then
                Wait(500)
                if CurrentAction == 'musicMenu' then
                    TriggerEvent('dj_baspel:createMusicMenu')
                end
            end
        end
        Wait(sleep)
    end
end)
