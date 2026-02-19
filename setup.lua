require("os")

local function panic(msg)
    print(msg or "Generic msg error, nil value.")
    os.exit()
end

local function exec(command)
    if (not command) then
        panic("nil argument command!")
    end
    os.execute(command)
end

-- defining useful variables
local aur_helper = "yay"

local home = os.getenv("HOME") or panic("Could not get $HOME!");

local dir = tostring( os.getenv("PWD") or panic("PWD error!"))

local function gen_install()
    local pacman
    local package

    local origin = io.open(dir.."/app_list", "r") or panic("origin!")
    local destiny = io.open(dir.."/install.sh", "w") or panic("destiny!")

    while (true) do
        local result = origin:read("*line")

        if (not result) then;break; end

        if (result == "[pacman]") then
            pacman = "pacman"
            destiny:write("#"..result.."\n")
            goto continue
        elseif (result == "[aur]") then
            pacman = aur_helper
            destiny:write("#"..result.."\n")
            goto continue
        elseif (result == "[shell]") then
            pacman = "shell"
            destiny:write("#"..result.."\n")
            goto continue
        elseif (string.len(result) <= 0) then
            goto continue
        else
            package = result
        end

        if (pacman == "pacman") then
            local cmd = "sudo "..pacman.." -S "..package.."\n"
            destiny:write(cmd)
            goto continue
        elseif (pacman == aur_helper) then
            local cmd = pacman.." -S "..package.."\n"
            destiny:write(cmd)
            goto continue
        end

        destiny:write(package.."\n")

        ::continue::
    end
    origin:close()
end

local function apply_settings()
    local cmd = "cp -ri "..dir.."/src/* "..home
    print("Do you agree to execute: '"..cmd.."'?\n(y-n)")
    if (io.read() == "y") then; exec(cmd); end
end

print("What do you want to do?\n0-Quit\n1-Apply Settings\n2-Generate install.sh")

local input = tonumber(io.read()) or panic("input error!")

if (input == 0) then
    return
elseif (input == 1) then
    apply_settings()
elseif (input == 2) then
    gen_install()
end
