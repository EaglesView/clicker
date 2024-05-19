local template = {}
template.account = {
    prestigeLVL = 1,
    beeBonus = 0
}
template.money = {
    amount = 10,
    mainmultiplier = 1
}
template.click = {
    clickrate = 2,               --Amount of seconds between each click
    clickpower = 1,              --Amount per click
    premiumUpgrades = {
        pu1 = {                  --x2 en tout temps lorsque connecté 
            baseupdate = 1,
            upgradePrice = 80,   --80 ROBUX
            isEnabled = false    --Oui ou non, pas plusieurs upgrades
        },
        pu2 = {                  --Achats 50% moins cher
            baseUpdate = 0.5,    --prix final
            upgradePrice = 160,
            isEnabled = false
        }
    },
    upgrades = {
        u1 = {       --Ajoute au click en addition
            Value = 0,
            upgradePrice = 10,
            upgradeAmt = 0,
            title = "Better Mineral Water",
            description = "Add more clicks per click.Quite the deal!",
            order = 1
        },
        u2 = {       --Diminue le clickrate
            Value = 0,
            upgradePrice = 100,
            upgradeAmt = 0,
            title = "Faster Gardening Speed",
            description = "Make those clicks a little faster, something you might want to have",
            order = 1,
        },
        u3 = {       --Ajoute au click en Multiplication
            Value = 0,
            upgradePrice = 2500,
            upgradeAmt = 0,
            title = "Add a decoration",
            description = "Get decorations for your garden and place them here for bonus ressources!",
            order = 2,
        },
        u4 = {       --Ajoute au click en Exposant
            Value = 0,
            upgradePrice = 5000,
            upgradeAmt = 0,
            title = "Add a decoration",
            description = "Get decorations for your garden and place them here for bonus ressources!",
            order = 3,
        },
        u5 = {       --Ajoute au click en exponentiel
            Value = 0,
            upgradePrice = 5000,
            upgradeAmt = 0,
            title = "Add a decoration",
            description = "Get decorations for your garden and place them here for bonus ressources!",
            order = 4,
        },
        u6 = {       --Ajoute au click en Multiplication
            Value = 0,
            upgradePrice = 5000,
            upgradeAmt = 0,
            title = "Add a decoration",
            description = "Get decorations for your garden and place them here for bonus ressources!",
            order = 5,
        },
    }
}

return template