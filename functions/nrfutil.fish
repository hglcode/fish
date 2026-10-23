function nrfutil --wraps=nrfutil --description 'Wrapper: auto-inject --jlink-dll for device subcommand'
    if test "$argv[1]" = "device"
        command nrfutil device --jlink-dll /media/work/.app/jlink/libjlinkarm.so $argv[2..-1]
    else
        command nrfutil $argv
    end
end
