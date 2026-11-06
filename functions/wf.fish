function wf --wraps systemctl --description 'hostapd'
    set -l op "$argv[1]" "restart"
    echo 0 | sudo -S systemctl "$op" hostapd.service
end
