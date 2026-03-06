function ff
    set -l root_dir .

    # 检查第一个参数是否是目录
    if set -q argv[1] && test -d "$argv[1]"
        set root_dir $argv[1]
        set -e argv[1]  # 移除第一个参数
    end

    # 将剩余参数传递给 fzf
    fzf --walker-root $root_dir $argv
end
