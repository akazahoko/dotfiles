#!/bin/zsh

function get_status() {
    warp-cli status | awk ' NR==1 {print $3}'
}

STATUS=$(get_status)

case $(get_status) in
    Connected)
        warp-cli disconnect
        STATUS=已斷線
        ;;
    Disconnected)
        warp-cli connect
        STATUS=已連線
        ;;
    Connecting)
        STATUS=連線中
esac

notify-send -e  \
            -u low  \
            -h string:x-canonical-private-synchronous:osd-warp  \
            -t 1000 \
            -i ~/Icons/Cloudflare.png \
            "Cloudflare WARP"   \
            "$STATUS"