local opacity_window_rule = {
    { "kitty",           "0.80 0.80 1.0" },
    { "firefox",         "0.90 0.90 1.0" },
    { "zeditor",         "0.80 0.80 1.0" },
    { "jetbrains-clion", "0.80 0.80 1.0" },
    { "vesktop",         "0.80 0.80 1.0" },
}

for _, rule in ipairs(opacity_window_rule) do
    local class, opacity = rule[1], rule[2]
    hl.window_rule({
        match = { class = "^(" .. class .. ")$" },
        opacity = opacity
    })
end


local blurred_layers = {
    "rofi",
    "notifications",
    "swaync-notification-window",
    "swaync-control-center",
    "logout_dialog"
}

for _, layer in ipairs(blurred_layers) do
    hl.layer_rule({
        match = { namespace = layer },
        blur = true,
        ignore_alpha = 0
    })
end
