function ff
    set -l wdir .

    if set -q argv[1] && test -d "$argv[1]"
        set wdir $argv[1]
        set -e argv[1]  # 移除第一个参数
    end

    fzf --walker-root "$wdir" $argv
end
