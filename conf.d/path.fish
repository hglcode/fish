function __fish_app_paths --description "Scan application directory and cache with filtering support"
    # 获取过滤参数（要排除的目录名）
    set -l exclude_dirs $argv

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

    # 缓存文件（使用系统启动时间和过滤参数作为 key）
    set -l btime (cat /proc/stat | grep btime | awk '{print $2}')

    # 构建缓存 key：将排除目录排序并连接
    set -l exclude_key ""
    if test (count $exclude_dirs) -gt 0
        # 对排除目录进行排序
        set -l sorted_dirs (for dir in $exclude_dirs; echo $dir; end | sort -u)
        # 连接成字符串
        set exclude_key (string join "," $sorted_dirs)
    end

    # 构建缓存文件名
    set -l cache_file "/tmp/app_paths_$btime"
    if test -n "$exclude_key"
        set cache_file "$cache_file.$exclude_key"
    end
    set cache_file "$cache_file.cache"

    if test -f "$cache_file"
        cat "$cache_file"
        return 0
    end

    # 收集路径
    set -l new_paths
    for app_dir in $home/*/
        # 获取目录名（去掉末尾斜杠）
        set -l raw_dirname (basename "$app_dir")
        set -l dirname (string replace -r '/$' '' "$raw_dirname")

        # 检查是否在排除列表中
        set -l should_exclude 0
        for exclude in $exclude_dirs
            if test "$dirname" = "$exclude"
                set should_exclude 1
                break
            end
        end

        if test $should_exclude -eq 1
            continue
        end

        set -l bin_dir "$app_dir/bin"
        if test -d "$bin_dir"
            set app_dir "$bin_dir"
        end

        # 检查是否已在 PATH
        if not contains "$app_dir" $PATH
            set -a new_paths "$app_dir"
        end
    end

    test (count $new_paths) -eq 0 && begin
        return 1
    end


    # 缓存并输出
    printf "%s\n" $new_paths >"$cache_file"
    cat "$cache_file"
end

# 初始化：加载路径（使用过滤）
set -l paths (__fish_app_paths atfe)
if test $status -eq 0
    for p in $paths
        fish_add_path "$p"
    end
end
