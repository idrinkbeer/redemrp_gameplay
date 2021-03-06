-- RedM Events

AddEventHandler('playerDropped', function()
    -- cache player id for dumb reasons
    local playerId = source
    
    -- we need to notify managers of this player dropping in case she is doing something there
    BountyHunter.OnPlayerDropped(playerId)
    Delivery.OnPlayerDropped(playerId)
    Doctor.OnPlayerDropped(playerId)
    Fisher.OnPlayerDropped(playerId)
    Hunter.OnPlayerDropped(playerId)
    Lawman.OnPlayerDropped(playerId)
    Moonshiner.OnPlayerDropped(playerId)
end)

-- Packet Handlers
Helpers.PacketHandler('player:GiveMoney', function(playerId, data)
    Players.GiveMoney(playerId, data.TargetId, data.Amount)
end)

Helpers.PacketHandler('player:BonusXP', function(playerId, data)
    Players.BonusXP(playerId)
end)

-- Class Functions
function Players.GiveMoney(playerId, targetId, amount)
    -- get from character
    Helpers.GetCharacter(playerId, function(character)
        -- validate from character has the money
        if (character.getMoney() < amount) then
            Helpers.Respond(playerId, '^1You don\'t have enough money to cover that, partner.')
            return
        end

        -- get the to character 
        Helpers.GetCharacter(targetId, function(targetCharacter)
            -- make the transfer
            targetCharacter.addMoney(amount)
            character.removeMoney(amount)

            -- notify players involved it happened
            Helpers.Respond(playerId, '^2You gave that person $' .. amount)
            Helpers.Respond(targetId, '^2You received $' .. amount)
        end)
    end)
end

function Players.BonusXP(playerId)
    Helpers.GetCharacter(playerId, function(character)
        if (character == nil) then
            return
        end

        local nextBonusAt = character.getSessionVar('NextBonusXP') or GetGameTimer()
        if (nextBonusAt > GetGameTimer()) then
            return
        end

        character.addXP(5)
        character.setSessionVar('NextBonusXP', GetGameTimer()+119000)

        -- todo
        -- the message feels annoying.
        -- add some kind of less annoying ui popup to show xp bonus
        --Helpers.Respond(playerId, '^2You received your 5 bonus XP.')
    end)
end