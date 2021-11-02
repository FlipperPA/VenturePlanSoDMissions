# Addon sites

* [WowInterface](https://www.wowinterface.com/downloads/info26117-VenturePlanSoDMissions.html)

# #ActiBlizzWalkout

Full support and solidarity for the workers at Blizzard.

![I stand in solidarity with the workers of Activision Blizzard King and their demands](https://pbs.twimg.com/media/E7zWaEEVIBQfhas?format=jpg&name=900x900)

If you email me proof of a donation to any of their nominated charities (Black Girls CODE, Futures without Violence, Girls Who Code, RAINN, Women in Animation, Women in Games International) I'll match it.

# Legal stuff

VenturePlan does not expose any of its data to other addons, so to have this addon work, you will need to change it to do so. Note that VenturePlan does not have a a licence that permits you to alter its source code, and while it is legal to tinker with source code you're allowed to run in my jurisdiction, it may not be legal in yours. Consult a lawyer if you are worried. Obviously I don't encourage you to do so if it's not legal for you. In any case you should absolutely not redistribute the changes you've made.

In the US, see e.g. [Galoob v. Nintendo](https://www.lexisnexis.com/community/casebrief/p/casebrief-lewis-galoob-toys-inc-v-nintendo-of-am-inc), which found that you have the right to modify copyrighted software for personal use.

# Getting it running

To expose VenturePlan's internal data you will need to edit its source code. First, ensure that you are on the latest version, `4.16a`. Then open up `_retail_/Interface/AddOns/VenturePlan/vs.lua` in a text editor, and insert the line `_G[_] = T` in the first blank space. It should look like this when you're done:

![Notepad preview of changed file](img/notepad.png)

This makes certain internal data of the addon (`T`) available to other addons (by putting it in the global table, `_G`, which every addon has available to it). In general you shouldn't be messing with addons like this, because it's a great way of getting hacked, but in this case there's no way around it. _caveat emptor_

There is one more piece of internal data that needs to be made available. Scroll further down until you see the line that starts with `local overrideAA =` and insert the line `T.overrideAA = overrideAA` directly underneath. The code should now look like this:

```lua
do -- targets
    local overrideAA = {[57]=0, [181]=0, [209]=0, [341]=0, [409]=1, [777]=0, [1213]=0, [69424]=0, [69426]=0, [69432]=0, [69434]=0, [69518]=0, [69522]=0, [69524]=0, [69530]=0, [69646]=0, [69648]=0, [69650]=0, [69652]=0, [70286]=0, [70288]=0, [70290]=0, [70292]=0, [70456]=0, [70478]=0, [70550]=0, [70556]=0, [70584]=0, [70586]=0, [70638]=0, [70640]=0, [70642]=0, [70644]=0, [70678]=0, [70682]=0, [70684]=0, [70702]=0, [70704]=0, [70706]=0, [70708]=0, [70714]=0, [70806]=0, [70808]=0, [70812]=0, [70832]=0, [70862]=0, [70868]=0, [70874]=0, [70908]=0, [71194]=0, [71606]=0, [71612]=0, [71640]=0, [71670]=0, [71672]=0, [71674]=0, [71676]=0, [71736]=0, [71800]=0, [71802]=0, [72086]=0, [72088]=0, [72090]=0, [72092]=0, [72310]=0, [72314]=0, [72336]=0, [72338]=0, [72942]=0, [72944]=0, [72946]=0, [72948]=0, [72954]=0, [73210]=0, [73398]=0, [73404]=0, [73558]=0, [73560]=0, [73564]=0}
    T.overrideAA = overrideAA
    local targetLists do
```

# Hotfixing the Code for Renown Level 62 and Above

At renown level 62, you will gain your 21st companion. VenturePlan is coded to handle a maximum to 20 companions. You will start seeing errors about `self.info` being `nil`. To fix this, edit the file `_retail_/Interface/AddOns/VenturePlan/Widgets.lua`: change line 1960 (in version `4.16a`) from `for i=1,20 do` to `for i=1,99 do`. This will add support up to 99 companions.

After completing this change, the code should look like this:

```lua
s.companions = {}
for i=1,99 do
    t = CreateObject("FollowerListButton", f, false)
    t:SetPoint("TOPLEFT", ((i-1)%4)*76+14, -math.floor((i-1)/4)*72-130)
    s.companions[i] = t
end
```

# Contributing

If you have updates to the spell list you'd like to include (see `extra-vs-spells.lua`), please open a PR and I'll add them.

A helpful step in doing so is, if you find a missions that's mispredicted, run:

`/dump C_Garrison.GetMissionDeploymentInfo(CovenantMissionFrame:GetMissionPage().missionInfo.missionID)`

while you're looking at the mission.

## Contributors and thanks

Many thanks to:

* Neurotoxin001
* pyuuwz
* czullo
* bkifft
* flow0284
* zealvurte
* Jegethy
* siweia
* LostTemple1990
* epiktetov
* woefulwabbit
* boomboo
* FlipperPA
* cremor

for contributions and support, as well as to the original author for a great addon.
