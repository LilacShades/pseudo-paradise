#!/bin/bash

if [ ! -f /tmp/cover-url.txt ]; then
    touch /tmp/cover-url.txt
fi

CURRENT_URL=$(playerctl --player Feishin metadata --format '{{mpris:artUrl}}' 2>/dev/null)

PREV_URL=$(cat /tmp/cover-url.txt)

if [ "$PREV_URL" != "$CURRENT_URL" ] && [ -n "$CURRENT_URL" ]; then
    echo "$CURRENT_URL" > /tmp/cover-url.txt
    wget -T 10 -q -O /tmp/cover.jpg "$CURRENT_URL"
fi

echo "/tmp/cover.jpg"
