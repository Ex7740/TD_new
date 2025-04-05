local pipe = {}
local pipeFile = "card_pipe.txt"

function pipe.write(data)
    local f = io.open(pipeFile, "w")
    if f then
        f:write(data)
        f:close()
    end
end

function pipe.read()
    local f = io.open(pipeFile, "r")
    if f then
        local content = f:read("*a")
        f:close()
        if content ~= "" then
            -- Clear after reading
            local clear = io.open(pipeFile, "w")
            clear:write("")
            clear:close()
            return content
        end
    end
    return nil
end

return pipe
