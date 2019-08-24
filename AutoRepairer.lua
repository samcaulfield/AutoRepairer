local frame = CreateFrame("Frame")
frame:RegisterEvent("MERCHANT_SHOW")
frame:SetScript("OnEvent",
    function(self, event, ...)
        if CanMerchantRepair() then
            local repairAllCostCopper, canRepair = GetRepairAllCost()

            -- Try paying for repairs using guild funds. If guilds funds couldn't be procured, pay with own funds.
            if CanGuildBankRepair() and repairAllCostCopper <= GetGuildBankWithdrawMoney() then
                RepairAllItems(1)
            else
                RepairAllItems()
            end

        end
    end)

