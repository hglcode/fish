function wf
    set -l op "$argv[1]" "restart"
    echo 0 | sudo -S systemctl "$op" hostapd.service
end
