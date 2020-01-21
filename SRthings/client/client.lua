----------------------------------- simple effecient welcome message
intro = true
Citizen.CreateThread(function()  
repeat
Wait(0)
		drawTxt2(0.5, 0.100, 0.9,0.9,0.5, "Welcome to bla bla bla", 250, 250, 250, 255)
		drawTxt2(0.5, 0.200, 0.9,0.9,0.5, "line2", 250, 250, 250, 255)
		drawTxt2(0.5, 0.300, 0.9,0.9,0.5, "Line3", 250, 250, 250, 255)
		drawTxt2(0.5, 0.400, 0.9,0.9,0.5, "Press Space To Close", 250, 250, 250, 255)
until IsControlJustPressed(0,0xD9D0E1C0)
end)
	function drawTxt2(x,y ,width,height,scale, text, r,g,b,a)
	Citizen.InvokeNative(0xADA9255D, 1);
	SetTextCentre(true)
    SetTextScale(width, height)
    SetTextColor(r, g, b, a)
	DisplayText(text, x, y)
end
------------------------------------------------------


-----------------------------------------Make a carried entity(animal/fur) Persistant, should stop anything you pickup dissapearing
Citizen.CreateThread(function()  
	while true do
	Wait(1000)
	local ped = PlayerPedId()
	animal = Citizen.InvokeNative(0xD806CD2A4F2C2996, ped)
	NetworkRequestControlOfEntity(animal)
	SetEntityAsMissionEntity(animal,1,1)
	SetPickupGenerationRangeMultiplier(0)
	------------------- Make Vehicle you are in Persistant on clientside, should stop most vics you have used dissapearing 
		if IsPedInAnyVehicle(0,ped) == true then
		SetEntityAsMissionEntity(GetVehiclePedisIn(ped,false),1,1)
		end
	----------------------------------------------------------------------------------------------------------------------
	end
end)
-----------------------------------------------------------------------------------------------------------------------



-------------------------------------------- stops you from punching sombody infront of you if you are aiming a weapon
Citizen.CreateThread(function()
Wait(0)
local ped = GetPlayerPed(-1)
	while true do
		Citizen.Wait(0)
		 ped = GetPlayerPed(-1)
if IsPedWeaponReadyToShoot(ped) then 
DisableControlAction(0, 0x1E7D7275, true)
DisableControlAction(0, 0x2277FAE9, true)
DisableControlAction(0, 0xADEAF48C, true)
DisableControlAction(0, 0x018C47CF, true)
DisableControlAction(0, 0x91C9A817, true)
DisableControlAction(0, 0xBE1F4699, true)
end
end
end)
--------------------------------------------------------------------------------------------------------------------------


CreateThread(function()        --enable friendly fire
    while true do
	
    NetworkSetFriendlyFireOption(true)  
	Wait(10000)	---- No need to loop fast as its a toggle, but good to leave going just incase of problems. 
    end
end)




---------------------------------------------------------------------------Lighting GUN, cos why the fuck not lol 
RegisterNetEvent('iamagod')
AddEventHandler('iamagod', function()
	if imgod == true then
	imgod = false 
	else
	imgod = true 
	Godmode()
	end

end)

function Godmode()
repeat
	Wait(0)
Citizen.InvokeNative(0x59174F1AFE095B5A,-1148613331,1,1,130,1)	----------- set weather to storm, needed to lighting strikes 
if IsPlayerFreeAiming(PlayerId()) then
a,ent = GetEntityPlayerIsFreeAimingAt(PlayerId())
print(ent,GetEntityCoords(ent))
if IsControlJustPressed(1,0x07CE1E61) then
Lcoords = GetEntityCoords(ent)
TriggerServerEvent('zaphimup',Lcoords.x,Lcoords.y,Lcoords.z) ---------------- send command to all clients so all can see the show :)
end
end
until imgod == false
end

RegisterNetEvent('zaphimup')
AddEventHandler('zaphimup', function(x,y,z)
print"bang"
ForceLightningFlashAtCoords(x,y,z)


end)
-------------------------------------------------------------------end of god functions




------------------------------------------Hide / Show hud when Tab is held
Citizen.CreateThread(function()
	while true do 
	Wait(0)
	if IsControlPressed(0,0xAC4BD4F1)  or IsControlPressed(0,0x4CC0E2FE) then
	DisableControlAction(0, 0x9CC7A1A4, true)	
	DisplayHud(true)
	else
	DisplayHud(false)
	end
	local ped = PlayerPedId()	
	end
end)






-------------------------------------------------ped changer --- still need to add more peds
 pedlist = {  
	
	-- animals
	{ ['ped'] = "A_C_Alligator_01"},	
	{ ['ped'] = "A_C_Alligator_02"},	
	{ ['ped'] = "A_C_Alligator_03"},
	{ ['ped'] = "A_C_Armadillo_01"},	
	{ ['ped'] = "A_C_Badger_01"},
	{ ['ped'] = "A_C_Bear_01"},	
	{ ['ped'] = "A_C_BearBlack_01"},	
	{ ['ped'] = "A_C_Beaver_01"},	
	{ ['ped'] = "A_C_BigHornRam_01"},
	{ ['ped'] = "A_C_Boar_01"},	
	{ ['ped'] = "A_C_BoarLegendary_01"},
	{ ['ped'] = "A_C_Buck_01"}, 
	{ ['ped'] = "A_C_Buffalo_01"},	
	{ ['ped'] = "A_C_Buffalo_Tatanka_01"},	
	{ ['ped'] = "A_C_Bull_01"},	
	{ ['ped'] = "A_C_CaliforniaCondor_01"},
	{ ['ped'] = "A_C_Cardinal_01"},	
	{ ['ped'] = "A_C_Chicken_01"},	
	{ ['ped'] = "A_C_Cat_01"},	
	{ ['ped'] = "A_C_Chipmunk_01"},	
	{ ['ped'] = "A_C_Cormorant_01"},
	{ ['ped'] = "A_C_Cougar_01"},	
	{ ['ped'] = "A_C_Cow"},	
	{ ['ped'] = "A_C_Coyote_01"},	
	{ ['ped'] = "A_C_Crab_01"},	
	{ ['ped'] = "A_C_Crawfish_01"},
	{ ['ped'] = "A_C_Deer_01"},	
	{ ['ped'] = "A_C_DogAmericanFoxhound_01"},	
	{ ['ped'] = "A_C_DogAustralianSheperd_01"},	
	{ ['ped'] = "A_C_DogBluetickCoonhound_01"},	
	{ ['ped'] = "A_C_DogCatahoulaCur_01"},
	{ ['ped'] = "A_C_DogChesBayRetriever_01"},	
	{ ['ped'] = "A_C_DogCollie_01"},	
	{ ['ped'] = "A_C_DogHobo_01"},	
	{ ['ped'] = "A_C_DogHound_01"},	
	{ ['ped'] = "A_C_DogHusky_01"},
	{ ['ped'] = "A_C_DogLab_01"},	
	{ ['ped'] = "A_C_DogLion_01"},	
	{ ['ped'] = "A_C_DogPoodle_01"},	
	{ ['ped'] = "A_C_DogRufus_01"},	
	{ ['ped'] = "A_C_DogStreet_01"},
	{ ['ped'] = "A_C_Donkey_01"},	
	{ ['ped'] = "A_C_Elk_01"},
	{ ['ped'] = "A_C_Fox_01"},
	{ ['ped'] = "A_C_FrogBull_01"},
	{ ['ped'] = "A_C_GilaMonster_01"},
	{ ['ped'] = "A_C_Goat_01"},
	{ ['ped'] = "P_C_Horse_01"},
	{ ['ped'] = "A_C_Horse_AmericanPaint_Greyovero"},
	{ ['ped'] = "A_C_Horse_AmericanPaint_Overo"},
	{ ['ped'] = "A_C_Horse_AmericanPaint_SplashedWhite"},
	{ ['ped'] = "A_C_Horse_AmericanPaint_Tobiano"},
	{ ['ped'] = "A_C_Horse_AmericanStandardbred_Black"},
	{ ['ped'] = "A_C_Horse_AmericanStandardbred_Buckskin"},
	{ ['ped'] = "A_C_Horse_AmericanStandardbred_PalominoDapple"},
	{ ['ped'] = "A_C_Horse_AmericanStandardbred_SilverTailBuckskin"},
	{ ['ped'] = "A_C_Horse_Andalusian_DarkBay"},
	{ ['ped'] = "A_C_Horse_Andalusian_Perlino"},
	{ ['ped'] = "A_C_Horse_Andalusian_RoseGray"},
	{ ['ped'] = "A_C_Horse_Appaloosa_BlackSnowflake"},
	{ ['ped'] = "A_C_Horse_Appaloosa_Blanket"},
	{ ['ped'] = "A_C_Horse_Appaloosa_BrownLeopard"},
	{ ['ped'] = "A_C_Horse_Appaloosa_FewSpotted_PC"},
	{ ['ped'] = "A_C_Horse_Appaloosa_Leopard"},
	{ ['ped'] = "A_C_Horse_Appaloosa_LeopardBlanket"},
	{ ['ped'] = "A_C_Horse_Arabian_Black"},
	{ ['ped'] = "A_C_Horse_Arabian_Grey"},
	{ ['ped'] = "A_C_Horse_Arabian_RedChestnut"},
	{ ['ped'] = "A_C_Horse_Arabian_RedChestnut_PC"},
	{ ['ped'] = "A_C_Horse_Arabian_RoseGreyBay"},
	{ ['ped'] = "A_C_Horse_Arabian_WarpedBrindle_PC"},
	{ ['ped'] = "A_C_Horse_Arabian_White"},
	{ ['ped'] = "A_C_Horse_Ardennes_BayRoan"},
	{ ['ped'] = "A_C_Horse_Ardennes_IronGreyRoan"},
	{ ['ped'] = "A_C_Horse_Ardennes_StrawberryRoan"},
	{ ['ped'] = "A_C_Horse_Belgian_BlondChestnut"},
	{ ['ped'] = "A_C_Horse_Belgian_MealyChestnut"},
	{ ['ped'] = "A_C_Horse_Buell_WarVets"},
	{ ['ped'] = "A_C_Horse_DutchWarmblood_ChocolateRoan"},
	{ ['ped'] = "A_C_Horse_DutchWarmblood_SealBrown"},
	{ ['ped'] = "A_C_Horse_DutchWarmblood_SootyBuckskin"},
	{ ['ped'] = "A_C_Horse_EagleFlies"},
	{ ['ped'] = "A_C_Horse_Gang_Bill"},
	{ ['ped'] = "A_C_Horse_Gang_Charles"},
	{ ['ped'] = "A_C_Horse_Gang_Charles_EndlessSummer"},
	{ ['ped'] = "A_C_Horse_Gang_Dutch"},
	{ ['ped'] = "A_C_Horse_Gang_Hosea"},
	{ ['ped'] = "A_C_Horse_Gang_Javier"},
	{ ['ped'] = "A_C_Horse_Gang_John"},
	{ ['ped'] = "A_C_Horse_Gang_Karen"},
	{ ['ped'] = "A_C_Horse_Gang_Kieran"},
	{ ['ped'] = "A_C_Horse_Gang_Lenny"},
	{ ['ped'] = "A_C_Horse_Gang_Micah"},
	{ ['ped'] = "A_C_Horse_Gang_Sadie"},
	{ ['ped'] = "A_C_Horse_Gang_Sadie_EndlessSummer"},
	{ ['ped'] = "A_C_Horse_Gang_Sean"},
	{ ['ped'] = "A_C_Horse_Gang_Trelawney"},
	{ ['ped'] = "A_C_Horse_Gang_Uncle"},
	{ ['ped'] = "A_C_Horse_Gang_Uncle_EndlessSummer"},
	{ ['ped'] = "A_C_Horse_HungarianHalfbred_DarkDappleGrey"},
	{ ['ped'] = "A_C_Horse_HungarianHalfbred_FlaxenChestnut"},
	{ ['ped'] = "A_C_Horse_HungarianHalfbred_LiverChestnut"},
	{ ['ped'] = "A_C_Horse_HungarianHalfbred_PiebaldTobiano"},
	{ ['ped'] = "A_C_Horse_John_EndlessSummer"},
	{ ['ped'] = "A_C_Horse_KentuckySaddle_Black"},
	{ ['ped'] = "A_C_Horse_KentuckySaddle_ButterMilkBuckskin_PC"},
	{ ['ped'] = "A_C_Horse_KentuckySaddle_ChestnutPinto"},
	{ ['ped'] = "A_C_Horse_KentuckySaddle_Grey"},
	{ ['ped'] = "A_C_Horse_KentuckySaddle_SilverBay"},
	{ ['ped'] = "A_C_Horse_MissouriFoxTrotter_AmberChampagne"},
	{ ['ped'] = "A_C_Horse_MissouriFoxTrotter_SableChampagne"},
	{ ['ped'] = "A_C_Horse_MissouriFoxTrotter_SilverDapplePinto"},
	{ ['ped'] = "A_C_Horse_Morgan_Bay"},
	{ ['ped'] = "A_C_Horse_Morgan_BayRoan"},
	{ ['ped'] = "A_C_Horse_Morgan_FlaxenChestnut"},
	{ ['ped'] = "A_C_Horse_Morgan_LiverChestnut_PC"},
	{ ['ped'] = "A_C_Horse_Morgan_Palomino"},
	{ ['ped'] = "A_C_Horse_MP_Mangy_Backup"},
	{ ['ped'] = "A_C_Horse_MurfreeBrood_Mange_01"},
	{ ['ped'] = "A_C_Horse_MurfreeBrood_Mange_02"},
	{ ['ped'] = "A_C_Horse_MurfreeBrood_Mange_03"},
	{ ['ped'] = "A_C_Horse_Mustang_GoldenDun"},
	{ ['ped'] = "A_C_Horse_Mustang_GrulloDun"},
	{ ['ped'] = "A_C_Horse_Mustang_TigerStripedBay"},
	{ ['ped'] = "A_C_Horse_Mustang_WildBay"},
	{ ['ped'] = "A_C_Horse_Nokota_BlueRoan"},
	{ ['ped'] = "A_C_Horse_Nokota_ReverseDappleRoan"},
	{ ['ped'] = "A_C_Horse_Nokota_WhiteRoan"},
	{ ['ped'] = "A_C_Horse_Shire_DarkBay"},
	{ ['ped'] = "A_C_Horse_Shire_LightGrey"},
	{ ['ped'] = "A_C_Horse_Shire_RavenBlack"},
	{ ['ped'] = "A_C_Horse_SuffolkPunch_RedChestnut"},
	{ ['ped'] = "A_C_Horse_SuffolkPunch_Sorrel"},
	{ ['ped'] = "A_C_Horse_TennesseeWalker_BlackRabicano"},
	{ ['ped'] = "A_C_Horse_TennesseeWalker_Chestnut"},
	{ ['ped'] = "A_C_Horse_TennesseeWalker_DappleBay"},
	{ ['ped'] = "A_C_Horse_TennesseeWalker_FlaxenRoan"},
	{ ['ped'] = "A_C_Horse_TennesseeWalker_GoldPalomino_PC"},
	{ ['ped'] = "A_C_Horse_TennesseeWalker_MahoganyBay"},
	{ ['ped'] = "A_C_Horse_TennesseeWalker_RedRoan"},
	{ ['ped'] = "A_C_Horse_Thoroughbred_BlackChestnut"},
	{ ['ped'] = "A_C_Horse_Thoroughbred_BloodBay"},
	{ ['ped'] = "A_C_Horse_Thoroughbred_Brindle"},
	{ ['ped'] = "A_C_Horse_Thoroughbred_DappleGrey"},
	{ ['ped'] = "A_C_Horse_Thoroughbred_ReverseDappleBlack"},
	{ ['ped'] = "A_C_Horse_Turkoman_DarkBay"},
	{ ['ped'] = "A_C_Horse_Turkoman_Gold"},
	{ ['ped'] = "A_C_Horse_Turkoman_Silver"},
	{ ['ped'] = "A_C_Horse_Winter02_01"},
	{ ['ped'] = "A_C_HorseMule_01"},
	{ ['ped'] = "A_C_HorseMulePainted_01"},
	{ ['ped'] = "A_C_Iguana_01"},
	{ ['ped'] = "A_C_IguanaDesert_01"},
	{ ['ped'] = "A_C_Javelina_01"},
	{ ['ped'] = "A_C_LionMangy_01"},
	{ ['ped'] = "A_C_Muskrat_01"},
	{ ['ped'] = "A_C_Moose_01"},
	{ ['ped'] = "A_C_Oriole_01"},
	{ ['ped'] = "A_C_Owl_01"},
	{ ['ped'] = "A_C_Ox_01"},
	{ ['ped'] = "A_C_Panther_01"},
	{ ['ped'] = "A_C_Parrot_01"},
	{ ['ped'] = "A_C_Pheasant_01"},
	{ ['ped'] = "A_C_Pig_01"},
	{ ['ped'] = "A_C_Possum_01"},
	{ ['ped'] = "A_C_PrairieChicken_01"},
	{ ['ped'] = "A_C_Pronghorn_01"},
	{ ['ped'] = "A_C_Quail_01"},
	{ ['ped'] = "A_C_Rabbit_01"},
	{ ['ped'] = "A_C_Raccoon_01"},
	{ ['ped'] = "A_C_Rat_01"},
	{ ['ped'] = "A_C_RedFootedBooby_01"},
	{ ['ped'] = "A_C_Rooster_01"},
	{ ['ped'] = "A_C_Sheep_01"},
	{ ['ped'] = "A_C_Skunk_01"},
	{ ['ped'] = "A_C_Snake_01"},
	{ ['ped'] = "A_C_SnakeBlackTailRattle_01"},
	{ ['ped'] = "A_C_SnakeFerDeLance_01"},
	{ ['ped'] = "A_C_SnakeRedBoa10ft_01"},
	{ ['ped'] = "A_C_SnakeRedBoa_01"},
	{ ['ped'] = "A_C_SnakeWater_01"},
	{ ['ped'] = "A_C_Squirrel_01"},
	{ ['ped'] = "A_C_Toad_01"},
	{ ['ped'] = "A_C_Turkey_01"},
	{ ['ped'] = "A_C_Turkey_02"},
	{ ['ped'] = "A_C_TurkeyWild_01"},
	{ ['ped'] = "A_C_TurtleSea_01"},
	{ ['ped'] = "A_C_TurtleSnapping_01"},
	{ ['ped'] = "A_C_Wolf"},
	{ ['ped'] = "A_C_Wolf_Medium"},
	{ ['ped'] = "A_C_Wolf_Small"},
	
	-- people
	{ ['ped'] = "A_F_M_ARMCHOLERACORPSE_01"},
	{ ['ped'] = "A_F_M_ARMTOWNFOLK_01"},
	{ ['ped'] = "A_F_M_ArmTownfolk_02"},
	{ ['ped'] = "A_F_M_AsbTownfolk_01"},
	{ ['ped'] = "A_F_M_BiVFancyTravellers_01"},
	{ ['ped'] = "A_F_M_BlWTownfolk_01"},
	{ ['ped'] = "A_F_M_BlWTownfolk_02"},
	{ ['ped'] = "A_F_M_BlWUpperClass_01"},
	{ ['ped'] = "A_F_M_BtcHillbilly_01"},
	{ ['ped'] = "A_F_M_BTCObeseWomen_01"},
	{ ['ped'] = "A_F_M_BynFancyTravellers_01"},
	{ ['ped'] = "A_F_M_FAMILYTRAVELERS_COOL_01"},
	{ ['ped'] = "A_F_M_FAMILYTRAVELERS_WARM_01"},
	{ ['ped'] = "A_F_M_GaMHighSociety_01"},
	{ ['ped'] = "A_F_M_GriFancyTravellers_01"},
	{ ['ped'] = "A_F_M_GuaTownfolk_01"},
	{ ['ped'] = "A_F_M_HtlFancyTravellers_01"},
	{ ['ped'] = "A_F_M_LagTownfolk_01"},
	{ ['ped'] = "A_F_M_LowerSDTownfolk_01"},
	{ ['ped'] = "A_F_M_LowerSDTownfolk_02"},
	{ ['ped'] = "A_F_M_LowerSDTownfolk_03"},
	{ ['ped'] = "A_F_M_LOWERTRAINPASSENGERS_01"},
	{ ['ped'] = "A_F_M_MiddleSDTownfolk_01"},
	{ ['ped'] = "A_F_M_MiddleSDTownfolk_02"},
	{ ['ped'] = "A_F_M_MiddleSDTownfolk_03"},
	{ ['ped'] = "A_F_M_MIDDLETRAINPASSENGERS_01"},
	{ ['ped'] = "A_F_M_NbxSlums_01"},
	{ ['ped'] = "A_F_M_NbxUpperClass_01"},
	{ ['ped'] = "A_F_M_NbxWhore_01"},
	{ ['ped'] = "A_F_M_RhdProstitute_01"},
	{ ['ped'] = "A_F_M_RhdTownfolk_01"},
	{ ['ped'] = "A_F_M_RhdTownfolk_02"},
	{ ['ped'] = "A_F_M_RhdUpperClass_01"},
	{ ['ped'] = "A_F_M_RkrFancyTravellers_01"},
	{ ['ped'] = "A_F_M_ROUGHTRAVELLERS_01"},
	{ ['ped'] = "A_F_M_SclFancyTravellers_01"},
	{ ['ped'] = "A_F_M_SDChinatown_01"},
	{ ['ped'] = "A_F_M_SDFancyWhore_01"},
	{ ['ped'] = "A_F_M_SDObeseWomen_01"},
	{ ['ped'] = "A_F_M_SDSERVERSFORMAL_01"},
	{ ['ped'] = "A_F_M_SDSlums_02"},
	{ ['ped'] = "A_F_M_SKPPRISONONLINE_01"},
	{ ['ped'] = "A_F_M_StrTownfolk_01"},
	{ ['ped'] = "A_F_M_TumTownfolk_01"},
	{ ['ped'] = "A_F_M_TumTownfolk_02"},
	{ ['ped'] = "A_F_M_UniCorpse_01"},
	{ ['ped'] = "A_F_M_UPPERTRAINPASSENGERS_01"},
	{ ['ped'] = "A_F_M_ValProstitute_01"},
	{ ['ped'] = "A_F_M_ValTownfolk_01"},
	{ ['ped'] = "A_F_M_VhtProstitute_01"},
	{ ['ped'] = "A_F_M_VhtTownfolk_01"},
	{ ['ped'] = "A_F_M_WapTownfolk_01"},
	{ ['ped'] = "A_F_O_BlWUpperClass_01"},
	{ ['ped'] = "A_F_O_BtcHillbilly_01"},
	{ ['ped'] = "A_F_O_GuaTownfolk_01"},
	{ ['ped'] = "A_F_O_LagTownfolk_01"},
	{ ['ped'] = "A_F_O_SDChinatown_01"},
	{ ['ped'] = "A_F_O_SDUpperClass_01"},
	{ ['ped'] = "A_F_O_WAPTOWNFOLK_01"},
	{ ['ped'] = "A_M_M_ARMCHOLERACORPSE_01"},
	{ ['ped'] = "A_M_M_ARMDEPUTYRESIDENT_01"},
	{ ['ped'] = "A_M_M_ARMTOWNFOLK_01"},
	{ ['ped'] = "A_M_M_armTOWNFOLK_02"},
	{ ['ped'] = "A_M_M_ASBBOATCREW_01"},
	{ ['ped'] = "A_M_M_ASBDEPUTYRESIDENT_01"},
	{ ['ped'] = "A_M_M_AsbMiner_01"},
	{ ['ped'] = "A_M_M_ASBMINER_02"},
	{ ['ped'] = "A_M_M_ASBMINER_03"},
	{ ['ped'] = "A_M_M_asbminer_04"},
	{ ['ped'] = "A_M_M_AsbTownfolk_01"},
	{ ['ped'] = "A_M_M_ASBTOWNFOLK_01_LABORER"},
	{ ['ped'] = "A_M_M_BiVFancyDRIVERS_01"},
	{ ['ped'] = "A_M_M_BiVFancyTravellers_01"},
	{ ['ped'] = "A_M_M_BiVRoughTravellers_01"},
	{ ['ped'] = "A_M_M_BiVWorker_01"},
	{ ['ped'] = "A_M_M_BlWForeman_01"},
	{ ['ped'] = "A_M_M_BlWLaborer_01"},
	{ ['ped'] = "A_M_M_BlWLaborer_02"},
	{ ['ped'] = "A_M_M_BLWObeseMen_01"},
	{ ['ped'] = "A_M_M_BlWTownfolk_01"},
	{ ['ped'] = "A_M_M_BlWUpperClass_01"},
	{ ['ped'] = "A_M_M_BtcHillbilly_01"},
	{ ['ped'] = "A_M_M_BTCObeseMen_01"},
	{ ['ped'] = "A_M_M_BynFancyDRIVERS_01"},
	{ ['ped'] = "A_M_M_BynFancyTravellers_01"},
	{ ['ped'] = "A_M_M_BynRoughTravellers_01"},
	{ ['ped'] = "A_M_M_BynSurvivalist_01"},
	{ ['ped'] = "A_M_M_CARDGAMEPLAYERS_01"},
	{ ['ped'] = "A_M_M_CHELONIAN_01"},
	{ ['ped'] = "A_M_M_DELIVERYTRAVELERS_COOL_01"},
	{ ['ped'] = "A_M_M_deliverytravelers_warm_01"},
	{ ['ped'] = "A_M_M_DOMINOESPLAYERS_01"},
	{ ['ped'] = "A_M_M_EmRFarmHand_01"},
	{ ['ped'] = "A_M_M_FAMILYTRAVELERS_COOL_01"},
	{ ['ped'] = "A_M_M_FAMILYTRAVELERS_WARM_01"},
	{ ['ped'] = "A_M_M_FARMTRAVELERS_COOL_01"},
	{ ['ped'] = "A_M_M_FARMTRAVELERS_WARM_01"},
	{ ['ped'] = "A_M_M_FiveFingerFilletPlayers_01"},
	{ ['ped'] = "A_M_M_FOREMAN"},
	{ ['ped'] = "A_M_M_GaMHighSociety_01"},
	{ ['ped'] = "A_M_M_GRIFANCYDRIVERS_01"},
	{ ['ped'] = "A_M_M_GriFancyTravellers_01"},
	{ ['ped'] = "A_M_M_GriRoughTravellers_01"},
	{ ['ped'] = "A_M_M_GriSurvivalist_01"},
	{ ['ped'] = "A_M_M_GuaTownfolk_01"},
	{ ['ped'] = "A_M_M_HtlFancyDRIVERS_01"},
	{ ['ped'] = "A_M_M_HtlFancyTravellers_01"},
	{ ['ped'] = "A_M_M_HtlRoughTravellers_01"},
	{ ['ped'] = "A_M_M_HtlSurvivalist_01"},
	{ ['ped'] = "A_M_M_huntertravelers_cool_01"},
	{ ['ped'] = "A_M_M_HUNTERTRAVELERS_WARM_01"},
	{ ['ped'] = "A_M_M_JamesonGuard_01"},
	{ ['ped'] = "A_M_M_LagTownfolk_01"},
	{ ['ped'] = "A_M_M_LowerSDTownfolk_01"},
	{ ['ped'] = "A_M_M_LowerSDTownfolk_02"},
	{ ['ped'] = "A_M_M_LOWERTRAINPASSENGERS_01"},
	{ ['ped'] = "A_M_M_MiddleSDTownfolk_01"},
	{ ['ped'] = "A_M_M_MiddleSDTownfolk_02"},
	{ ['ped'] = "A_M_M_MiddleSDTownfolk_03"},
	{ ['ped'] = "A_M_M_MIDDLETRAINPASSENGERS_01"},
	{ ['ped'] = "A_M_M_MOONSHINERS_01"},
	{ ['ped'] = "A_M_M_NbxDockWorkers_01"},
	{ ['ped'] = "A_M_M_NbxLaborers_01"},
	{ ['ped'] = "A_M_M_NbxSlums_01"},
	{ ['ped'] = "A_M_M_NbxUpperClass_01"},
	{ ['ped'] = "A_M_M_NEAROUGHTRAVELLERS_01"},
	{ ['ped'] = "A_M_M_RANCHER_01"},
	{ ['ped'] = "A_M_M_RANCHERTRAVELERS_COOL_01"},
	{ ['ped'] = "A_M_M_RANCHERTRAVELERS_WARM_01"},
	{ ['ped'] = "A_M_M_RHDDEPUTYRESIDENT_01"},
	{ ['ped'] = "A_M_M_RhdForeman_01"},
	{ ['ped'] = "A_M_M_RHDObeseMen_01"},
	{ ['ped'] = "A_M_M_RhdTownfolk_01"},
	{ ['ped'] = "A_M_M_RHDTOWNFOLK_01_LABORER"},
	{ ['ped'] = "A_M_M_RhdTownfolk_02"},
	{ ['ped'] = "A_M_M_RhdUpperClass_01"},
	{ ['ped'] = "A_M_M_RkrFancyDRIVERS_01"},
	{ ['ped'] = "A_M_M_RkrFancyTravellers_01"},
	{ ['ped'] = "A_M_M_RkrRoughTravellers_01"},
	{ ['ped'] = "A_M_M_RkrSurvivalist_01"},
	{ ['ped'] = "A_M_M_SclFancyDRIVERS_01"},
	{ ['ped'] = "A_M_M_SclFancyTravellers_01"},
	{ ['ped'] = "A_M_M_SclRoughTravellers_01"},
	{ ['ped'] = "A_M_M_SDChinatown_01"},
	{ ['ped'] = "A_M_M_SDDockForeman_01"},
	{ ['ped'] = "A_M_M_SDDockWorkers_02"},
	{ ['ped'] = "A_M_M_SDFANCYTRAVELLERS_01"},
	{ ['ped'] = "A_M_M_SDLaborers_02"},
	{ ['ped'] = "A_M_M_SDObesemen_01"},
	{ ['ped'] = "A_M_M_SDROUGHTRAVELLERS_01"},
	{ ['ped'] = "A_M_M_SDSERVERSFORMAL_01"},
	{ ['ped'] = "A_M_M_SDSlums_02"},
	{ ['ped'] = "A_M_M_SkpPrisoner_01"},
	{ ['ped'] = "A_M_M_SkpPrisonLine_01"},
	{ ['ped'] = "A_M_M_SmHThug_01"},
	{ ['ped'] = "A_M_M_STRDEPUTYRESIDENT_01"},
	{ ['ped'] = "A_M_M_STRFANCYTOURIST_01"},
	{ ['ped'] = "A_M_M_StrLaborer_01"},
	{ ['ped'] = "A_M_M_StrTownfolk_01"},
	{ ['ped'] = "A_M_M_TumTownfolk_01"},
	{ ['ped'] = "A_M_M_TumTownfolk_02"},
	{ ['ped'] = "A_M_M_UniBoatCrew_01"},
	{ ['ped'] = "A_M_M_UniCoachGuards_01"},
	{ ['ped'] = "A_M_M_UniCorpse_01"},
	{ ['ped'] = "A_M_M_UniGunslinger_01"},
	{ ['ped'] = "A_M_M_UPPERTRAINPASSENGERS_01"},
	{ ['ped'] = "A_M_M_VALCRIMINALS_01"},
	{ ['ped'] = "A_M_M_VALDEPUTYRESIDENT_01"},
	{ ['ped'] = "A_M_M_ValFarmer_01"},
	{ ['ped'] = "A_M_M_ValLaborer_01"},
	{ ['ped'] = "A_M_M_ValTownfolk_01"},
	{ ['ped'] = "A_M_M_ValTownfolk_02"},
	{ ['ped'] = "A_M_M_VHTBOATCREW_01"},
	{ ['ped'] = "A_M_M_VhtThug_01"},
	{ ['ped'] = "A_M_M_VhtTownfolk_01"},
	{ ['ped'] = "A_M_M_WapWarriors_01"},
	{ ['ped'] = "A_M_O_BlWUpperClass_01"},
	{ ['ped'] = "A_M_O_BtcHillbilly_01"},
	{ ['ped'] = "A_M_O_GuaTownfolk_01"},
	{ ['ped'] = "A_M_O_LagTownfolk_01"},
	{ ['ped'] = "A_M_O_SDChinatown_01"},
	{ ['ped'] = "A_M_O_SDUpperClass_01"},
	{ ['ped'] = "A_M_O_WAPTOWNFOLK_01"},
	{ ['ped'] = "A_M_Y_AsbMiner_01"},
	{ ['ped'] = "A_M_Y_AsbMiner_02"},
	{ ['ped'] = "A_M_Y_ASBMINER_03"},
	{ ['ped'] = "A_M_Y_ASBMINER_04"},
	{ ['ped'] = "A_M_Y_NbxStreetKids_01"},
	{ ['ped'] = "A_M_Y_NbxStreetKids_Slums_01"},
	{ ['ped'] = "A_M_Y_SDStreetKids_Slums_02"},
	{ ['ped'] = "A_M_Y_UniCorpse_01"},
	{ ['ped'] = "CS_abe"},
	{ ['ped'] = "CS_AberdeenPigFarmer"},
	{ ['ped'] = "CS_AberdeenSister"},
	{ ['ped'] = "CS_abigailroberts"},
	{ ['ped'] = "CS_Acrobat"},
	{ ['ped'] = "CS_adamgray"},
	{ ['ped'] = "CS_AgnesDowd"},
	{ ['ped'] = "CS_albertcakeesquire"},
	{ ['ped'] = "CS_albertmason"},
	{ ['ped'] = "CS_AndersHelgerson"},
	{ ['ped'] = "CS_ANGEL"},
	{ ['ped'] = "CS_angryhusband"},
	{ ['ped'] = "CS_angusgeddes"},
	{ ['ped'] = "CS_ansel_atherton"},
	{ ['ped'] = "CS_ANTONYFOREMEN"},
	{ ['ped'] = "CS_archerfordham"},
	{ ['ped'] = "CS_archibaldjameson"},
	{ ['ped'] = "CS_ArchieDown"},
	{ ['ped'] = "CS_ARTAPPRAISER"},
	{ ['ped'] = "CS_ASBDEPUTY_01"},
	{ ['ped'] = "CS_ASHTON"},
	{ ['ped'] = "CS_balloonoperator"},
	{ ['ped'] = "CS_bandbassist"},
	{ ['ped'] = "CS_banddrummer"},
	{ ['ped'] = "CS_bandpianist"},
	{ ['ped'] = "CS_bandsinger"},
	{ ['ped'] = "CS_baptiste"},
	{ ['ped'] = "CS_bartholomewbraithwaite"},
	{ ['ped'] = "CS_BATHINGLADIES_01"},
	{ ['ped'] = "CS_BATHINGLADIES_01"},
	{ ['ped'] = "CS_beaugray"},
	{ ['ped'] = "CS_billwilliamson"},
	{ ['ped'] = "CS_BivCoachDriver"},
	{ ['ped'] = "CS_BLWPHOTOGRAPHER"},
	{ ['ped'] = "CS_BLWWITNESS"},
	{ ['ped'] = "CS_braithwaitebutler"},
	{ ['ped'] = "CS_braithwaitemaid"},
	{ ['ped'] = "CS_braithwaiteservant"},
	{ ['ped'] = "CS_brendacrawley"},
	{ ['ped'] = "CS_bronte"},
	{ ['ped'] = "CS_BrontesButler"},
	{ ['ped'] = "CS_brotherdorkins"},
	{ ['ped'] = "CS_brynntildon"},
	{ ['ped'] = "CS_Bubba"},
	{ ['ped'] = "CS_CABARETMC"},
	{ ['ped'] = "CS_CAJUN"},
	{ ['ped'] = "CS_cancan_01"},
	{ ['ped'] = "CS_cancan_02"},
	{ ['ped'] = "CS_cancan_03"},
	{ ['ped'] = "CS_cancan_04"},
	{ ['ped'] = "CS_CanCanMan_01"},
	{ ['ped'] = "CS_captainmonroe"},
	{ ['ped'] = "CS_Cassidy"},
	{ ['ped'] = "CS_catherinebraithwaite"},
	{ ['ped'] = "CS_cattlerustler"},
	{ ['ped'] = "CS_CAVEHERMIT"},
	{ ['ped'] = "CS_chainprisoner_01"},
	{ ['ped'] = "CS_chainprisoner_02"},
	{ ['ped'] = "CS_charlessmith"},
	{ ['ped'] = "CS_ChelonianMaster"},
	{ ['ped'] = "CS_CIGCARDGUY"},
	{ ['ped'] = "CS_clay"},
	{ ['ped'] = "CS_CLEET"},
	{ ['ped'] = "CS_clive"},
	{ ['ped'] = "CS_colfavours"},
	{ ['ped'] = "CS_ColmODriscoll"},
	{ ['ped'] = "CS_COOPER"},
	{ ['ped'] = "CS_CornwallTrainConductor"},
	{ ['ped'] = "CS_crackpotinventor"},
	{ ['ped'] = "CS_crackpotRobot"},
	{ ['ped'] = "CS_creepyoldlady"},
	{ ['ped'] = "CS_creolecaptain"},
	{ ['ped'] = "CS_creoledoctor"},
	{ ['ped'] = "CS_creoleguy"},
	{ ['ped'] = "CS_dalemaroney"},
	{ ['ped'] = "CS_DaveyCallender"},
	{ ['ped'] = "CS_davidgeddes"},
	{ ['ped'] = "CS_DESMOND"},
	{ ['ped'] = "CS_DIDSBURY"},
	{ ['ped'] = "CS_DinoBonesLady"},
	{ ['ped'] = "CS_DisguisedDuster_01"},
	{ ['ped'] = "CS_DisguisedDuster_02"},
	{ ['ped'] = "CS_DisguisedDuster_03"},
	{ ['ped'] = "CS_DOROETHEAWICKLOW"},
	{ ['ped'] = "CS_DrHiggins"},
	{ ['ped'] = "CS_DrMalcolmMacIntosh"},
	{ ['ped'] = "CS_duncangeddes"},
	{ ['ped'] = "CS_DusterInformant_01"},
	{ ['ped'] = "CS_dutch"},
	{ ['ped'] = "CS_EagleFlies"},
	{ ['ped'] = "CS_edgarross"},
	{ ['ped'] = "CS_EDITH_JOHN"},
	{ ['ped'] = "CS_EdithDown"},
	{ ['ped'] = "CS_edmundlowry"},
	{ ['ped'] = "CS_EscapeArtist"},
	{ ['ped'] = "CS_EscapeArtistAssistant"},
	{ ['ped'] = "CS_evelynmiller"},
	{ ['ped'] = "CS_EXCONFEDINFORMANT"},
	{ ['ped'] = "CS_exconfedsleader_01"},
	{ ['ped'] = "CS_EXOTICCOLLECTOR"},
	{ ['ped'] = "CS_famousgunslinger_01"},
	{ ['ped'] = "CS_famousgunslinger_02"},
	{ ['ped'] = "CS_famousgunslinger_03"},
	{ ['ped'] = "CS_famousgunslinger_04"},
	{ ['ped'] = "CS_FamousGunslinger_05"},
	{ ['ped'] = "CS_FamousGunslinger_06"},
	{ ['ped'] = "CS_FEATHERSTONCHAMBERS"},
	{ ['ped'] = "CS_FeatsOfStrength"},
	{ ['ped'] = "CS_FIGHTREF"},
	{ ['ped'] = "CS_Fire_Breather"},
	{ ['ped'] = "CS_FISHCOLLECTOR"},
	{ ['ped'] = "CS_forgivenhusband_01"},
	{ ['ped'] = "CS_forgivenwife_01"},
	{ ['ped'] = "CS_FORMYARTBIGWOMAN"},
	{ ['ped'] = "CS_FRANCIS_SINCLAIR"},
	{ ['ped'] = "CS_frenchartist"},
	{ ['ped'] = "CS_FRENCHMAN_01"},
	{ ['ped'] = "CS_fussar"},
	{ ['ped'] = "CS_garethbraithwaite"},
	{ ['ped'] = "CS_GAVIN"},
	{ ['ped'] = "CS_genstoryfemale"},
	{ ['ped'] = "CS_genstorymale"},
	{ ['ped'] = "CS_geraldbraithwaite"},
	{ ['ped'] = "CS_GermanDaughter"},
	{ ['ped'] = "CS_GermanFather"},
	{ ['ped'] = "CS_GermanMother"},
	{ ['ped'] = "CS_GermanSon"},
	{ ['ped'] = "CS_GILBERTKNIGHTLY"},
	{ ['ped'] = "CS_GLORIA"},
	{ ['ped'] = "CS_GrizzledJon"},
	{ ['ped'] = "CS_GuidoMartelli"},
	{ ['ped'] = "CS_HAMISH"},
	{ ['ped'] = "CS_hectorfellowes"},
	{ ['ped'] = "CS_henrilemiux"},
	{ ['ped'] = "CS_HERBALIST"},
	{ ['ped'] = "CS_hercule"},
	{ ['ped'] = "CS_HestonJameson"},
	{ ['ped'] = "CS_hobartcrawley"},
	{ ['ped'] = "CS_hoseamatthews"},
	{ ['ped'] = "CS_IANGRAY"},
	{ ['ped'] = "CS_jackmarston"},
	{ ['ped'] = "CS_jackmarston_teen"},
	{ ['ped'] = "CS_JAMIE"},
	{ ['ped'] = "CS_JANSON"},
	{ ['ped'] = "CS_javierescuella"},
	{ ['ped'] = "CS_Jeb"},
	{ ['ped'] = "CS_jimcalloway"},
	{ ['ped'] = "CS_jockgray"},
	{ ['ped'] = "CS_JOE"},
	{ ['ped'] = "CS_JoeButler"},
	{ ['ped'] = "CS_johnmarston"},
	{ ['ped'] = "CS_JOHNTHEBAPTISINGMADMAN"},
	{ ['ped'] = "CS_JohnWeathers"},
	{ ['ped'] = "CS_josiahtrelawny"},
	{ ['ped'] = "CS_Jules"},
	{ ['ped'] = "CS_karen"},
	{ ['ped'] = "CS_KarensJohn_01"},
	{ ['ped'] = "CS_kieran"},
	{ ['ped'] = "CS_LARAMIE"},
	{ ['ped'] = "CS_leighgray"},
	{ ['ped'] = "CS_LemiuxAssistant"},
	{ ['ped'] = "CS_lenny"},
	{ ['ped'] = "CS_leon"},
	{ ['ped'] = "CS_leostrauss"},
	{ ['ped'] = "CS_LeviSimon"},
	{ ['ped'] = "CS_leviticuscornwall"},
	{ ['ped'] = "CS_LillianPowell"},
	{ ['ped'] = "CS_lillymillet"},
	{ ['ped'] = "CS_LondonderrySon"},
	{ ['ped'] = "CS_LUCANAPOLI"},
	{ ['ped'] = "CS_Magnifico"},
	{ ['ped'] = "CS_MAMAWATSON"},
	{ ['ped'] = "CS_MARSHALL_THURWELL"},
	{ ['ped'] = "CS_marybeth"},
	{ ['ped'] = "CS_marylinton"},
	{ ['ped'] = "CS_MEDITATINGMONK"},
	{ ['ped'] = "CS_Meredith"},
	{ ['ped'] = "CS_MeredithsMother"},
	{ ['ped'] = "CS_MicahBell"},
	{ ['ped'] = "CS_MicahsNemesis"},
	{ ['ped'] = "CS_Mickey"},
	{ ['ped'] = "CS_miltonandrews"},
	{ ['ped'] = "CS_missMarjorie"},
	{ ['ped'] = "CS_MIXEDRACEKID"},
	{ ['ped'] = "CS_MOIRA"},
	{ ['ped'] = "CS_mollyoshea"},
	{ ['ped'] = "CS_mradler"},
	{ ['ped'] = "CS_MRDEVON"},
	{ ['ped'] = "CS_MRLINTON"},
	{ ['ped'] = "CS_mrpearson"},
	{ ['ped'] = "CS_Mrs_Calhoun"},
	{ ['ped'] = "CS_MRS_SINCLAIR"},
	{ ['ped'] = "CS_mrsadler"},
	{ ['ped'] = "CS_MrsFellows"},
	{ ['ped'] = "CS_mrsgeddes"},
	{ ['ped'] = "CS_MrsLondonderry"},
	{ ['ped'] = "CS_MrsWeathers"},
	{ ['ped'] = "CS_MRWAYNE"},
	{ ['ped'] = "CS_mud2bigguy"},
	{ ['ped'] = "CS_MysteriousStranger"},
	{ ['ped'] = "CS_NbxDrunk"},
	{ ['ped'] = "CS_NbxExecuted"},
	{ ['ped'] = "CS_NbxPoliceChiefFormal"},
	{ ['ped'] = "CS_nbxreceptionist_01"},
	{ ['ped'] = "CS_NIAL_WHELAN"},
	{ ['ped'] = "CS_NicholasTimmins"},
	{ ['ped'] = "CS_NILS"},
	{ ['ped'] = "CS_NorrisForsythe"},
	{ ['ped'] = "CS_obediahhinton"},
	{ ['ped'] = "CS_oddfellowspinhead"},
	{ ['ped'] = "CS_ODProstitute"},
	{ ['ped'] = "CS_OPERASINGER"},
	{ ['ped'] = "CS_PAYTAH"},
	{ ['ped'] = "CS_penelopebraithwaite"},
	{ ['ped'] = "CS_PinkertonGoon"},
	{ ['ped'] = "CS_PoisonWellShaman"},
	{ ['ped'] = "CS_POORJOE"},
	{ ['ped'] = "CS_PRIEST_WEDDING"},
	{ ['ped'] = "CS_PrincessIsabeau"},
	{ ['ped'] = "CS_professorbell"},
	{ ['ped'] = "CS_rainsfall"},
	{ ['ped'] = "CS_RAMON_CORTEZ"},
	{ ['ped'] = "CS_ReverendFortheringham"},
	{ ['ped'] = "CS_revswanson"},
	{ ['ped'] = "CS_rhodeputy_01"},
	{ ['ped'] = "CS_RhoDeputy_02"},
	{ ['ped'] = "CS_RhodesAssistant"},
	{ ['ped'] = "CS_rhodeskidnapvictim"},
	{ ['ped'] = "CS_rhodessaloonbouncer"},
	{ ['ped'] = "CS_ringmaster"},
	{ ['ped'] = "CS_ROCKYSEVEN_WIDOW"},
	{ ['ped'] = "CS_samaritan"},
	{ ['ped'] = "CS_SCOTTGRAY"},
	{ ['ped'] = "CS_SD_STREETKID_01"},
	{ ['ped'] = "CS_SD_STREETKID_01A"},
	{ ['ped'] = "CS_SD_STREETKID_01B"},
	{ ['ped'] = "CS_SD_STREETKID_02"},
	{ ['ped'] = "CS_SDDoctor_01"},
	{ ['ped'] = "CS_SDPRIEST"},
	{ ['ped'] = "CS_SDSALOONDRUNK_01"},
	{ ['ped'] = "CS_SDStreetKidThief"},
	{ ['ped'] = "CS_sean"},
	{ ['ped'] = "CS_SHERIFFFREEMAN"},
	{ ['ped'] = "CS_SheriffOwens"},
	{ ['ped'] = "CS_sistercalderon"},
	{ ['ped'] = "CS_slavecatcher"},
	{ ['ped'] = "CS_SOOTHSAYER"},
	{ ['ped'] = "CS_strawberryoutlaw_01"},
	{ ['ped'] = "CS_strawberryoutlaw_02"},
	{ ['ped'] = "CS_strdeputy_01"},
	{ ['ped'] = "CS_strdeputy_02"},
	{ ['ped'] = "CS_strsheriff_01"},
	{ ['ped'] = "CS_SUNWORSHIPPER"},
	{ ['ped'] = "CS_susangrimshaw"},
	{ ['ped'] = "CS_SwampFreak"},
	{ ['ped'] = "CS_SWAMPWEIRDOSONNY"},
	{ ['ped'] = "CS_SwordDancer"},
	{ ['ped'] = "CS_tavishgray"},
	{ ['ped'] = "CS_TAXIDERMIST"},
	{ ['ped'] = "CS_theodorelevin"},
	{ ['ped'] = "CS_thomasdown"},
	{ ['ped'] = "CS_TigerHandler"},
	{ ['ped'] = "CS_tilly"},
	{ ['ped'] = "CS_TimothyDonahue"},
	{ ['ped'] = "CS_TINYHERMIT"},
	{ ['ped'] = "CS_tomdickens"},
	{ ['ped'] = "CS_TownCrier"},
	{ ['ped'] = "CS_TREASUREHUNTER"},
	{ ['ped'] = "CS_twinbrother_01"},
	{ ['ped'] = "CS_twinbrother_02"},
	{ ['ped'] = "CS_twingroupie_01"},
	{ ['ped'] = "CS_twingroupie_02"},
	{ ['ped'] = "CS_uncle"},
	{ ['ped'] = "CS_UNIDUSTERJAIL_01"},
	{ ['ped'] = "CS_valauctionboss_01"},
	{ ['ped'] = "CS_VALDEPUTY_01"},
	{ ['ped'] = "CS_ValPrayingMan"},
	{ ['ped'] = "CS_ValProstitute_01"},
	{ ['ped'] = "CS_ValProstitute_02"},
	{ ['ped'] = "CS_VALSHERIFF"},
	{ ['ped'] = "CS_Vampire"},
	{ ['ped'] = "CS_VHT_BATHGIRL"},
	{ ['ped'] = "CS_WapitiBoy"},
	{ ['ped'] = "CS_warvet"},
	{ ['ped'] = "CS_WATSON_01"},
	{ ['ped'] = "CS_WATSON_02"},
	{ ['ped'] = "CS_WATSON_03"},
	{ ['ped'] = "CS_WELSHFIGHTER"},
	{ ['ped'] = "CS_WintonHolmes"},
	{ ['ped'] = " CS_Wrobel "},
	{ ['ped'] = "G_F_M_UNIDUSTER_01"},
	{ ['ped'] = "G_M_M_BountyHunters_01"},
	{ ['ped'] = "G_M_M_UniAfricanAmericanGang_01"},
	{ ['ped'] = "G_M_M_UniBanditos_01"},
	{ ['ped'] = "G_M_M_UniBraithwaites_01"},
	{ ['ped'] = "G_M_M_UniBronteGoons_01"},
	{ ['ped'] = "G_M_M_UniCornwallGoons_01"},
	{ ['ped'] = "G_M_M_UniCriminals_01"},
	{ ['ped'] = "G_M_M_UniCriminals_02"},
	{ ['ped'] = "G_M_M_UniDuster_01"},
	{ ['ped'] = "G_M_M_UniDuster_02"},
	{ ['ped'] = "G_M_M_UniDuster_03"},
	{ ['ped'] = "G_M_M_UniDuster_04"},
	{ ['ped'] = "G_M_M_UNIDUSTER_05"},
	{ ['ped'] = "G_M_M_UniGrays_01"},
	{ ['ped'] = "G_M_M_UniGrays_02"},
	{ ['ped'] = "G_M_M_UniInbred_01"},
	{ ['ped'] = "G_M_M_UNILANGSTONBOYS_01"},
	{ ['ped'] = "G_M_M_UNIMICAHGOONS_01"},
	{ ['ped'] = "G_M_M_UniMountainMen_01"},
	{ ['ped'] = "G_M_M_UniRanchers_01"},
	{ ['ped'] = "G_M_M_UNISWAMP_01"},
	{ ['ped'] = "G_M_O_UniExConfeds_01"},
	{ ['ped'] = "G_M_Y_UniExConfeds_01"},
	{ ['ped'] = "G_M_Y_UNIEXCONFEDS_02"},
	{ ['ped'] = "MBH_RHODESRANCHER_FEMALES_0"},
	{ ['ped'] = "MBH_RHODESRANCHER_TEENS_01"},
	{ ['ped'] = "MBH_SKINNERSEARCH_MALES_01"},
	{ ['ped'] = "MCCLELLAN_SADDLE_01"},
	{ ['ped'] = "MES_ABIGAIL2_MALES_01"},
	{ ['ped'] = "MES_FINALE2_FEMALES_01"},
	{ ['ped'] = "MES_FINALE2_MALES_01"},
	{ ['ped'] = "MES_FINALE3_MALES_01"},
	{ ['ped'] = "MES_MARSTON1_MALES_01"},
	{ ['ped'] = "MES_MARSTON2_MALES_01"},
	{ ['ped'] = "MES_MARSTON5_2_MALES_01"},
	{ ['ped'] = "MES_MARSTON6_FEMALES_01"},
	{ ['ped'] = "MES_MARSTON6_MALES_01"},
	{ ['ped'] = "MES_MARSTON6_TEENS_01"},
	{ ['ped'] = "MES_SADIE4_MALES_01"},
	{ ['ped'] = "MES_SADIE5_MALES_01"},
	{ ['ped'] = "MOTHERHUBBARD_SADDLE_01"},
	{ ['ped'] = "mp_female"},
	{ ['ped'] = "mp_male"},
	{ ['ped'] = "MSP_BOUNTYHUNTER1_FEMALES_0"},
	{ ['ped'] = "MSP_BRAITHWAITES1_MALES_01"},
	{ ['ped'] = "MSP_FEUD1_MALES_01"},
	{ ['ped'] = "MSP_FUSSAR2_MALES_01"},
	{ ['ped'] = "MSP_GANG2_MALES_01"},
	{ ['ped'] = "MSP_GANG3_MALES_01"},
	{ ['ped'] = "MSP_GRAYS1_MALES_01"},
	{ ['ped'] = "MSP_GRAYS2_MALES_01"},
	{ ['ped'] = "MSP_GUARMA2_MALES_01"},
	{ ['ped'] = "MSP_INDUSTRY1_FEMALES_01"},
	{ ['ped'] = "MSP_INDUSTRY1_FEMALES_01"},
	{ ['ped'] = "MSP_INDUSTRY1_FEMALES_01"},
	{ ['ped'] = "MSP_INDUSTRY3_MALES_01"},
	{ ['ped'] = "MSP_MARY1_FEMALES_01"},
	{ ['ped'] = "MSP_MARY1_MALES_01"},
	{ ['ped'] = "MSP_MARY3_MALES_01"},
	{ ['ped'] = "MSP_MOB0_MALES_01"},
	{ ['ped'] = "MSP_MOB1_FEMALES_01"},
	{ ['ped'] = "MSP_MOB1_MALES_01"},
	{ ['ped'] = "MSP_MOB1_TEENS_01"},
	{ ['ped'] = "msp_mob3_FEMALES_01"},
	{ ['ped'] = "msp_mob3_MALES_01"},
	{ ['ped'] = "MSP_MUDTOWN3_MALES_01"},
	{ ['ped'] = "MSP_Mudtown3B_Females_01"},
	{ ['ped'] = "MSP_Mudtown3B_Males_01"},
	{ ['ped'] = "MSP_MUDTOWN5_MALES_01"},
	{ ['ped'] = "MSP_NATIVE1_MALES_01"},
	{ ['ped'] = "MSP_REVEREND1_MALES_01"},
	{ ['ped'] = "MSP_SAINTDENIS1_FEMALES_01"},
	{ ['ped'] = "MSP_SAINTDENIS1_MALES_01"},
	{ ['ped'] = "MSP_SALOON1_FEMALES_01"},
	{ ['ped'] = "MSP_SALOON1_MALES_01"},
	{ ['ped'] = "MSP_SMUGGLER2_MALES_01"},
	{ ['ped'] = "MSP_TRAINROBBERY2_MALES_01"},
	{ ['ped'] = "MSP_TRELAWNY1_MALES_01"},
	{ ['ped'] = "MSP_UTOPIA1_MALES_01"},
	{ ['ped'] = "MSP_WINTER4_MALES_01"},
	{ ['ped'] = "Player_Three"},
	{ ['ped'] = "Player_Zero"},
	{ ['ped'] = "RCES_ABIGAIL3_FEMALES_01"},
	{ ['ped'] = "RCES_ABIGAIL3_MALES_01"},
	{ ['ped'] = "RCES_BEECHERS1_MALES_01"},
	{ ['ped'] = "RCES_EVELYNMILLER_MALES_01"},
	{ ['ped'] = "RCSP_BEAUANDPENELOPE1_FEMAL"},
	{ ['ped'] = "RCSP_BEAUANDPENELOPE_MALES_"},
	{ ['ped'] = "RCSP_CALDERON_MALES_01"},
	{ ['ped'] = "RCSP_CALDERONSTAGE2_MALES_0"},
	{ ['ped'] = "RCSP_CALDERONSTAGE2_TEENS_0"},
	{ ['ped'] = "RCSP_CALLOWAY_MALES_01"},
	{ ['ped'] = "RCSP_COACHROBBERY_MALES_01"},
	{ ['ped'] = "RCSP_CRACKPOT_FEMALES_01"},
	{ ['ped'] = "RCSP_CRACKPOT_MALES_01"},
	{ ['ped'] = "RCSP_CREOLE_MALES_01"},
	{ ['ped'] = "RCSP_DUTCH1_MALES_01"},
	{ ['ped'] = "RCSP_DUTCH3_MALES_01"},
	{ ['ped'] = "RCSP_EDITHDOWNES2_MALES_01"},
	{ ['ped'] = "RCSP_FORMYART_FEMALES_01"},
	{ ['ped'] = "RCSP_FORMYART_MALES_01"},
	{ ['ped'] = "RCSP_GUNSLINGERDUEL4_MALES_"},
	{ ['ped'] = "RCSP_HEREKITTYKITTY_MALES_0"},
	{ ['ped'] = "RCSP_HUNTING1_MALES_01"},
	{ ['ped'] = "RCSP_MRMAYOR_MALES_01"},
	{ ['ped'] = "RCSP_NATIVE1S2_MALES_01"},
	{ ['ped'] = "RCSP_NATIVE_AMERICANFATHERS"},
	{ ['ped'] = "RCSP_ODDFELLOWS_MALES_01"},
	{ ['ped'] = "RCSP_ODRISCOLLS2_FEMALES_01"},
	{ ['ped'] = "RCSP_POISONEDWELL_FEMALES_0"},
	{ ['ped'] = "RCSP_POISONEDWELL_MALES_01"},
	{ ['ped'] = "RCSP_POISONEDWELL_TEENS_01"},
	{ ['ped'] = " RCSP_RIDETHELIGHTNING_FEMAL "},
	{ ['ped'] = "RCSP_RIDETHELIGHTNING_MALES"},
	{ ['ped'] = "RCSP_SADIE1_MALES_01"},
	{ ['ped'] = "RCSP_SLAVECATCHER_MALES_01"},
	{ ['ped'] = "RE_ANIMALATTACK_FEMALES_01"},
	{ ['ped'] = "RE_ANIMALATTACK_MALES_01"},
	{ ['ped'] = "RE_ANIMALMAULING_MALES_01"},
	{ ['ped'] = "RE_APPROACH_MALES_01"},
	{ ['ped'] = "RE_BEARTRAP_MALES_01"},
	{ ['ped'] = "RE_BOATATTACK_MALES_01"},
	{ ['ped'] = "RE_BURNINGBODIES_MALES_01"},
	{ ['ped'] = "RE_CHECKPOINT_MALES_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},
	{ ['ped'] = "A_C_DogCollie_01"},

	
	}
		
Citizen.CreateThread(function()
menuno = 1
while true do 
Wait(0)

timer = GetGameTimer()
if IsControlJustPressed(0,0xC1989F95) then
menuopen = true
repeat
Wait(0)
drawTxt(0.100, 0.100, 0.9,0.9,0.5, "Ped  "..pedlist[menuno].ped.."", 250, 250, 250, 255)


if GetGameTimer() - timer > 100 then
timer = GetGameTimer()
if IsControlPressed(0,0x6319DB71) then
menuno = menuno + 1
if menuno > #pedlist then
menuno = 1
end
elseif IsControlPressed(0,0x05CA7C52) then
menuno = menuno - 1
if menuno < 1 then
menuno = #pedlist
end
end
end
if IsControlJustPressed(0,0xC7B5340A) then
menuopen = false
loadped(pedlist[menuno].ped)
end



if IsControlJustPressed(0,0xC1989F95) then
menuopen = false
end
until  menuopen == false

end
end
end)

function loadped(ped)

Citizen.CreateThread(function()
	local model2 = GetHashKey(ped)
		while not HasModelLoaded(model2) do
		Citizen.Wait(100)
		if not HasModelLoaded(model2) then
		        Citizen.InvokeNative(0xFA28FE3A6246FC30,tonumber(model2),true)
				end

			
		end
        Citizen.InvokeNative(0xED40380076A31506, PlayerId(), model2,1) 

Wait(1000)
     --   Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),0x508B80B9,true,true,true) --blanket
      --  Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),0x16923E26,true,true,true) --mane
       -- Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),0xF867D611,true,true,true) --tail
     --   Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),0xF0C30271,true,true,true) --bag
    --    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),0x12F0DF9F,true,true,true) --bedroll
     --   Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),0x67AF7302,true,true,true) --stirups
--Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),0x20359E53,true,true,true)

end)
end
----------------------------------------------------------





-----------------------------------Hostility controls
Citizen.CreateThread(function()
group = 1
msg = "friendly"
	while true do 
	Wait(0)
SetRelationshipBetweenGroups(group, `PLAYER`, `PLAYER`)
		if IsControlJustPressed(0,0x6319DB71) then   --- up key
			if group == 5 then
				timeout = GetGameTimer()
				repeat
				Wait(0)
				msg = "friendly"
				group = 1
				drawTxt(0.100, 0.200, 0.9,0.9,0.5, "Set  "..msg.."", 250, 250, 250, 255)
				SetRelationshipBetweenGroups(group, `PLAYER`, `PLAYER`)
				until GetGameTimer() - timeout > 1500
			else
				timeout = GetGameTimer()
				repeat
				Wait(0)
				msg = "Enemy"
				group = 5
					drawTxt(0.100, 0.200, 0.9,0.9,0.5, "Set  "..msg.."", 250, 250, 250, 255)
				SetRelationshipBetweenGroups(group, `PLAYER`, `PLAYER`)
				until GetGameTimer() - timeout > 1500
			end
		end
	end
end)
------------------------------------------





-----------------------------Place Animals /peds in cart nearby
Citizen.CreateThread(function()
while true do 
Wait(1050)                       ---------starts slow to now spam raycasts
local ped = PlayerPedId()
coords = GetEntityCoords(ped)
--ClearPedEnvDirt(ped)
forwardoffset = GetOffsetFromEntityInWorldCoords(ped,2.0,0.0,0.0)   -------- got coords 2m right of player
local Pos2 = GetEntityCoords(ped)
local targetPos = GetOffsetFromEntityInWorldCoords(obj3, -0.0, 1.1,-0.1)
local rayCast = StartShapeTestRay(Pos2.x, Pos2.y, Pos2.z, forwardoffset.x, forwardoffset.y, forwardoffset.z,-1,ped,7)
local A,hit,C,C,spot = GetShapeTestResult(rayCast)                
local model = GetEntityModel(spot)                           ------------------get entity hit in raycast
cartcoords = GetEntityCoords(spot)
if model == -1347283941 or model == -1758092337 then         ------------------ is it a cart
lookingat = model
repeat                                     ---- it is! then keep checking faster and display options
Wait(0)
animal = Citizen.InvokeNative(0xD806CD2A4F2C2996, ped)
drawTxt(0.100, 0.200, 0.9,0.9,0.5, "press R to place Inimal in cart", 250, 250, 250, 255)
if IsControlJustReleased(0,0xE30CD707) then
Wait(2500)                            				---------- wait until animal/ped/fur is dropped 
pedid = NetworkGetNetworkIdFromEntity(animal)
TriggerServerEvent('EveryoneTeleportEntity',pedid,cartcoords.x,cartcoords.y,cartcoords.z+1.5)                --- TP the ped for all players 
print("animal",animal)
SetEntityCoords(animal,cartcoords.x,cartcoords.y,cartcoords.z+1.5,false)
end
forwardoffset = GetOffsetFromEntityInWorldCoords(ped,2.0,0.0,0.0)
local Pos2 = GetOffsetFromEntityInWorldCoords(ped, -0.0, 0.0,0.5)
local targetPos = GetOffsetFromEntityInWorldCoords(obj3, -0.0, 1.1,-0.1)
local rayCast = StartShapeTestRay(Pos2.x, Pos2.y, Pos2.z, forwardoffset.x, forwardoffset.y, forwardoffset.z,-1,ped,7)
A,hit,B,C,spot = GetShapeTestResult(rayCast)
NetworkRequestControlOfEntity(animal)
model = GetEntityModel(spot)
until lookingat ~= model
end
end
end)
RegisterNetEvent('EveryoneTeleportEntity')    ------------ makes all players Move the ped to makes sure it syncs up. 
AddEventHandler('EveryoneTeleportEntity', function(netid,x,y,z)

 ent = NetworkGetEntityFromNetworkId(netid)
 Wait(150)
 print("move ent",netid,ent)
 SetEntityCoords(ent,x,y,z)
 
end)
----------------------------------------------------------------------------------------

-----------------------------------Handsup controls HOLD u to keep hands up, holding actualy restricsts the player, more realsitic  
handsup = false
Citizen.CreateThread(function()

	while true do
	Citizen.Wait(100)       ----------------as fast as it needs to be to work nicely
		if IsControlPressed(0,0xD8F73058) then
HidePedWeaponForScriptedCutscene(ped,true)                       ------ holsters weapon so you cant glitch shoot
			if  DoesEntityExist(ped) and not IsEntityDead(ped) then
			
				while  not HasAnimDictLoaded( "script_proc@robberies@shop@rhodes@gunsmith@inside_upstairs" )  do 
				RequestAnimDict( "script_proc@robberies@shop@rhodes@gunsmith@inside_upstairs" )
				Citizen.Wait(100)
				end
			end
				if handsup == false then
				TaskPlayAnim(ped, "script_proc@robberies@shop@rhodes@gunsmith@inside_upstairs", "handsup_register_owner", 8.0, -8.0, -1, 31, 0, true, 0, false, 0, false)
				handsup = true
				end

			end
		if IsControlReleased(0,0xD8F73058) and handsup == true then ----------when U Isnt pressed then clearpedtasks IF hands were up. 
		ClearPedSecondaryTask(ped)
		handsup = false
		end
	end
end)
--------------------------------------------------------------------------------------

-----------------------------------------------------health system 
Citizen.CreateThread(function()
SetEntityMaxHealth(PlayerPedId(),250) --------------raise health so you dont die too easy
ped = PlayerPedId()
timer3 = GetGameTimer()
Citizen.InvokeNative(0xf6a7c08df2e28b28, PlayerPedId(), 1, 10000.0) 
	while true do
	Wait(100)
	SetPlayerHealthRechargeMultiplier(PlayerId(),0.0)
		if GetGameTimer() - timer3 > 1000 then   ----------------Wait atleast exactly one second 
	--	print("health",health)
		timer3 = GetGameTimer()
		health = GetEntityHealth(ped)
			if health < 220 and health > 150 then             ----------------if low but not too low then heal player 
			SetEntityHealth(ped,health  + 1)
		--	print("newset1",health  + 1)
			elseif health < 60 and health  > 0 then             ----------------if too low then kill player slowly :D 
			SetEntityHealth(ped,health  - 1)
		--	print("newset2",health  - 1)
			end
		end
	end
end)
----------------------------------------------------------------------------------




RegisterNetEvent('showhash')--------------------------command to show some hashes with the hash function 
AddEventHandler('showhash', function()
	if showhash == true then
	showhash = false 
	else
	showhash = true 
	A()
	end
end)
function A()
	Citizen.CreateThread(function ()
	hash = 0
	hash1 = 0
	carkey = 0
		repeat
		Wait(0)
		ped = PlayerPedId()
		coords2 = GetEntityCoords(ped, true)
		local coords = GetOffsetFromEntityInWorldCoords(ped,0.0,-3.0,-1.0)
		coords1 = GetEntityCoords(ped)
		H = GetEntityHeading(ped)
		drawTxt(0.05, 0.050, 0.9,0.9,0.5, "Player Coords    "..coords1.."", 250, 250, 250, 255)
		drawTxt(0.05, 0.100, 0.9,0.9,0.5, "Player Heading    "..H.."", 250, 250, 250, 255)
		a,entity = GetEntityPlayerIsFreeAimingAt(PlayerId())
		hash1 = GetEntityModel(entity)
			if hash1 ~= 0 or (hash1 ~= hash and hash1 ~= 0) then
			hash = hash1
			end
		drawTxt(0.05, 0.200, 0.9,0.9,0.5, "Aiming at = "..hash.."", 250, 250, 250, 255)
		animal = Citizen.InvokeNative(0xD806CD2A4F2C2996, ped)  
		a,carriedEntityHash = Citizen.InvokeNative(0x31FEF6A20F00B963,animal)
		if a then
		drawTxt(0.05, 0.400, 0.9,0.9,0.5, "Carried ent"..carriedEntityHash.."", 250, 250, 250, 255)
		drawTxt(0.05, 0.500, 0.9,0.9,0.5, "Carried ent lable"..(GetLabelTextByHash(carriedEntityHash)).."", 250, 250, 250, 255)  ---- only works for Skins
		end
		local vehicle = GetVehiclePedIsIn(ped, false) 
		carkey = GetEntityModel(vehicle)
		drawTxt(0.05, 0.300, 0.9,0.9,0.5, "in Vehicle  "..carkey.."", 250, 250, 250, 255)
		until showhash == false 
	end)
end
--------------------------------------------------------------------------------end of hash function

	function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
	Citizen.InvokeNative(0xADA9255D, 1);
	
    SetTextScale(width, height)
    SetTextColor(r, g, b, a)
	DisplayText(text, x, y)
end






