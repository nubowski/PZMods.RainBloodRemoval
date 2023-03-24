local rainBloodRemoval = {}

rainBloodRemoval.debugMode = true           -- some log.debug stuff
local rainCheckCounter = 0                  -- rain check counter xD
local rainCheckInterval = 600               -- interval between checks (TODO change this system at all)
local rainThreshold = 0.5                   -- threshold modifier for removeBlood start

function rainBloodRemoval.debugPrint(...)   -- for log.debug function
    if rainBloodRemoval.debugMode then
        print(...)
    end
end

function rainBloodRemoval.removeBloodOnRain()
    -- main logic (TODO change this to global ceaning + coroutine)
    rainBloodRemoval.debugPrint("Removing blood")
    local cell = getCell()                              -- check cell
    local player = getSpecificPlayer(0)           -- get nearest player
    local playerX = math.floor(player:getX())           -- cordX
    local playerY = math.floor(player:getY())           -- cordY

    rainBloodRemoval.debugPrint("Player X coord is: ", playerX)
    rainBloodRemoval.debugPrint("Player Y coord is: ", playerY)

    local square = cell:getGridSquare(playerX, playerY, 0)   -- get tile under feet, 0 - ground level

    rainBloodRemoval.debugPrint("Cell Square is: ", tostring(square))

    if square then                                                 -- if TRUE or exist
        rainBloodRemoval.debugPrint("Square exists")

        if not square:getRoom() then                               -- if outside not inside
            rainBloodRemoval.debugPrint("Not inside a room")
            square:removeBlood(false, false)           -- call for removeBlood method
        else
            rainBloodRemoval.debugPrint("Inside a room")
        end
    else
        rainBloodRemoval.debugPrint("Square doesn't exist")
    end
end

function rainBloodRemoval.onTick()
    -- checker *dont like onTick for this (TODO change this for something in Events.* I have to look more detailed there)
    rainCheckCounter = rainCheckCounter + 1
    if rainCheckCounter >= rainCheckInterval then
        local isRaining = getClimateManager():isRaining()
        local rainIntensity = getClimateManager():getRainIntensity()

        rainBloodRemoval.debugPrint("isRaining: ", isRaining)
        rainBloodRemoval.debugPrint("Rain intensity: ", rainIntensity)

        if isRaining and rainIntensity >= rainThreshold then                -- rainThreshold was here
            rainBloodRemoval.debugPrint("Rain intensity above threshold")
            rainBloodRemoval.removeBloodOnRain()
        end
        rainCheckCounter = 0
    end
end

Events.OnTick.Add(rainBloodRemoval.onTick)

function rainBloodRemoval.onToggleDebug()
    rainBloodRemoval.debugMode = not rainBloodRemoval.debugMode
    print("RainBloodRemoval debug mode: ", rainBloodRemoval.debugMode and "On" or "Off")
end
