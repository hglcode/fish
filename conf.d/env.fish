# ~/.config/fish/conf.d/env.fish
# 注意：fish 中用 $HOME 替代 ~，用 set -x/set -U 替代 export

# ===================== 全局持久化变量（重启不丢失） =====================
# pnpm（用 -U 持久化 PATH，避免每次加载重复追加）
set -x PNPM_HOME "$HOME/.local/share/pnpm"

fish_add_path /media/work/.tool/arm/gcc/bin
fish_add_path $PNPM_HOME $PNPM_HOME/bin

# go（全局持久化）
set -x GO111MODULE on
set -x GOPROXY https://goproxy.cn
set -x GOPATH /media/work/.app/go
set -x GOBIN "$GOPATH/bin"
fish_add_path $GOBIN # 把 GOBIN 加入 PATH

# android（全局持久化）
set -x ANDROID_HOME /media/work/.tool/android
set -x ANDROID_SDK_ROOT $ANDROID_HOME
set -x REPO_URL https://mirrors.tuna.tsinghua.edu.cn/android-sdk/
# 把 android 相关路径加入 PATH（持久化）
fish_add_path $ANDROID_SDK_ROOT/build-tools/latest $ANDROID_SDK_ROOT/cmdline-tools/latest/bin $ANDROID_SDK_ROOT/emulator $ANDROID_SDK_ROOT/platform-tools

# ===================== 会话级变量（仅当前终端生效，无需持久化） =====================
# podman
set -x PODMAN_COMPOSE_PROVIDER podman-compose

# local-ai
#set -x ADDRESS 0.0.0.0:8888
#set -x MODELS_PATH /media/work/dev/ai/models
#set -x LOCALAI_BACKENDS_PATH "$HOME/.localai/backends"
#set -x LOCALAI_BACKENDS_STORE /media/work/dev/ai/projects/LocalAI/gallery

# huggingface
set -x HF_ENDPOINT https://hf-mirror.com
set -x HF_HOME /media/work/dev/ai/hf

# electron
#set -x ELECTRON_MIRROR https://npmmirror.com/mirrors/electron/

# editor
set -x EDITOR /bin/vim

# docker（如果需要启用，取消注释下面这行）
# set -U DOCKER_HOST "unix://$XDG_RUNTIME_DIR/docker.sock"

# claude code
set -x ANTHROPIC_API_KEY dummy
set -x ANTHROPIC_BASE_URL http://localhost:5999/anthropic
set -x API_TIMEOUT_MS 108000000
set -x STREAM_API_TIMEOUT_MS 108000000

# java
set -x JAVA_HOME /usr/lib64/openjdk-25
