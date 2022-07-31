Config = {}

Config.Debug = true -- If you want debug in console
Config.DefaultVolume = 0.1 -- Accepted values are 0.01 - 1
Config.Distance = 5.0 -- Dont touch this

Config.Locations = {
    {
        name = 'Vanilla', -- Name of zone
        coords = vec3(117.63, -1283.91, 28.27), -- Coordinates where menu will appear if you are nearby
        radius = 30, -- Playing music distance (radius)
        distance = 2.5, -- Menu appear distance
        isPlaying = false -- Dont touch this!!!!
    },
    {
        name = 'Bahama',
        coords = vec3(-1382.05, -614.72, 31.5),
        radius = 30,
        distance = 2.5,
        isPlaying = false
    },
    {
        name = 'Galaxy',
        coords = vec3(376.19, 275.45, 92.39),
        radius = 30,
        distance = 2.5,
        isPlaying = false
    },
    {
        name = 'Tequila',
        coords = vec3(-562.11, 281.66, 85.6764),
        radius = 30,
        distance = 2.5,
        isPlaying = false
    },
    {
        name = 'HenHouse',
        coords = vec3(-312.15, 6265.32, 32.06),
        radius = 30,
        distance = 2.5,
        isPlaying = false
    },
    {
        name = 'President',
        coords = vec3(-3237.0103, 773.4242, 8.9309),
        radius = 30,
        distance = 2.5,
        isPlaying = false
    },
}

Config.Language = {
    ['openMenu'] = '[E] - Open a DJ Menu',
    ['titleMenu'] = '💿 | DJ Pult',
    ['playSong'] = '🎶 | Play a song',
    ['playSongDesc'] = 'Enter a youtube URL',
    ['pauseMusic'] = '⏸️ | Pause Music',
    ['pauseMusicDesc'] = 'Pause a currently playing music',
    ['resumeMusic'] = '▶️ | Resume Music',
    ['resumeMusicDesc'] = 'Resume playing paused music',
    ['changeVolume'] = '🔈 | Change Volume',
    ['changeVolumeDesc'] = 'Change volume of song',
    ['stopMusic'] = '❌ | Turn off music',
    ['stopMusicDesc'] = 'Stop the music & choose a new song',
    ['songSel'] = 'Song Selection',
    ['url'] = 'Youtube URL',
    ['musicVolume'] = 'Music Volume',
    ['musicVolumeNm'] = 'Min: 0.01 - Max: 1' -- Pls dont change numbers (0.01 - 1)
}