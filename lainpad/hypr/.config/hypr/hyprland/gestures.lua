hl.config({
    gestures = {
        workspace_swipe_forever = true,        scrolling = {

        },
    },
})

hl.gesture({
    fingers = 4,
    direction = "horizontal",
    action = "scroll_move",
    scale = 1.5,
})

hl.gesture({
    fingers = 4,
    direction = "vertical",
    action = "workspace",
})