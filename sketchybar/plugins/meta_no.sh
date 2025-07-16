#!/bin/bash

sketchybar --set "$NAME" popup.drawing=toggle \

sketchybar  --add item meta_user popup.meta  \
            --set meta_user background.image="~/.config/sketchybar/cache/pfp.jpg" \
                            background.drawing=on           \
                            background.image.scale=0.25     \
                            background.image.corner_radius=124 \
                            background.image.border_width=2 \
                            background.image.border_color=0xff000000\
            --add item apple.preferences popup.meta         \
            --set apple.preferences icon=􀺽                 \
                                    label="Preferences"                       \
                                    background.drawing=off                    \
                                    click_script="open -a 'System Preferences'; sketchybar --set meta popup.drawing=off"   \
            --add item apple.activity popup.meta                                             \
            --set apple.activity    icon=􀒓                                                     \
                                    label="Activity"                                                           \
                                    click_script="open -a 'Activity Monitor';                       
                                    sketchybar --set apple.logo popup.drawing=off"                             \