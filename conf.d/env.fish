# ~/.config/fish/conf.d/env.fish
# 注意：fish 中用 $HOME 替代 ~，用 set -x/set -U 替代 export

# ===================== 全局持久化变量（重启不丢失） =====================
# pnpm（用 -U 持久化 PATH，避免每次加载重复追加）
set -U PNPM_HOME "$HOME/.local/share/pnpm"
set -U fish_user_paths $PNPM_HOME $fish_user_paths

# go（全局持久化）
set -U GO111MODULE on
set -U GOPROXY https://goproxy.cn
set -U GOPATH /media/work/.app/go
set -U GOBIN "$GOPATH/bin"
set -U fish_user_paths $GOBIN $fish_user_paths  # 把 GOBIN 加入 PATH

# android（全局持久化）
set -U ANDROID_HOME /media/work/.app/android
set -U ANDROID_SDK_ROOT $ANDROID_HOME
set -U REPO_URL https://mirrors.tuna.tsinghua.edu.cn/android-sdk/
# 把 android 相关路径加入 PATH（持久化）
set -U fish_user_paths $ANDROID_SDK_ROOT/build-tools/latest $ANDROID_SDK_ROOT/cmdline-tools/latest/bin $ANDROID_SDK_ROOT/emulator $ANDROID_SDK_ROOT/platform-tools $fish_user_paths

# ===================== 会话级变量（仅当前终端生效，无需持久化） =====================
# podman
set -U PODMAN_COMPOSE_PROVIDER podman-compose

# local-ai
#set -x ADDRESS 0.0.0.0:8888
#set -x MODELS_PATH /media/work/dev/ai/models
#set -x LOCALAI_BACKENDS_PATH "$HOME/.localai/backends"
#set -x LOCALAI_BACKENDS_STORE /media/work/dev/ai/projects/LocalAI/gallery

# huggingface
set -U HF_ENDPOINT https://hf-mirror.com
set -U HF_HOME /media/work/dev/ai/hf

# electron
set -U ELECTRON_MIRROR https://npmmirror.com/mirrors/electron/

# 编辑器
set -U EDITOR /bin/vim

# rust（如果需要启用，取消注释下面这行）
# source "$HOME/.cargo/env"

# docker（如果需要启用，取消注释下面这行）
# set -U DOCKER_HOST "unix://$XDG_RUNTIME_DIR/docker.sock"

# claude code
set -U ANTHROPIC_API_KEY dummy
set -U ANTHROPIC_BASE_URL http://localhost:5999/anthropic
