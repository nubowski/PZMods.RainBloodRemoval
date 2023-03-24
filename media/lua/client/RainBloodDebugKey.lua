



local RainBloodDebugKey = ISBaseObject:derive("RainBloodDebugKey")

function RainBloodDebugKey:execute(keyEvent)
    local isCtrlPressed = keyEvent:IsCtrlDown()
    local keyCharacter = string.lower(string.char(keyEvent:getKeyChar()))

    if isCtrlPressed and keyCharacter == 'd' then
        rainBloodRemoval.onToggleDebug(rainBloodRemoval)
    end
end

function RainBloodDebugKey:new()
    local o = {}
    setmetatable(o, self)
    self.__index = self
    return o
end

Events.OnKeyPressed.Add(RainBloodDebugKey:new():execute())