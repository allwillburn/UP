require("DeftLib")
require("OpenPredict")
require("DamageLib")



local UniversalQ = {delay = .5, range = 850, width = 250, speed = 1200}





local UniversalMenu = Menu("Universal", "Universal")



UniversalMenu:SubMenu("Combo", "Combo")



UniversalMenu.Combo:Boolean("Q1", "Use Q Skillshot ", true)
UniversalMenu.Combo:Slider("Qpred", "Q Hit Chance", 3,0,10,1)



OnTick(function (myHero)
      local target = GetCurrentTarget()
      local UniversalQ = {delay = GetCastDelay(myHero,_Q), range = GetCastRange(myHero,_Q), width = GetCastWidth(myHero,_Q), speed = GetCastSpeed(myHero,_Q)}

      --COMBO
      if Mix:Mode() == "Combo" then

         if UniversalMenu.Combo.Q:Value() and Ready(_Q) and ValidTarget(target, 850) then
                local QPred = GetPrediction(target,UniversalQ)
                       if QPred.hitChance > (UniversalMenu.Combo.Qpred:Value() * 0.1) then
                                 CastSkillShot(_Q,QPred.castPos)
                       end
            end
end)
