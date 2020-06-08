item_relearn_book_lua = class({})


function item_relearn_book_lua:OnSpellStart()
	if IsServer() then
		local hCaster = self:GetCaster()
		local hPlayer =  hCaster:GetPlayerOwner()
		if hCaster and hCaster:IsRealHero() and not hCaster:IsTempestDouble() and not hCaster:HasModifier("modifier_morphling_replicate")  then          
	       if hPlayer then
	       	   --如果正在选技能 不起作用
	           if hCaster.bSelectingAbility or hCaster.bRemovingAbility or hCaster.bSelectingSpellBook then
	           	   return
	           end
		       self:SpendCharge()
		       hCaster.bRemovingAbility = true
		       hCaster.sUISecret= CreateSecretKey()
		       local nPlayerID = hPlayer:GetPlayerID()
	           CustomGameEventManager:Send_ServerToPlayer(hPlayer,"ShowRelearnBookAbilitySelection",{ui_secret=hCaster.sUISecret,security_key=Security:GetSecurityKey(nPlayerID)})
	           EmitSoundOnClient("Item.TomeOfKnowledge",hPlayer)
	       end
		end
	end
end

