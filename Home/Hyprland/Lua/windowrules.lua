hl.window_rule({ match = { class = "^(kitty)$" }, opacity = "0.80 0.80 1.0" })
hl.window_rule({ match = { class = "^(firefox)$" }, opacity = "0.90 0.90 1.0" })
hl.window_rule({ match = { class = "^(zeditor)$" }, opacity = "0.80 0.80 1.0" })

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
