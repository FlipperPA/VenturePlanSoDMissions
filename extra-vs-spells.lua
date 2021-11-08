local _, T = ...

function table_print (tt, indent, done)
    done = done or {}
    indent = indent or 0
    if type(tt) == "table" then
      local sb = {}
      for key, value in pairs (tt) do
        table.insert(sb, string.rep (" ", indent)) -- indent it
        if type (value) == "table" and not done [value] then
          done [value] = true
          table.insert(sb, key .. " = {\n");
          table.insert(sb, table_print (value, indent + 2, done))
          table.insert(sb, string.rep (" ", indent)) -- indent it
          table.insert(sb, "}\n");
        elseif "number" == type(key) then
          table.insert(sb, string.format("\"%s\"\n", tostring(value)))
        else
          table.insert(sb, string.format(
              "%s = \"%s\"\n", tostring (key), tostring(value)))
         end
      end
      return table.concat(sb)
    else
      return tt .. "\n"
    end
end

function to_string( tbl )
    if  "nil"       == type( tbl ) then
        return tostring(nil)
    elseif  "table" == type( tbl ) then
        return table_print(tbl)
    elseif  "string" == type( tbl ) then
        return tbl
    else
        return tostring(tbl)
    end
end

T.MoreSpells = {
    [125]={type="aura", damageATK1=60, modDamageDealt=-50, target="random-enemy", duration=1}, -- Deranged Gouge (Possessed Scavenger), see #64
    [305]={type="nuke", target="enemy-back", damageATK=120}, --Roots of Submission
    [306]={type="aura", target=3, duration=3, modMaxHPATK=60, plusDamageDealtATK=40}, --Arcane Empowerment
    [310]={
		{type="nuke", damageATK=140, target=0},
		{type="aura", modDamageDealt=20, target=4, duration=2},
	}, -- Axe of Determination (Ben Howell), see #64
    [311]={
        {type="heal", target=3, healATK=120},
        {type="aura", target=3, duration=2, modMaxHPATK=40},
    }, --Wings of Mending
    [315]={type="aura", target=1, damageATK1=150, duration=2, modDamageDealt=-30}, --Resounding Message
    [325]={type="aura", target="friend-surround", duration=2, modDamageDealt=60}, --Vision of Beauty
    [326]={type="nuke", target="cleave", damageATK=25}, --Shiftless Smash
    [327]={type="aura", target="all-other-allies", duration=3, plusDamageDealtATK=20}, --Inspirational Teachings
    [328]={type="nuke", target=0, damageATK=30}, --Applied Lesson
    [329]={type="aura", target=4, modDamageTaken=-50, duration=3}, --Muscle Up
    [330]={type="aura", target="all-allies", duration=2, plusDamageDealtATK=20}, --Oversight
    [331]={type="aura", target="all-other-allies", duration=3, plusDamageDealtATK=20}, --Supporting Fire
    [332]={type="nuke", target=1, damageATK=150}, --Emptied Mug
    [333]={type="aura", target=4, duration=3, modDamageDealt=40}, --Overload
    [334]={type="nuke", target=0, damageATK=90}, --Hefty Package
    [335]={type="nuke", target="enemy-back", damageATK=40}, --Errant Package
    [336]={type="heal", target=3, healATK=80}, --Evidence of Wrongdoing
    [337]={type="aura", target=1, duration=4, damageATK1=200, damageATK=40, noFirstTick=true}, --Wavebender's Tide
    [338]={type="nuke", target=0, damageATK=50}, --Scallywag Slash
    [339]={type="nuke", target="all-enemies", damageATK=120, firstTurn=3}, --Cannon Barrage
    [341]={type="aura", target=1, damageATK1=120, duration=3, plusDamageTakenATK=20}, --Tainted Bite
    [342]={
		{type="nuke", target=0, damageATK=100},
		{type="aura", target=0, duration=2, plusDamageDealtATK=-70},
	}, --Regurgitated Meal
    [343]={
		{type="nuke", target="enemy-front", damageATK=80},
		{type="aura", target=4, duration=1, modDamageDealt=20},
	}, --Sharptooth Snarl
    [344]={type="nuke", target="all-enemies", damageATK=30}, --Razorwing Buffet
    [345]={type="aura", target="all-allies" , duration=3 , plusDamageTakenATK=-30}, --Protective Wings
    [346]={type="aura", target=0, duration=2, damageATK1=30, plusDamageDealtATK=1}, --Heel Bite (BUGGED: Should be modDamageDealt=-1. It isn't.)
    [347]={type="nuke", target="cone", damageATK=100}, --Darkness from Above
    [348]={
		{type="nuke", target=1, damageATK=120},
		{type="aura", target=1, duration=3, plusDamageTakenATK=20},
	}, --Tainted Bite
    [349]={type="nuke", target="all-enemies", damageATK=8}, --Anima Swell
    [356]={type="nuke", damageATK=100, target=1}, -- Bone Ambush (Locating The Cache), see #64
}

T.UnverifiedSpells = {
    [307]={type="nuke", target="cone", damageATK=160}, --Fist of Nature (UNVERIFIED)
    [308]={type="nuke", target=1, damageATK=350, firstTurn=3}, --Spore of Doom (UNVERIFIED)
    [309]={
        {type="heal", target="all-allies", healATK=200},
        {type="aura", target="all-allies", duration=1, modDamageDealt=30},
    }, --Threads of Fate (UNVERIFIED)
    [312]={type="nuke", target="cone", damageATK=180}, --Panoptic Beam (UNVERIFIED)
    [313]={type="heal", target="all-allies", healATK=70}, --Spirit's Guidance (UNVERIFIED)
    [314]={
        {type="heal", target=3, healATK=130},
        {type="aura", target=3, duration=2, plusDamageDealtATK=50},
    }, --Purifying Light (UNVERIFIED)
    [316]={type="nuke", target=0, damageATK=100, selfhealATK=30}, --Self Replication (UNVERIFIED)
    [317]={type="aura", target="enemy-front", duration=1, damageATK1=150, plusDamageTakenATK=30}, --Shocking Fist (UNVERIFIED)
    [318]={type="aura", target="all-allies", duration=3, plusDamageDealtATK=50}, --Inspiring Howl (UNVERIFIED)
    [319]={type="aura", target="enemy-front", duration=3, damageATK1=80, damageATK=50, noFirstTick=true}, --Shattering Blows (UNVERIFIED)
    [320]={type="nuke", target="enemy-back", damageATK=100}, --Hailstorm (UNVERIFIED)
    [321]={type="heal", target=3, healATK=200}, --Adjustment (UNVERIFIED)
    [322]={
        {type="nuke", target=0, damageATK=80, selfhealATK=80},
        {type="aura", target=4, duration=1, modMaxHPATK=80},
    }, --Balance In All Things (UNVERIFIED)
    [323]={
        {type="nuke", target="enemy-back", damageATK=40},
        {type="aura", target="enemy-back", duration=2, modDamageDealt=-10},
    }, --Anima Shatter (UNVERIFIED)
    [324]={type="heal", target="friend-surround", healATK=120}, --Protective Parasol (UNVERIFIED)
    [340]={type="nuke", target=1, damageATK=60}, --Tainted Bite (UNVERIFIED)
}

T.MoreOverrideAA = {
    [1225]=0, --Elwyn (see #54)
    [1237]=0, --Ella (see #60)
    [1257]=0, --Cromas the Mystic (see #60)
    [1301]=0, --Chachi the Artiste (see #60)
    [73654]=0, --Learn from the Master, Security Specialist (see #51)
    [73718]=0, --Customary Shakedown, Support Officer (see #39)
    [73720]=0, --Customary Shakedown, Support Officer (see #39)
    [73722]=0, --Customary Shakedown, Support Officer (see #39)
    [73724]=0, --Customary Shakedown, Support Officer (see #39)
    [73742]=0, --A Few Too Many, Unruly Patron (see #44)
    [73744]=0, --A Few Too Many, Unruly Patron (see #44)
    [73746]=0, --A Few Too Many, Unruly Patron (see #44)
    [73748]=0, --A Few Too Many, Unruly Patron (see #44)
    [73750]=0, --A Few Too Many, Unruly Patron (see #44)
    [73752]=0, --A Few Too Many, Unruly Patron (see #44)
    [73754]=0, --A Few Too Many, Unruly Patron (see #44)
    [73756]=0, --A Few Too Many, Unruly Patron (see #44)
    [73776]=0, --Unexpected Delays, P.O.S.T Worker (see #48 and #60)
    [73778]=0, --Unexpected Delays, P.O.S.T Worker (see #48 and #60)
    [73780]=0, --Unexpected Delays, P.O.S.T Worker (see #48 and #60)
    [73846]=0, --Piratical Problems, Corsair Cannoneer and Corsair Wavebender (see #45)
    [73848]=0, --Piratical Problems, Corsair Cannoneer and Corsair Wavebender (see #45)
    [73850]=0, --Piratical Problems, Corsair Cannoneer and Corsair Wavebender (see #45)
    [73852]=0, --Piratical Problems, Corsair Cannoneer and Corsair Wavebender (see #45)
    [73998]=0, --Hunter Becomes the Hunted, Frenzied Razorwing (see #62)
}

T.RemoveOverrideAA = {
    209,
    409,
}

if VenturePlan ~= nil and VenturePlan.overrideAA ~= nil then
    for k,v in pairs(T.MoreSpells) do
        VenturePlan.KnownSpells[k] = v
    end
    for k,v in pairs(T.UnverifiedSpells) do
        VenturePlan.KnownSpells[k] = v
    end
    for k,v in pairs(T.MoreOverrideAA) do
        VenturePlan.overrideAA[k] = v
    end
    for _,v in pairs(T.RemoveOverrideAA) do
        VenturePlan.overrideAA[v] = nil
    end
else
    message("You are running an undoctored version of VenturePlan. Instructions on how to make this addon work are at https://github.com/Divergentcurl/VenturePlanSoDMissions")
end
