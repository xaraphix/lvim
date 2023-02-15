# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# . /home/suyash/.ghost_passwords
# Path to your oh-my-zsh installation.
export ZSH="/home/suyash/.oh-my-zsh"
export FZF_BASE="/usr/bin/fzf"
export QT_QPA_PLATFORMTHEME="qt5ct"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="eastwood"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
if [ "$COLORTERM" = "gnome-terminal" ] || [ "$COLORTERM" = "xfce4-terminal" ]
then
    export TERM=xterm-256color
elif [ "$COLORTERM" = "rxvt-xpm" ]
then
    export TERM=rxvt-256color
fi
export stopwatch() {
    start=$(date +%s)
    while true; do
        time="$(( $(date +%s) - $start))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    done
}
#alias nvim='/usr/local/bin/nvim-nightly/bin/nvim'
#alias vi='nvim'
alias vim='/home/suyash/.local/bin/lvim'
alias ls='lsd'
alias cat='bat'
alias viconfig='vi ~/.config/nvim/init.vim'
alias ph='git push origin HEAD'
alias gs='git status'
alias gc='git checkout'
alias i='sudo pacman -S'
alias sudo='sudo '
alias u='sudo pacman -Syyu'
alias gf='cd ~/Code/feahnix'
alias mbf='gf;meson build'
alias nbf='ninja -C ~/Code/feahnix/build'
alias ctf='nbf && ~/Code/feahnix/build/feahnix-test & cucumber'
alias cuf='{nbf && {sleep 5 && cucumber} & } &'
alias sf='./home/suyash/Code/feahnix/build/feahix'
alias dolphin='dolphin --platformtheme qt5ct'
alias init_chrome='sh ~/scripts/zap.sh'
alias countdown='sh ~/scripts/countdown.sh'
alias run_dawki='cd ~/Code/dawki/;meson build;ninja -C ~/Code/dawki/build clang-format; ninja -C ~/Code/dawki/build; ~/Code/dawki/build/dawki'
alias s='stopwatch'
export GOPATH=/home/suyash/go
export GOBIN=$GOPATH/bin
export JAVA_HOME="/home/suyash/development/jdk-17.0.5"
export ANDROID_SDK_ROOT="/home/suyash/Android/Sdk"
export NDK_HOME="/home/suyash/Android/Sdk/ndk-bundle"
export PATH="$JAVA_HOME"/bin:/home/suyash/.cargo/bin:/home/suyash/development/platform-tools:/home/suyash/Android/Sdk/cmdline-tools/latest/bin:/home/suyash/development/elixir/bin:/home/suyash/.local/share/gem/ruby/3.0.0/bin:/var/lib/snapd/snap/bin:/usr/local/lib:$PATH:/usr/local/go/bin/:$GOPATH:$GOBIN:~/.local/bin/:/usr/local/lib/:/home/suyash/snap/flutter/common/flutter/bin/cache/dart-sdk/:/home/suyash/development/flutter/bin:/home/suyash/.pub-cache/bin/:~/Android/Sdk/cmdline-tools/latest/bin:~/Android/Sdk/emulator
export CPATH="$(clang -v 2>&1 | grep "Selected GCC installation" | rev | cut -d' ' -f1 | rev)/include"
export GO111MODULE=on
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:/tmp/feahnix/lib64/pkgconfig:$PKG_CONFIG_PATH"
export LD_LIBRARY_PATH="/usr/local/lib:/usr/local/lib64:/tmp/feahnix/lib64:$LD_LIBRARY_PATH"
export EDITOR='lvim'
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export CHROME_EXECUTABLE=chromium
function ss1() {
	cd ~/code/habgo-website && PORT=5001 yarn start
}
function ss2() {
	cd ~/code/tix-website && PORT=5002 yarn start
}
function ss3() {
	cd ~/code/notix-website && PORT=5003 yarn start
}
function ss4() {
	cd ~/code/fitr-website && PORT=5004 yarn start
}
function ss5() {
	cd ~/code/finix-website && PORT=5005 yarn start
}
function ss6() {
	cd ~/code/luki-website && PORT=5006 yarn start
}
function cm {
 GIT_COMMITTER_DATE="2022-${1}-${2}T${3}:${4}:${5}" GIT_AUTHOR_DATE="2022-${1}-${2}T${3}:${4}:${5}" git commit
}
function ghost {
    docker-compose -f /home/suyash/scripts/docker-ghost.yml up
}
function raw {
    sh ~/scripts/restart_awesome.sh
}
alias fl='flutter run -d linux'
alias fa='flutter run -d android'
alias notes='firejail --net=none --appimage --noprofile /home/suyash/Downloads/Logseq-linux-x64-0.8.11.AppImage &';
## [Completion] 
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/suyash/.dart-cli-completion/zsh-config.zsh ]] && . /home/suyash/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]
function macos_spice_start(){
docker run -d --device /dev/kvm -p 50922:10022 -p 5999:5999 -e "DISPLAY=${DISPLAY:-:0.0}" -e EXTRA="-monitor telnet::45454,server,nowait -nographic -serial null -spice disable-ticketing,port=5999" -e SMP=8 -e CORES=8 -e RAM=6 -v /tmp/.X11-unix:/tmp/.X11-unix -v "/data/vms/mac-img/mac_hdd_ng.img:/image" sickcodes/docker-osx:naked
}

[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec
