function app_paths --description "扫描应用目录并缓存路径"
    # 候选目录列表
    set -l candidates \
        "$HOME/.local/app" \
        (path dirname (status filename))/../local/app \
        /media/work/.app

    set -l home
    for c in $candidates
        if test -d "$c"
            set home "$c"
            break
        end
    end

    test -z "$home" && return 1

    # 缓存文件（使用系统启动时间作为 key）
    set -l btime (cat /proc/stat | grep btime | awk '{print $2}')
    set -l cache_file "/tmp/fish_app_paths_$btime.cache"

    if test -f "$cache_file"
        cat "$cache_file"
        return 0
    end

    # 收集路径
    set -l new_paths
    for app_dir in $home/*/
        set -l bin_dir "$app_dir/bin"
        if test -d "$bin_dir"
            set app_dir "$bin_dir"
        end

        # 检查是否已在 PATH（Fish 的 PATH 是列表）
        if not contains "$app_dir" $PATH
            set -a new_paths "$app_dir"
        end
    end

    test (count $new_paths) -eq 0 && return 1

    # 缓存并输出
    printf "%s\n" $new_paths >"$cache_file"
    cat "$cache_file"
end


# 初始化：加载路径
set -l paths (app_paths)
if test $status -eq 0
    for p in $paths
        fish_add_path "$p"
    end
end
