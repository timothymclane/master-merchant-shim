MMS = {}
MMS.Name = "MasterMerchantShim"
MasterMerchant = {}
MMGuild = {}

local function OnAddOnLoaded(event, addonName)
    if addonName == MMS.Name then
        MMS:Initialize()
    end
end

function MMS:Initialize()
    EVENT_MANAGER:UnregisterForEvent(ADDON_NAME, EVENT_ADD_ON_LOADED)
end

-- We're actually gonna just use the item link instead of making an index because ATT uses it
function MasterMerchant.makeIndexFromLink(itemLink)
    return itemLink
end

function MasterMerchant:toolTipStats(itemId, itemLink, skipDots, goBack, clickable)
    local averagePrice = ArkadiusTradeTools.Modules.Sales:GetAveragePricePerItem(itemLink)
    return {avgPrice = averagePrice}
end

function MasterMerchant:itemStats(itemLink, someBool)
    local averagePrice = ArkadiusTradeTools.Modules.Sales:GetAveragePricePerItem(itemLink)
    return {avgPrice = averagePrice}
end

function MasterMerchant:addStatsAndGraph(text, link, someBool)
    -- This is so CraftStore doesn't explode.
end

EVENT_MANAGER:RegisterForEvent(
    ADDON_NAME,
    EVENT_ADD_ON_LOADED,
    function(...)
        OnAddOnLoaded(...)
    end
)
