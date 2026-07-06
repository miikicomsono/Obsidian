local cloneref = (cloneref or clonereference or function(instance: any)
    return instance
end)
local clonefunction = (clonefunction or copyfunction or function(func) 
    return func 
end)

local HttpService: HttpService = cloneref(game:GetService("HttpService"))
local isfolder, isfile, listfiles = isfolder, isfile, listfiles

if typeof(clonefunction) == "function" then
    -- Fix is_____ functions for shitsploits, those functions should never error, only return a boolean.

    local
        isfolder_copy,
        isfile_copy,
        listfiles_copy = clonefunction(isfolder), clonefunction(isfile), clonefunction(listfiles)

    local isfolder_success, isfolder_error = pcall(function()
        return isfolder_copy("test" .. tostring(math.random(1000000, 9999999)))
    end)

    if isfolder_success == false or typeof(isfolder_error) ~= "boolean" then
        isfolder = function(folder)
            local success, data = pcall(isfolder_copy, folder)
            return (if success then data else false)
        end

        isfile = function(file)
            local success, data = pcall(isfile_copy, file)
            return (if success then data else false)
        end

        listfiles = function(folder)
            local success, data = pcall(listfiles_copy, folder)
            return (if success then data else {})
        end
    end
end

local SchemeIndexes = { "FontColor", "MainColor", "AccentColor", "BackgroundColor", "OutlineColor" }
local ThemeManager = {
    Library = nil,

    Folder = "ObsidianLibSettings",

    AppliedToTab = false,
    DefaultThemeName = Revenant,

    BuiltInThemes = {
        ["Revenant"] = {
            1,
            { FontColor = "ffffff", MainColor = "292929", AccentColor = "ffffff", BackgroundColor = "1b1b1b", OutlineColor = "090909", FontFace = "Gotham", BackgroundImage = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVHoaOD-VvATzn3apSgwCZ82FX8rOIFJJwv6r5_A97PLraax2Aj6eLjCD-&s=10" },
        },
        ["Default Obsidian"] = {
            2,
            { FontColor = "ffffff", MainColor = "191919", AccentColor = "7d55ff", BackgroundColor = "000000", OutlineColor = "282828", FontFace = "Code", BackgroundImage = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVc3OiYJcTpQclFPtI3KbrDkg7b7n7LIWJ6NcV64HZ4g&s=10" },
        },
        ["Old Revenant."] = {
            4,
            { FontColor = "ffffff", MainColor = "191919", AccentColor = "a2a2a2", BackgroundColor = "161616", OutlineColor = "282828", FontFace = "Gotham", BackgroundImage = "https://images.wallpaperscraft.com/image/single/building_minimalism_bw_132403_800x600.jpg" },
        },
        ["Aurora"] = {
            5,
            { FontColor = "e0f7fa", MainColor = "2b303b", AccentColor = "81a1c1", BackgroundColor = "1c222b", OutlineColor = "3e4755", FontFace = "Gotham", BackgroundImage = "https://www.opovo.com.br/_midias/jpg/2024/07/09/800x600/1_aurora_boreal-27961271.jpg" },
        },
        ["BBot"] = {
            6,
            { FontColor = "ffffff", MainColor = "1e1e1e", AccentColor = "7e48a3", BackgroundColor = "1b1b1b", OutlineColor = "141414", FontFace = "Gotham", BackgroundImage = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlpRsKu5aY4yQcPUqwYtqUVCGNzCtmmyuep52uypvyoV9sSP8v1ozJ4q4&s=10" },
        },
        ["Berry Smoothie"] = {
            7,
            { FontColor = "ffffff", MainColor = "722f37", AccentColor = "d36ba6", BackgroundColor = "40102b", OutlineColor = "703060", FontFace = "Gotham" },
        },
        ["Buttercup"] = {
            8,
            { FontColor = "ffffff", MainColor = "967011", AccentColor = "ffeb3b", BackgroundColor = "3a301a", OutlineColor = "7a6d28", FontFace = "Gotham", BackgroundImage = "https://w0.peakpx.com/wallpaper/43/870/HD-wallpaper-yellow-autumn-leaves-forest-autumn-tree-nature-sky.jpg" },
        },
        ["Candy Cane"] = {
            9,
            { FontColor = "000000", MainColor = "ff9191", AccentColor = "ec3737", BackgroundColor = "fccbcb", OutlineColor = "b49797", FontFace = "Gotham", BackgroundImage = "https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA1L3JtNDg2LWJnLTAwNF8xLmpwZw.jpg" },
        },
        ["Candy Pop"] = {
            10,
            { FontColor = "ffffff", MainColor = "5e2e65", AccentColor = "00e6e6", BackgroundColor = "1c002a", OutlineColor = "4a0044", FontFace = "Gotham", BackgroundImage = "https://img.magnific.com/free-vector/paper-cut-abstract-background_474888-6375.jpg?semt=ais_hybrid&w=740&q=80" },
        },
        ["Canyon Clay"] = {
            11,
            { FontColor = "ffffff", MainColor = "7f5539", AccentColor = "d78e6c", BackgroundColor = "3a2117", OutlineColor = "6c4a3b", FontFace = "Gotham", BackgroundImage = "https://w0.peakpx.com/wallpaper/347/928/HD-wallpaper-brown-flower-field-during-daytime.jpg" },
        },
        ["Catppuccin"] = {
            12,
            { FontColor = "d9e0ee", MainColor = "302d41", AccentColor = "f5c2e7", BackgroundColor = "1e1e2e", OutlineColor = "575268", FontFace = "Gotham", BackgroundImage = "https://img.magnific.com/free-photo/space-galaxy-background_53876-93121.jpg?semt=ais_hybrid&w=740&q=80" },
        },
        ["Celestial"] = {
            13,
            { FontColor = "eaeaf2", MainColor = "1f1c3c", AccentColor = "7986cb", BackgroundColor = "0b0928", OutlineColor = "362e61", FontFace = "Gotham" },
        },
        ["Copper Canyon"] = {
            14,
            { FontColor = "ffffff", MainColor = "7c2d12", AccentColor = "ff7043", BackgroundColor = "38190a", OutlineColor = "5c321d", FontFace = "Gotham" },
        },
        ["Crimson Tide"] = {
            15,
            { FontColor = "ffffff", MainColor = "5a0000", AccentColor = "ff1744", BackgroundColor = "330000", OutlineColor = "990000", FontFace = "Gotham" },
        },
        ["Cyberpunk"] = {
            16,
            { FontColor = "f9f9f9", MainColor = "262335", AccentColor = "00ff9f", BackgroundColor = "1a1a2e", OutlineColor = "413c5e", FontFace = "Gotham" },
        },
        ["Deep Space"] = {
            17,
            { FontColor = "cfd8dc", MainColor = "0d1b2a", AccentColor = "4e8bbf", BackgroundColor = "081421", OutlineColor = "284259", FontFace = "Gotham" },
        },
        ["Desert Storm"] = {
            18,
            { FontColor = "ffffff", MainColor = "c6ab80", AccentColor = "af8e6a", BackgroundColor = "372d26", OutlineColor = "6b5541", FontFace = "Gotham" },
        },
        ["Dracula"] = {
            19,
            { FontColor = "f8f8f2", MainColor = "44475a", AccentColor = "ff79c6", BackgroundColor = "282a36", OutlineColor = "6272a4", FontFace = "Gotham" },
        },
        ["Dust Bowl"] = {
            20,
            { FontColor = "ffffff", MainColor = "5c4537", AccentColor = "b2957e", BackgroundColor = "3b3024", OutlineColor = "7a6d58", FontFace = "Gotham" },
        },
        ["Dusty Rose"] = {
            21,
            { FontColor = "ffffff", MainColor = "ba6b6c", AccentColor = "f4a7b9", BackgroundColor = "3d1f23", OutlineColor = "70454b", FontFace = "Gotham" },
        },
        ["Electric Lime"] = {
            22,
            { FontColor = "d4d4d4", MainColor = "454f09", AccentColor = "aeea00", BackgroundColor = "222222", OutlineColor = "4f4f4f", FontFace = "Gotham" },
        },
        ["Emerald Dream"] = {
            23,
            { FontColor = "e0ffe0", MainColor = "014421", AccentColor = "33cc99", BackgroundColor = "001a10", OutlineColor = "02442b", FontFace = "Gotham" },
        },
        ["Fatality"] = {
            24,
            { FontColor = "ffffff", MainColor = "1e1842", AccentColor = "c50754", BackgroundColor = "191335", OutlineColor = "3c355d", FontFace = "Gotham" },
        },
        ["Flame Ember"] = {
            25,
            { FontColor = "ffffff", MainColor = "692423", AccentColor = "ff7043", BackgroundColor = "2e0005", OutlineColor = "8b3a3a", FontFace = "Gotham" },
        },
        ["Forest Mist"] = {
            26,
            { FontColor = "dcedc8", MainColor = "2e4d2b", AccentColor = "a8d5ba", BackgroundColor = "1b2f20", OutlineColor = "3c5a3d", FontFace = "Gotham" },
        },
        ["Glacial"] = {
            27,
            { FontColor = "e0f7fa", MainColor = "2c3e50", AccentColor = "4dd0e1", BackgroundColor = "1a2d3a", OutlineColor = "2c5f58", FontFace = "Gotham" },
        },
        ["Goldenrod"] = {
            28,
            { FontColor = "ffffff", MainColor = "8c7a3f", AccentColor = "ffd54f", BackgroundColor = "4c3d20", OutlineColor = "6e5e3a", FontFace = "Gotham" },
        },
        ["Graphite"] = {
            29,
            { FontColor = "d1d1d1", MainColor = "2b2b2b", AccentColor = "777777", BackgroundColor = "1a1a1a", OutlineColor = "444444", FontFace = "Gotham" },
        },
        ["Gruvbox"] = {
            30,
            { FontColor = "ebdbb2", MainColor = "3c3836", AccentColor = "fb4934", BackgroundColor = "282828", OutlineColor = "504945", FontFace = "Gotham" },
        },
        ["Iceberg"] = {
            31,
            { FontColor = "ffffff", MainColor = "1e3d59", AccentColor = "00b7ff", BackgroundColor = "12273d", OutlineColor = "30577a", FontFace = "Gotham" },
        },
        ["Inferno"] = {
            32,
            { FontColor = "ffffff", MainColor = "4b000f", AccentColor = "ff3300", BackgroundColor = "2e0005", OutlineColor = "7a0011", FontFace = "Gotham" },
        },
        ["Jade Forest"] = {
            33,
            { FontColor = "f0fff0", MainColor = "0a2c2a", AccentColor = "3bbf9b", BackgroundColor = "081d1b", OutlineColor = "205752", FontFace = "Gotham" },
        },
        ["Jester"] = {
            34,
            { FontColor = "ffffff", MainColor = "242424", AccentColor = "db4467", BackgroundColor = "1c1c1c", OutlineColor = "373737", FontFace = "Gotham" },
        },
        ["Lavender Mist"] = {
            35,
            { FontColor = "faf0ff", MainColor = "7e5a9b", AccentColor = "cba5e6", BackgroundColor = "44275a", OutlineColor = "71538c", FontFace = "Gotham" },
        },
        ["Lunar Eclipse"] = {
            36,
            { FontColor = "dcdcdc", MainColor = "2c2933", AccentColor = "908ec3", BackgroundColor = "1b1823", OutlineColor = "3e3a4e", FontFace = "Gotham" },
        },
        ["Marshmallow"] = {
            37,
            { FontColor = "000000", MainColor = "eccbea", AccentColor = "f8bbd0", BackgroundColor = "e4dfdf", OutlineColor = "96a8d7", FontFace = "Gotham" },
        },
        ["Material"] = {
            38,
            { FontColor = "eeffff", MainColor = "212121", AccentColor = "82aaff", BackgroundColor = "151515", OutlineColor = "424242", FontFace = "Gotham" },
        },
        ["Midnight Blue"] = {
            39,
            { FontColor = "e0eaf2", MainColor = "1a2634", AccentColor = "5c8fc0", BackgroundColor = "0f1221", OutlineColor = "2c3e50", FontFace = "Gotham" },
        },
        ["Midnight Orchid"] = {
            40,
            { FontColor = "f8f8ff", MainColor = "2a1e3b", AccentColor = "b86bbe", BackgroundColor = "1a0c27", OutlineColor = "4f2b55", FontFace = "Gotham" },
        },
        ["Mint"] = {
            41,
            { FontColor = "ffffff", MainColor = "242424", AccentColor = "3db488", BackgroundColor = "1c1c1c", OutlineColor = "373737", FontFace = "Gotham" },
        },
        ["Mint Chocolate"] = {
            42,
            { FontColor = "ffffff", MainColor = "2e4639", AccentColor = "a1c349", BackgroundColor = "1c2f24", OutlineColor = "3c5a4e", FontFace = "Gotham" },
        },
        ["Mocha Mist"] = {
            43,
            { FontColor = "f5e1da", MainColor = "6b4c3b", AccentColor = "bc987e", BackgroundColor = "3c2b24", OutlineColor = "795b48", FontFace = "Gotham" },
        },
        ["Monokai"] = {
            44,
            { FontColor = "f8f8f2", MainColor = "272822", AccentColor = "f92672", BackgroundColor = "1e1f1c", OutlineColor = "49483e", FontFace = "Gotham" },
        },
        ["Mystic Violet"] = {
            45,
            { FontColor = "f0e6ff", MainColor = "3e1f47", AccentColor = "ba68c8", BackgroundColor = "2a102f", OutlineColor = "5c3d63", FontFace = "Gotham" },
        },
        ["Neon Jungle"] = {
            46,
            { FontColor = "ccff99", MainColor = "1a1f27", AccentColor = "00ff88", BackgroundColor = "0d0d0d", OutlineColor = "2a2a2a", FontFace = "Gotham" },
        },
        ["Nord"] = {
            47,
            { FontColor = "eceff4", MainColor = "3b4252", AccentColor = "88c0d0", BackgroundColor = "2e3440", OutlineColor = "4c566a", FontFace = "Gotham" },
        },
        ["Ocean Breeze"] = {
            48,
            { FontColor = "e0f7fa", MainColor = "005377", AccentColor = "00bcd4", BackgroundColor = "002d3a", OutlineColor = "014f62", FontFace = "Gotham" },
        },
        ["Ocean Pearl"] = {
            49,
            { FontColor = "ffffff", MainColor = "036865", AccentColor = "42eecf", BackgroundColor = "002f3a", OutlineColor = "014f52", FontFace = "Gotham" },
        },
        ["Oceanic Next"] = {
            50,
            { FontColor = "d8dee9", MainColor = "1b2b34", AccentColor = "6699cc", BackgroundColor = "16232a", OutlineColor = "343d46", FontFace = "Gotham" },
        },
        ["One Dark"] = {
            51,
            { FontColor = "abb2bf", MainColor = "282c34", AccentColor = "c678dd", BackgroundColor = "21252b", OutlineColor = "5c6370", FontFace = "Gotham" },
        },
        ["Opal Glow"] = {
            52,
            { FontColor = "f0fff0", MainColor = "567572", AccentColor = "b2f5ea", BackgroundColor = "213837", OutlineColor = "2b4f3c", FontFace = "Gotham" },
        },
        ["Peach Fuzz"] = {
            53,
            { FontColor = "ffffff", MainColor = "b6846b", AccentColor = "ff8e72", BackgroundColor = "3a2525", OutlineColor = "7f5a56", FontFace = "Gotham" },
        },
        ["Peacock Feather"] = {
            54,
            { FontColor = "ffffff", MainColor = "004953", AccentColor = "00bcd4", BackgroundColor = "002f3d", OutlineColor = "006370", FontFace = "Gotham" },
        },
        ["Peanut Butter"] = {
            55,
            { FontColor = "ffffff", MainColor = "e1a95f", AccentColor = "ffca80", BackgroundColor = "2b221a", OutlineColor = "7a6326", FontFace = "Gotham" },
        },
        ["Quartz"] = {
            56,
            { FontColor = "ffffff", MainColor = "232330", AccentColor = "426e87", BackgroundColor = "1d1b26", OutlineColor = "27232f", FontFace = "Gotham" },
        },
        ["Retro Wave"] = {
            57,
            { FontColor = "f0f8ff", MainColor = "2d033b", AccentColor = "ff77ff", BackgroundColor = "1a0126", OutlineColor = "5b114b", FontFace = "Gotham" },
        },
        ["Rose Quartz"] = {
            58,
            { FontColor = "ffffff", MainColor = "c48793", AccentColor = "f7cad0", BackgroundColor = "2f1b24", OutlineColor = "6f4b57", FontFace = "Gotham" },
        },
        ["Sandstone"] = {
            59,
            { FontColor = "2e1e1e", MainColor = "c2b280", AccentColor = "d7b889", BackgroundColor = "f5e6ca", OutlineColor = "a79876", FontFace = "Gotham" },
        },
        ["Slate Grey"] = {
            60,
            { FontColor = "ffffff", MainColor = "607d8b", AccentColor = "b0bec5", BackgroundColor = "263238", OutlineColor = "546e7a", FontFace = "Gotham" },
        },
        ["Solar Flare"] = {
            61,
            { FontColor = "ffffff", MainColor = "4e1609", AccentColor = "ff7043", BackgroundColor = "2b0702", OutlineColor = "6f1e07", FontFace = "Gotham" },
        },
        ["Solarized"] = {
            62,
            { FontColor = "839496", MainColor = "073642", AccentColor = "cb4b16", BackgroundColor = "002b36", OutlineColor = "586e75", FontFace = "Gotham" },
        },
        ["Steel Blue"] = {
            63,
            { FontColor = "f1f5f9", MainColor = "1f3a58", AccentColor = "607d8b", BackgroundColor = "152439", OutlineColor = "2c526d", FontFace = "Gotham" },
        },
        ["Stormy Night"] = {
            64,
            { FontColor = "e0e0e0", MainColor = "2f3e4e", AccentColor = "627d98", BackgroundColor = "1b232f", OutlineColor = "34455b", FontFace = "Gotham" },
        },
        ["Sunrise Glow"] = {
            65,
            { FontColor = "ffffff", MainColor = "ad6700", AccentColor = "ffeb99", BackgroundColor = "3d281e", OutlineColor = "8c5200", FontFace = "Gotham" },
        },
        ["Sunset Horizon"] = {
            66,
            { FontColor = "ffffff", MainColor = "9f4f48", AccentColor = "fbc687", BackgroundColor = "2a0f0f", OutlineColor = "7b3f39", FontFace = "Gotham" },
        },
        ["Tokyo Night"] = {
            67,
            { FontColor = "ffffff", MainColor = "191925", AccentColor = "6759b3", BackgroundColor = "16161f", OutlineColor = "323232", FontFace = "Gotham" },
        },
        ["Tropical Punch"] = {
            68,
            { FontColor = "ffffff", MainColor = "e96c98", AccentColor = "ffc200", BackgroundColor = "4d2b47", OutlineColor = "e83296", FontFace = "Gotham" },
        },
        ["Twilight"] = {
            69,
            { FontColor = "e0e6f8", MainColor = "121212", AccentColor = "9fa8da", BackgroundColor = "0a0a0a", OutlineColor = "333444", FontFace = "Gotham" },
        },
        ["Ubuntu"] = {
            70,
            { FontColor = "ffffff", MainColor = "3e3e3e", AccentColor = "e2581e", BackgroundColor = "323232", OutlineColor = "191919", FontFace = "Gotham" },
        },
        ["Vintage Paper"] = {
            71,
            { FontColor = "2f2f2f", MainColor = "d8cfc4", AccentColor = "b89c73", BackgroundColor = "f3e9d2", OutlineColor = "a68f7c", FontFace = "Gotham" },
        },
        ["Vodka Lime"] = {
            72,
            { FontColor = "70a634", MainColor = "6f8740", AccentColor = "396b07", BackgroundColor = "2a2a2a", OutlineColor = "4f4f4f", FontFace = "Gotham" },
        },
    }
}

function ThemeManager:SetLibrary(Library)
    ThemeManager.Library = Library
end

--// Helpers \\--
local function Trim(Text: string)
    return Text:match("^%s*(.-)%s*$")
end

local function IsStringEmpty(String: string): boolean
    return if typeof(String) == "string" then Trim(String) == "" else true
end

local function IsValidFolderPath(Name: string): boolean
    return typeof(Name) == "string" and (
        Trim(Name) ~= "" and 
        not Name:match("^%s*$") and 
        not Name:find('[<>:"|%?%*%z]')
    )
end

--// Folder helper \\--
local function SplitPath(Path: string): {string}
	local Result = {}
	local Current = ""

	for Part in string.gmatch(Path, "[^/]+") do
		Current = if Current == "" then Part else (Current .. "/" .. Part)
		table.insert(Result, Current)
	end

	return Result
end

local function GetFolderPath(): false | string
    if IsStringEmpty(ThemeManager.Folder) then
        return false
    end

    return string.format("%s/themes", ThemeManager.Folder)
end

local GetCurrentThemesPath = GetFolderPath

--// Files helper \\--
local function GetThemePath(ThemeName: string): false | string
    local CurrentThemesPath = GetCurrentThemesPath()
    return if CurrentThemesPath == false then false else string.format("%s/%s.json", CurrentThemesPath, ThemeName)
end

local function DoesThemeExist(ThemeName: string, IncludeBuiltIn: boolean): boolean
    if ThemeManager.BuiltInThemes[ThemeName] then
        return true
    end

    local ThemePath = GetThemePath(ThemeName)
    return if ThemePath == false then false else isfile(ThemePath)
end

local function GetDefaultThemePath(): false | string
    local CurrentThemesPath = GetCurrentThemesPath()
    return if CurrentThemesPath == false then false else string.format("%s/default.txt", CurrentThemesPath)
end

--// Folders \\--
function ThemeManager:GetPaths(): {string}
    local FolderPath = GetFolderPath()
    return if FolderPath == false then {} else SplitPath(FolderPath)
end

function ThemeManager:BuildFolderTree(SkipWhenCreated: boolean?)
    local Paths = ThemeManager:GetPaths()
    if #Paths == 0 then
        return false
    end

    if SkipWhenCreated == true then
        if isfolder(Paths[1]) then
            return true
        end
    end

    for _, Path in Paths do
        if isfolder(Path) then continue end
        
        makefolder(Path)
    end

    return true
end

function ThemeManager:CheckFolderTree()
    return ThemeManager:BuildFolderTree(true)
end

function ThemeManager:SetFolder(Folder: string)
    assert(IsValidFolderPath(Folder), "Invalid path provided")

    ThemeManager.Folder = Folder
    ThemeManager:BuildFolderTree()
end

--// Theme Management \\--
function ThemeManager:ReloadCustomThemes()
    local SettingsPath = GetCurrentThemesPath()
    if SettingsPath == false then
        return {}
    end

    local SuccessList, Files = pcall(listfiles, SettingsPath)
    if not (SuccessList and typeof(Files) == "table") then
        ThemeManager.Library:Notify(string.format("Failed to load theme list: %s", tostring(Files)))
        return {}
    end

    local FileNames = {}
    for _, FilePath in Files do
        local RawFileName = FilePath:match("(.+)%..+$")
        if not RawFileName then continue end

        local Position = RawFileName:gsub("\\", "/"):find("/[^/]*$")
        local FileName = Position and RawFileName:sub(Position + 1) or RawFileName
        if not FileName or FileName == "default" then continue end

        table.insert(FileNames, FileName)
    end

    return FileNames
end

function ThemeManager:GetCustomTheme(ThemeName: string): any
    if IsStringEmpty(ThemeName) then
        return nil
    end

    local ThemePath = GetThemePath(ThemeName)
    if ThemePath == false or not isfile(ThemePath) then
        return nil
    end

    local SuccessRead, Content = pcall(readfile, ThemePath)
    if not SuccessRead then
        return nil
    end

    local SuccessDecode, Decoded = pcall(HttpService.JSONDecode, HttpService, Content)
    if not SuccessDecode or typeof(Decoded) ~= "table" then
        return nil
    end

    return Decoded
end

function ThemeManager:SaveCustomTheme(ThemeName: string): any
    if IsStringEmpty(ThemeName) then
        return false, "Invalid theme name provided"
    end

    if string.lower(ThemeName) == "default" then
        return false, "Invalid theme name provided"
    end

    local ThemePath = GetThemePath(ThemeName)
    if ThemePath == false then
        return false, "Invalid theme name provided"
    end

    ThemeManager:CheckFolderTree()

    local Library = ThemeManager.Library
    local ThemeData = {
        FontFace = Library.Options.FontFace.Value,
        BackgroundImage = Library.Options.BackgroundImage.Value
    }

    for _, SchemeIndex in SchemeIndexes do
        ThemeData[SchemeIndex] = Library.Options[SchemeIndex].Value:ToHex()
    end

    local SuccessEncode, EncodedData = pcall(HttpService.JSONEncode, HttpService, ThemeData)
    if not SuccessEncode then
        return false, "Failed to encode data"
    end

    local SuccessWrite, ErrorMessage = pcall(writefile, ThemePath, EncodedData)
    if not SuccessWrite then
        return false, "Failed to write theme file: " .. tostring(ErrorMessage)
    end

    return true
end

function ThemeManager:Delete(ThemeName: string): (boolean | string?)
    if IsStringEmpty(ThemeName) then
        return false, "No theme is selected"
    end

    local ThemePath = GetThemePath(ThemeName)
    if ThemePath == false or not isfile(ThemePath) then
        return false, "Theme file does not exist"
    end

    local SuccessDelete, ErrorMessage = pcall(delfile, ThemePath)
    if not SuccessDelete then
        return false, "Failed to delete theme file: " .. tostring(ErrorMessage)
    end

    if ThemeName == ThemeManager.DefaultThemeName then
        ThemeManager:DeleteDefaultTheme()
    end

    return true
end

--// Default Theme \\--
function ThemeManager:GetDefaultTheme(): (string, boolean, string?)
    ThemeManager:CheckFolderTree()

    local DefaultThemePath = GetDefaultThemePath()
    if DefaultThemePath == false then
        return "none", false, "Invalid path provided"
    end

    if not isfile(DefaultThemePath) then
        return "none", false, "Default theme is not set"
    end

    local SuccessRead, DefaultThemeName = pcall(readfile, DefaultThemePath)
    if not (SuccessRead and typeof(DefaultThemeName) == "string") then
        return "none", false, DefaultThemeName
    end

    local ConfigExists = DoesThemeExist(DefaultThemeName, true)
    if not ConfigExists then
        return "none", false, "Theme file not found"
    end

    ThemeManager.DefaultThemeName = DefaultThemeName
    return DefaultThemeName, true
end

function ThemeManager:SetDefaultTheme(Theme: any)
    assert(ThemeManager.Library, "Library is not set, call ThemeManager:SetLibrary(Library) first.")
    assert(not ThemeManager.AppliedToTab, "Cannot set default theme after applying ThemeManager to a tab!")

    local Library = ThemeManager.Library
    local DefaultThemeData = ThemeManager.BuiltInThemes["Default"][2]

    local LibraryScheme = {}
    local FinalTheme = {}

    for _, SchemeIndex in SchemeIndexes do
        local IndexData = Theme[SchemeIndex]
        local IndexType = typeof(IndexData)
        
        if IndexType == "Color3" then
            LibraryScheme[SchemeIndex] = IndexData
            FinalTheme[SchemeIndex] = string.format("#%s", IndexData:ToHex())

        elseif IndexType == "string" then
            LibraryScheme[SchemeIndex] = Color3.fromHex(IndexData)
            FinalTheme[SchemeIndex] = if IndexData:sub(1, 1) == "#" then IndexData else string.format("#%s", IndexData)
        
        else
            local Value = DefaultThemeData[SchemeIndex]
            LibraryScheme[SchemeIndex] = Color3.fromHex(Value)
            FinalTheme[SchemeIndex] = Value
        end
    end

    --// Font
    local FontFace = Theme["FontFace"]
    local FontFaceType = typeof(FontFace)
    
    if FontFaceType == "EnumItem" then
        LibraryScheme.Font = Font.fromEnum(FontFace)
        FinalTheme.FontFace = FontFace.Name

    elseif FontFaceType == "string" then
        LibraryScheme.Font = Font.fromEnum(Enum.Font[FontFace])
        FinalTheme.FontFace = FontFace
    
    else
        LibraryScheme.Font = Font.fromEnum(Enum.Font.Code)
        FinalTheme.FontFace = "Code"
    end

    --// Default Scheme Colors
    for _, DefaultSchemeColor in { "RedColor", "DestructiveColor", "DarkColor", "WhiteColor" } do
        LibraryScheme[DefaultSchemeColor] = Library.Scheme[DefaultSchemeColor]
    end

    --// Apply
    Library.Scheme = LibraryScheme
    ThemeManager.BuiltInThemes["Default"] = { 1, FinalTheme }

    Library:UpdateColorsUsingRegistry()
end

function ThemeManager:SaveDefault(ThemeName: string): (boolean, string?)
    if IsStringEmpty(ThemeName) then
        return false, "No theme is selected"
    end

    ThemeManager:CheckFolderTree()

    local DefaultThemePath = GetDefaultThemePath()
    if DefaultThemePath == false then
        return false, "Invalid path provided"
    end

    if not DoesThemeExist(ThemeName, true) then
        return false, "Theme does not exist"
    end

    local SuccessWrite, ErrorMessage = pcall(writefile, DefaultThemePath, ThemeName)
    if not SuccessWrite then
        return false, ErrorMessage
    end

    ThemeManager.DefaultThemeName = ThemeName
    return true
end

function ThemeManager:LoadDefault()
    local ThemeName, Success, FetchErrorMessage = ThemeManager:GetDefaultTheme()
    if not Success or FetchErrorMessage then
        if FetchErrorMessage ~= "Default theme is not set" then
            ThemeManager.Library:Notify(string.format("Failed to apply default theme: %s", FetchErrorMessage))
        end

        return
    end

    if not ThemeManager:GetCustomTheme(ThemeName) then
        ThemeManager.Library.Options.ThemeManager_ThemeList:SetValue(ThemeName)
        return
    end

    local SuccessLoad, LoadErrorMessage = ThemeManager:ApplyTheme(ThemeName)
    if not SuccessLoad then
        ThemeManager.Library:Notify(string.format("Failed to apply default theme: %s", LoadErrorMessage))
        return
    end

    ThemeManager.Library:Notify(string.format("Successfully applied default theme %q", ThemeName))
end

function ThemeManager:DeleteDefaultTheme(): (boolean, string?)
    ThemeManager:CheckFolderTree()

    local DefaultThemePath = GetDefaultThemePath()
    if DefaultThemePath == false then
        return false, "Invalid path provided"
    end

    if not isfile(DefaultThemePath) then
        return false, "Default theme is not set"
    end

    local SuccessDelete, ErrorMessage = pcall(delfile, DefaultThemePath)
    if not SuccessDelete then
        return false, ErrorMessage
    end

    ThemeManager.DefaultThemeName = nil
    return true
end

--// Apply Theme \\--
function ThemeManager:ThemeUpdate()
    local Library = ThemeManager.Library

    for _, SchemeIndex in SchemeIndexes do
        local Element = Library.Options[SchemeIndex]
        if not Element then continue end

        Library.Scheme[SchemeIndex] = Element.Value
    end

    Library:UpdateColorsUsingRegistry()
end

function ThemeManager:ApplyTheme(ThemeName: string)
    if IsStringEmpty(ThemeName) then
        return false, "No theme is selected"
    end

    local CustomThemeData = ThemeManager:GetCustomTheme(ThemeName)
    local Data = CustomThemeData or ThemeManager.BuiltInThemes[ThemeName]
    
    if not Data then
        return false, "Theme not found"
    end
    
    local Library = ThemeManager.Library
    local SchemeData = Data[2]
    local ThemeData = CustomThemeData or SchemeData

    for Index, Value in ThemeData do
        if Index == "VideoLink" then
            continue
        end

        local Element = Library.Options[Index]
        local FinalValue = Value

        if Index == "FontFace" then
            ThemeManager.Library:SetFont(Enum.Font[FinalValue])

        elseif Index == "BackgroundImage" then
            ThemeManager.Library:SetBackgroundImage(FinalValue)

        else
            FinalValue = Color3.fromHex(Value)
            Library.Scheme[Index] = FinalValue
        end

        if Element then
            Element:SetValue(FinalValue)
        end
    end

    -- Themes without a BackgroundImage key should clear whatever image a previous
    -- theme left behind (the loop above only runs for keys present in the data).
    if not ThemeData.BackgroundImage then
        ThemeManager.Library:SetBackgroundImage("")
        if Library.Options.BackgroundImage then
            Library.Options.BackgroundImage:SetValue("")
        end
    end

    ThemeManager:ThemeUpdate()
    return true
end

--// GUI \\--
local function ShowDialog(
    Condition: () -> boolean,

    Index: string, 
    Title: string, 
    Description: string,

    DestructiveText: string,
    DestructiveAction: () -> nil
)
    if Condition() == false then
        return DestructiveAction()
    end

    return ThemeManager.Library.Window:AddDialog(Index, {
        Title = Title,
        Description = Description,
        AutoDismiss = false,

        FooterButtons = {
            Cancel = {
                Title = "Cancel",
                Variant = "Ghost",
                Order = 1,
                Callback = function(Dialog)
                    Dialog:Dismiss()
                end
            },

            DestructiveAction = {
                Title = DestructiveText,
                Variant = "Destructive",
                Order = 2,
                Callback = function(Dialog)
                    Dialog:Dismiss()
                    DestructiveAction()
                end
            }
        }
    })
end

function ThemeManager:CreateThemeManager(Themesbox: any)
    assert(ThemeManager.Library, "Library is not set, call ThemeManager:SetLibrary(Library) first.")

    local BuiltInThemesNames = {}
    for Name, _ThemeData in ThemeManager.BuiltInThemes do
        table.insert(BuiltInThemesNames, Name)
    end

    local CustomThemeList, CustomThemeName, ThemeList, FontFace, BackgroundImage, DefaultThemeLabel
    local function RefreshList()
        CustomThemeList:SetValues(ThemeManager:ReloadCustomThemes())
        CustomThemeList:SetValue(nil)

        local PreviousValue = ThemeList.Value
        ThemeList:SetValues(BuiltInThemesNames)
        ThemeList:SetValue(PreviousValue)
    end

    local function RefreshDefaultThemeLabel()
        local DefaultThemeName, _Success, _ErrorMessage = ThemeManager:GetDefaultTheme()

        DefaultThemeLabel:SetText(string.format("Current default theme: %s", DefaultThemeName))
        if CustomThemeList then RefreshList() end
    end

    table.sort(BuiltInThemesNames, function(IndexA, IndexB)
        return ThemeManager.BuiltInThemes[IndexA][1] < ThemeManager.BuiltInThemes[IndexB][1]
    end)

    local function CreateColorOption(Text, SchemeIndex)
        Themesbox:AddLabel(Text):AddColorPicker(SchemeIndex, {
            Default = ThemeManager.Library.Scheme[SchemeIndex]
        })

        return ThemeManager.Library.Options[SchemeIndex]
    end

    local BackgroundColor = CreateColorOption("Background color", "BackgroundColor")
    local MainColor = CreateColorOption("Main color", "MainColor")
    local AccentColor = CreateColorOption("Accent color", "AccentColor")
    local OutlineColor = CreateColorOption("Outline color", "OutlineColor")
    local FontColor = CreateColorOption("Font color", "FontColor")
    
    Themesbox:AddDropdown("FontFace", {
        Text = "Font Face",
        Default = "Code",
        
        Values = { "BuilderSans", "Code", "Fantasy", "Gotham", "Jura", "Roboto", "RobotoMono", "SourceSans" },
        AllowNull = false,
        Multi = false
    })
    
    Themesbox:AddInput("BackgroundImage", {
        Text = "Background Image",

        Default = "",
        ClearTextOnFocus = false,
        ClearTextOnBlur = false
    })

    Themesbox:AddDivider()

    Themesbox:AddDropdown("ThemeManager_ThemeList", { 
        Text = "Theme list", 

        Values = BuiltInThemesNames,
        AllowNull = true,
        Multi = false,

        FormatDisplayValue = function(Value: any)
            if Value ~= "Default" and Value == ThemeManager.DefaultThemeName then
                return string.format("%s (default)", Value)
            end

            return Value
        end,
        FormatListValue = function(Value: any)
            if Value ~= "Default" and Value == ThemeManager.DefaultThemeName then
                return string.format("%s (default)", Value)
            end

            return Value
        end
    })

    Themesbox:AddButton("Set as default", function()
        local ThemeName = ThemeList.Value
        ThemeManager:SaveDefault(ThemeName)

        ThemeManager.Library:Notify(string.format("Successfully set default theme to %q", ThemeName))
        RefreshDefaultThemeLabel()
    end)

    Themesbox:AddDivider()

    CustomThemeName = Themesbox:AddInput("ThemeManager_CustomThemeName", { 
        Text = "Custom theme name" 
    })

    Themesbox:AddButton("Create theme", function()
        local Name = CustomThemeName.Value
        if IsStringEmpty(Name) then
            ThemeManager.Library:Notify("Theme name cannot be empty.")
            return
        end

        if string.lower(Name) == "default" then
            ThemeManager.Library:Notify("Invalid theme name provided.")
            return
        end

        ShowDialog(
            function(): boolean
                return ThemeManager:GetCustomTheme(Name) ~= nil
            end,

            "ThemeManager_CreateTheme",
            "Theme already exists",
            string.format("A custom theme named %q already exists. Overwriting it will replace it with your current colors.", Name),

            "Overwrite",
            function()
                local Success, ErrorMessage = ThemeManager:SaveCustomTheme(Name)
                if not Success then
                    ThemeManager.Library:Notify(string.format("Failed to create theme %q: %s", Name, ErrorMessage))
                    return
                end

                ThemeManager.Library:Notify(string.format("Successfully created theme %q", Name))
                RefreshList()
            end
        )
    end)

    Themesbox:AddDivider()

    CustomThemeList = Themesbox:AddDropdown("ThemeManager_CustomThemeList", { 
        Text = "Custom themes",

        Values = ThemeManager:ReloadCustomThemes(), 
        AllowNull = true,
        Multi = false,

        FormatDisplayValue = function(Value: any)
            if Value == ThemeManager.DefaultThemeName then
                return string.format("%s (default)", Value)
            end

            return Value
        end,
        FormatListValue = function(Value: any)
            if Value == ThemeManager.DefaultThemeName then
                return string.format("%s (default)", Value)
            end

            return Value
        end
    })

    Themesbox:AddButton("Load theme", function()
        local Name = CustomThemeList.Value
        if IsStringEmpty(Name) then
            ThemeManager.Library:Notify("Please select a theme first.")
            return
        end

        ThemeManager:ApplyTheme(Name)
        ThemeManager.Library:Notify(string.format("Successfully loaded theme %q", Name))
    end)

    Themesbox:AddButton("Overwrite theme", function()
        local Name = CustomThemeList.Value
        if IsStringEmpty(Name) then
            ThemeManager.Library:Notify("Please select a theme first.")
            return
        end

        ShowDialog(
            function(): boolean
                return true
            end,

            "ThemeManager_OverwriteTheme",
            "Overwrite theme",
            string.format("Are you sure you want to overwrite %q with your current colors? This cannot be undone.", Name),

            "Overwrite",
            function()
                ThemeManager:SaveCustomTheme(Name)
                ThemeManager.Library:Notify(string.format("Successfully overwrote theme %q", Name))
            end
        )
    end)

    Themesbox:AddButton("Delete theme", function()
        local Name = CustomThemeList.Value
        if IsStringEmpty(Name) then
            ThemeManager.Library:Notify("Please select a theme first.")
            return
        end

        ShowDialog(
            function(): boolean
                return true
            end,

            "ThemeManager_DeleteTheme",
            "Delete theme",
            string.format("Are you sure you want to delete %q? This cannot be undone.", Name),
            
            "Delete",
            function()
                local Success, ErrorMessage = ThemeManager:Delete(Name)
                if not Success then
                    ThemeManager.Library:Notify(string.format("Failed to delete theme: %s", ErrorMessage))
                    return
                end

                ThemeManager.Library:Notify(string.format("Successfully deleted theme %q", Name))
                RefreshDefaultThemeLabel()
            end
        )
    end)

    Themesbox:AddButton("Refresh list", RefreshList)

    Themesbox:AddButton("Set as default", function()
        local Name = CustomThemeList.Value
        if IsStringEmpty(Name) then
            ThemeManager.Library:Notify("Please select a theme first.")
            return
        end

        ThemeManager:SaveDefault(Name)
        ThemeManager.Library:Notify(string.format("Successfully set default theme to %q", Name))
        RefreshDefaultThemeLabel()
    end)

    Themesbox:AddButton("Reset default", function()
        ShowDialog(
            function(): boolean
                return true
            end,

            "ThemeManager_ResetDefault",
            "Reset default theme",
            "Are you sure you want to clear the default theme? The library will revert to its built-in default on next load.",
            
            "Reset",
            function()
                local Success, ErrorMessage = ThemeManager:DeleteDefaultTheme()
                if not Success then
                    ThemeManager.Library:Notify(string.format("Failed to reset default theme: %s", ErrorMessage))
                    return
                end

                ThemeManager.Library:Notify("Successfully reset default theme.")
                RefreshDefaultThemeLabel()
            end
        )
    end)

    DefaultThemeLabel = Themesbox:AddLabel("Current default theme: ...", true);

    --// Set Variables
    CustomThemeList, CustomThemeName, ThemeList, FontFace, BackgroundImage =
        ThemeManager.Library.Options.ThemeManager_CustomThemeList,
        ThemeManager.Library.Options.ThemeManager_CustomThemeName,
        ThemeManager.Library.Options.ThemeManager_ThemeList,
        ThemeManager.Library.Options.FontFace,
        ThemeManager.Library.Options.BackgroundImage;

    --// Handlers
    ThemeList:OnChanged(function()
        ThemeManager:ApplyTheme(ThemeList.Value)
    end)

    local function UpdateTheme()
        ThemeManager:ThemeUpdate()
    end

    BackgroundColor:OnChanged(UpdateTheme)
    MainColor:OnChanged(UpdateTheme)
    AccentColor:OnChanged(UpdateTheme)
    OutlineColor:OnChanged(UpdateTheme)
    FontColor:OnChanged(UpdateTheme)
    FontFace:OnChanged(function(Value) ThemeManager.Library:SetFont(Enum.Font[Value]) end)
    BackgroundImage:OnChanged(function(Value) ThemeManager.Library:SetBackgroundImage(Value) end)

    --// Load default
    ThemeManager:LoadDefault()
    ThemeManager.AppliedToTab = true
    RefreshDefaultThemeLabel()

    return Themesbox
end

function ThemeManager:CreateGroupBox(Tab: any, IconName: string)
    return Tab:AddLeftGroupbox("Themes", IconName or "paintbrush")
end

function ThemeManager:ApplyToTab(Tab: any, IconName: string)
    local Groupbox = ThemeManager:CreateGroupBox(Tab, IconName)
    return ThemeManager:CreateThemeManager(Groupbox)
end

function ThemeManager:ApplyToGroupbox(Groupbox: any)
    return ThemeManager:CreateThemeManager(Groupbox)
end

getgenv().ObsidianThemeManager = ThemeManager
return ThemeManager
