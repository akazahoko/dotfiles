hl.bind("SUPER + D", function()
    if hl.get_active_workspace().name ~= "desktop" then
        hl.dispatch(hl.dsp.focus({ workspace = "name:desktop" }))
    else
        hl.dispatch(hl.dsp.focus({ workspace = "previous" }))
    end
end
)

hl.on("window.open_early", function(window)
    if hl.get_active_workspace().name == "desktop" then
        local last_ws_name = "1"
        if hl.get_last_workspace().name ~= nil then
            last_ws_name = hl.get_last_workspace().name
        end
        hl.dispatch(hl.dsp.window.move({ workspace = "name:" .. last_ws_name, window = window }))
    end
end)

hl.workspace_rule({
    workspace = "name:desktop",
    animation = "fade"
})