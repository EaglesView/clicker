-- COLOR FILE
local col = {}

col.colorPalette1 = {
    col1 = Color3.fromRGB(56, 102, 65),
    col2 = Color3.fromRGB(106, 153, 78),
    col3 = Color3.fromRGB(185, 222, 97),
    col4 = Color3.fromRGB(52, 142, 64),
    col5 = Color3.fromRGB(242, 232, 207),
    col6 = Color3.fromRGB(188, 71, 73),
    col7 = Color3.fromRGB(56, 102, 65)
}
col.largeColorPalette1 = {
    color1 = Color3.fromRGB(15, 114, 189),
    color2 = Color3.fromRGB(31, 141, 214),
    color3 = Color3.fromRGB(71, 185, 255),
    color4 = Color3.fromRGB(6, 109, 73),
    color5 = Color3.fromRGB(6, 109, 73),
    color6 = Color3.fromRGB(6, 109, 73),
    color7 = Color3.fromRGB(6, 109, 73),
    color8 = Color3.fromRGB(6, 109, 73),
    color9 = Color3.fromRGB(255, 255, 255)
}
col.purchaseButton = {
    shadow = Color3.fromRGB(2, 2, 2),
    inactive = Color3.fromRGB(13, 40, 24),
    textDark = Color3.fromRGB(4, 71, 28),
    textLight = Color3.fromRGB(5, 140, 66),
    active = Color3.fromRGB(22, 219, 101),
    failure = Color3.fromRGB(188, 71, 73),
    textFailure = Color3.fromRGB(221, 208, 208)
}

col.button_upgrade = {
    activated = {
        bg = Color3.fromRGB(22, 219, 101),
        tx = Color3.fromRGB(4, 71, 28),
    },
    inactive_canAfford = {
        bg = Color3.fromRGB(5, 140, 66),
        tx = Color3.fromRGB(2, 2, 2),
    },
    inactive_canNotAfford = {
        bg = Color3.fromRGB(13, 40, 24),
        tx = Color3.fromRGB(188, 71, 73),
    }, 
    disabled = {
        bg =Color3.fromRGB(49, 49, 49),
        tx = Color3.fromRGB(26,26,26)
    },
    failure = {
        bg = Color3.fromRGB(188, 71, 73),
        tx = Color3.fromRGB(221, 208, 208)
    }
}









return col