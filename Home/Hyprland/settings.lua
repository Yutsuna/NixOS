hl.config({

    input = {
        kb_layout = "fr",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = true
        },
    },

    render = {
        direct_scanout = true,
    },

misc = {
        disable_hyprland_logo = true,
        mouse_move_focuses_monitor = true,
        vrr = true,
    },

    debug = {
        vfr = true,
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
        new_on_top = true,
        mfact = 0.5,
    },


})
