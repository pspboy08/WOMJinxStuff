local mt = getrawmetatable(game)
setreadonly(mt, false)
local old = mt.__namecall
lplr = game:GetService("Players").LocalPlayer.Character
mt.__namecall = newcclosure(function(o, ...)
 local remotename = tostring(o)
 local method = getnamecallmethod()

 if method == "FireServer" or method == "InvokeServer" then
     if remotename == "DealWeaponDamage" or remotename == "DealAttackDamage" then
         packed = {...}
     if packed[2] == lplr then
 
 packed[2] = nil
 
        return old(o, unpack(packed))
       
     end
  end
end
 
  return old(o, ...)
 
end)