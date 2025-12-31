#!/bin/bash
album_art=$(playerctl metadata mpris:artUrl)
curl -s "${album_art}" --output "/tmp/cover.jpg"
echo "/tmp/cover.jpg"