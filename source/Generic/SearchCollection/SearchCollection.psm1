function GetGameMenuItems
{
    param(
        $scriptGameMenuItemActionArgs
    )
   
    $menuSectionName = [Playnite.SDK.ResourceProvider]::GetString("LOCSearch_Collection_MenuItemSearchSection")
    
    $BingImagesScreenshot_MenuItem = New-Object Playnite.SDK.Plugins.ScriptGameMenuItem
    $BingImagesScreenshot_MenuItem.Description =  "Bing Images Screenshot"
    $BingImagesScreenshot_MenuItem.FunctionName = "SearchBingImagesScreenshot"
    $BingImagesScreenshot_MenuItem.MenuSection = $menuSectionName

    $BingImagesWallpaper_MenuItem = New-Object Playnite.SDK.Plugins.ScriptGameMenuItem
    $BingImagesWallpaper_MenuItem.Description =  "Bing Images Wallpaper"
    $BingImagesWallpaper_MenuItem.FunctionName = "SearchBingImagesWallpaper"
    $BingImagesWallpaper_MenuItem.MenuSection = $menuSectionName

    $GoogleImagesScreenshot_MenuItem = New-Object Playnite.SDK.Plugins.ScriptGameMenuItem
    $GoogleImagesScreenshot_MenuItem.Description =  "Google Images Screenshot"
    $GoogleImagesScreenshot_MenuItem.FunctionName = "SearchGoogleImagesScreenshot"
    $GoogleImagesScreenshot_MenuItem.MenuSection = $menuSectionName

    $GoogleImagesWallpaper_MenuItem = New-Object Playnite.SDK.Plugins.ScriptGameMenuItem
    $GoogleImagesWallpaper_MenuItem.Description =  "Google Images Wallpaper"
    $GoogleImagesWallpaper_MenuItem.FunctionName = "SearchGoogleImagesWallpaper"
    $GoogleImagesWallpaper_MenuItem.MenuSection = $menuSectionName
    
    $Metacritic_MenuItem = New-Object Playnite.SDK.Plugins.ScriptGameMenuItem
    $Metacritic_MenuItem.Description =  "Metacritic"
    $Metacritic_MenuItem.FunctionName = "SearchMetacritic"
    $Metacritic_MenuItem.MenuSection = $menuSectionName

    $PCGamingWiki_MenuItem = New-Object Playnite.SDK.Plugins.ScriptGameMenuItem
    $PCGamingWiki_MenuItem.Description =  "PCGamingWiki"
    $PCGamingWiki_MenuItem.FunctionName = "SearchPCGamingWiki"
    $PCGamingWiki_MenuItem.MenuSection = $menuSectionName

    $SteamDB_MenuItem = New-Object Playnite.SDK.Plugins.ScriptGameMenuItem
    $SteamDB_MenuItem.Description =  "SteamDB"
    $SteamDB_MenuItem.FunctionName = "SearchSteamDB"
    $SteamDB_MenuItem.MenuSection = $menuSectionName
    
    $SteamGridDB_MenuItem = New-Object Playnite.SDK.Plugins.ScriptGameMenuItem
    $SteamGridDB_MenuItem.Description =  "SteamGridDB"
    $SteamGridDB_MenuItem.FunctionName = "SearchSteamGridDB"
    $SteamGridDB_MenuItem.MenuSection = $menuSectionName
    
    $Twitch_MenuItem = New-Object Playnite.SDK.Plugins.ScriptGameMenuItem
    $Twitch_MenuItem.Description =  "Twitch"
    $Twitch_MenuItem.FunctionName = "SearchTwitch"
    $Twitch_MenuItem.MenuSection = $menuSectionName
    
    $VNDB_MenuItem = New-Object Playnite.SDK.Plugins.ScriptGameMenuItem
    $VNDB_MenuItem.Description =  "VNDB"
    $VNDB_MenuItem.FunctionName = "SearchVNDB"
    $VNDB_MenuItem.MenuSection = $menuSectionName
    
    $Youtube_MenuItem = New-Object Playnite.SDK.Plugins.ScriptGameMenuItem
    $Youtube_MenuItem.Description =  "Youtube"
    $Youtube_MenuItem.FunctionName = "SearchYoutube"
    $Youtube_MenuItem.MenuSection = $menuSectionName
    
    return $BingImagesScreenshot_MenuItem, $BingImagesWallpaper_MenuItem, $GoogleImagesScreenshot_MenuItem, $GoogleImagesWallpaper_MenuItem, $Metacritic_MenuItem, $PCGamingWiki_MenuItem, $SteamDB_MenuItem, $SteamGridDB_MenuItem, $Twitch_MenuItem, $VNDB_MenuItem, $Youtube_MenuItem
}

function Invoke-LaunchUrl
{
    param (
        $SearchUrlTemplate
    )
    
    # Set gamedatabase
    $Gamedatabase = $PlayniteApi.MainView.SelectedGames

    # Launch urls of all selected games
    foreach ($game in $Gamedatabase) {
        $GameName = [uri]::EscapeDataString($($game.name))
        $SearchUrl = $SearchUrlTemplate -f $GameName
        Start-Process $SearchUrl
    }
}

function SearchBingImagesWallpaper
{
    param(
        $scriptGameMenuItemActionArgs
    )
    
    # Set dimensions of image search
    $width = '1920'
    $height = '1080'

    # Set Search Url template and invoke Url launch function
    $SearchUrlTemplate = 'https://www.bing.com/images/search?&q={0} Wallpaper&qft=+filterui:imagesize-custom_' + "$width" + '_' + "$height"
    Invoke-LaunchUrl  $SearchUrlTemplate
}

function SearchBingImagesScreenshot
{
    param(
        $scriptGameMenuItemActionArgs
    )
    
    # Set dimensions of image search
    $width = '1920'
    $height = '1080'

    # Set Search Url template and invoke Url launch function
    $SearchUrlTemplate = 'https://www.bing.com/images/search?&q={0} Screenshot&qft=+filterui:imagesize-custom_'+ "$width" + '_' + "$height"
    Invoke-LaunchUrl  $SearchUrlTemplate
}
function SearchGoogleImagesWallpaper
{
    param(
        $scriptGameMenuItemActionArgs
    )
    
    # Set dimensions of image search
    $width = '1920'
    $height = '1080'

    # Set Search Url template and invoke Url launch function
    $SearchUrlTemplate = 'https://www.google.com/search?q={0} Wallpaper imagesize:' + "$width" + 'x' + "$height" + '&tbm=isch'
    Invoke-LaunchUrl  $SearchUrlTemplate
}

function SearchGoogleImagesScreenshot
{
    param(
        $scriptGameMenuItemActionArgs
    )
    
    # Set dimensions of image search
    $width = '1920'
    $height = '1080'

    # Set Search Url template and invoke Url launch function
    $SearchUrlTemplate = 'https://www.google.com/search?q={0} Screenshot imagesize:' + "$width" + 'x' + "$height" + '&tbm=isch'
    Invoke-LaunchUrl  $SearchUrlTemplate	
}
function SearchMetacritic
{
    param(
        $scriptGameMenuItemActionArgs
    )
    
    # Set Search Url template and invoke Url launch function
    $SearchUrlTemplate = 'https://www.metacritic.com/search/game/{0}/results' 
    Invoke-LaunchUrl  $SearchUrlTemplate
}

function SearchSteamGridDB
{
    param(
        $scriptGameMenuItemActionArgs
    )
    
    # Set Search Url template and invoke Url launch function
    $SearchUrlTemplate = 'https://www.steamgriddb.com/search/grids?term={0}'
    Invoke-LaunchUrl  $SearchUrlTemplate
}

function SearchTwitch
{
    param(
        $scriptGameMenuItemActionArgs
    )
    
    # Set Search Url template and invoke Url launch function
    $SearchUrlTemplate = 'https://www.twitch.tv/search?term={0}'
    Invoke-LaunchUrl  $SearchUrlTemplate
}

function SearchVNDB
{
    param(
        $scriptGameMenuItemActionArgs
    )
    
    # Set Search Url template and invoke Url launch function
    $SearchUrlTemplate = 'https://vndb.org/v/all?q={0}'
    Invoke-LaunchUrl  $SearchUrlTemplate
}

function SearchYoutube
{
    param(
        $scriptGameMenuItemActionArgs
    )
    
    # Set Search Url template and invoke Url launch function
    $SearchUrlTemplate = 'https://www.youtube.com/results?search_query={0}'
    Invoke-LaunchUrl  $SearchUrlTemplate
}

function SearchPCGamingWiki
{
    param(
        $scriptGameMenuItemActionArgs
    )
    
    # Set GameDatabase
    $GameDatabase = $PlayniteApi.MainView.SelectedGames

    foreach ($game in $GameDatabase) {
        if ($null -eq $game.Platforms)
        {
            continue
        }
        else
        {
            $isTargetSpecification = $false
            foreach ($platform in $game.Platforms) {
                if ($null -eq $platform.SpecificationId)
                {
                    continue
                }
                if ($platform.SpecificationId -eq "pc_windows")
                {
                    $isTargetSpecification = $true
                    break
                }
            }
            if ($isTargetSpecification -eq $false)
            {
                continue
            }
        }

        if ([Playnite.SDK.BuiltinExtensions]::GetExtensionFromId($game.PluginId) -eq "SteamLibrary")
        {
            $SearchUrl = 'https://pcgamingwiki.com/api/appid.php?appid=' + "$($game.GameId)"
            Start-Process  $SearchUrl
        }
        else
        {
            $SearchUrl = 'http://pcgamingwiki.com/w/index.php?search=' + "$($game.name)"
            Start-Process  $SearchUrl
        }
    }
}

function SearchSteamDB
{
    param(
        $scriptGameMenuItemActionArgs
    )
    
    # Set gamedatabase
    $GameDatabase = $PlayniteApi.MainView.SelectedGames

    # Launch Urls
    foreach ($game in $GameDatabase) {
        if ($null -eq $game.Platforms)
        {
            continue
        }
        else
        {
            $isTargetSpecification = $false
            foreach ($platform in $game.Platforms) {
                if ($null -eq $platform.SpecificationId)
                {
                    continue
                }
                if ($platform.SpecificationId -eq "pc_windows")
                {
                    $isTargetSpecification = $true
                    break
                }
            }
            if ($isTargetSpecification -eq $false)
            {
                continue
            }
        }

        if ([Playnite.SDK.BuiltinExtensions]::GetExtensionFromId($game.PluginId) -eq "SteamLibrary")
        {
            $SearchUrl = 'https://steamdb.info/app/' + "$($game.GameId)"
            Start-Process  $SearchUrl
        }
        else
        {
            $SearchUrl = 'https://steamdb.info/search/?a=app&q=' + "$($game.name)" + '&type=1&category=0'
            Start-Process  $SearchUrl
        }
    }
}