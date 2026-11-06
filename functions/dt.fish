function dt --wraps date --description '格式化日期'
    if set -q argv[1]
        command date $argv
    else
        command date '+%Y-%m-%d %H:%M:%S'
    end
end
