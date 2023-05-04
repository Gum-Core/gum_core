
exports('gumAPI',function()
    local self = {}

    ---@param source number
    ---@return table
    self.getCharacter = function(source)
        local timeout = 200 -- 5 seconds
        local user = nil
        TriggerEvent("gum:getCharacter", source, function(result)
            user = result
        end)

        while user == nil and timeout ~= 0 do
            timeout = timeout - 1
            Wait(25)
        end

        if timeout == 0 then
            -- print("gum Core: Callback is nil or not loaded ERROR: Timeout")
        end

        return (user)
    end

    ---@param source number
    ---@param currency number
    ---@param quantity number
    ---@return void
    self.addMoney = function(source, currency, quantity)
        TriggerEvent("gum:addMoney", source, tonumber(currency), tonumber(quantity))
    end

    ---@param source number
    ---@param currency number
    ---@param quantity number
    ---@return void
    self.removeMoney = function(source, currency, quantity)
        TriggerEvent("gum:removeMoney",source,tonumber(currency),tonumber(quantity))
    end

    ---@param source number
    ---@param jobName string
    ---@param grade number
    ---@return void
    self.setJob = function(source, jobName, grade)
        TriggerEvent("gum:setJob", source, jobName, grade)
    end
    
    ---@param source number
    ---@param groupName string
    ---@return void
    self.setGroup = function(source, groupName)
        TriggerEvent("gum:setGroup", source, groupName)
    end

    ---@param source number
    ---@param active boolean
    ---@return void
    self.setInstancePlayer = function(source, active)
        TriggerClientEvent("gum:setInstancePlayer",source, active)
    end

    ---@param name string
    ---@param fn function
    self.addNewCallBack = function(name, fn)
        TriggerEvent("gum:addNewCallBack", name, fn)
    end
    
    return (self)

end)