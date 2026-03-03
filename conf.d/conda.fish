function __fish_conda_setup
    # 1. 清理已存在的同名函数（fish 语法）
    functions -e __fish_conda_setup 2>/dev/null

    # 2. 定义 conda/mamba 路径（和原脚本一致）
    set -l home /media/work/.app/miniforge/bin
    set -l sh fish  # 明确指定 shell 为 fish
    set -l conda "$home/conda"
    set -l mamba "$home/mamba"

    # 3. 执行 conda fish hook 初始化
    if test -x "$conda"
        eval "$($conda shell.$sh hook)"
    end

    # 4. 执行 mamba fish hook 初始化
    if test -x "$mamba"
        eval "$($mamba shell hook --shell fish)"
    end

    # 5. 清理临时变量（fish 语法）
    set -e home sh conda mamba setup
end

__fish_conda_setup
