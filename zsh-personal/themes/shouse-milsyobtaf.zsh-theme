# Best Goddamn zsh prompt in the whole world.
# Author: Seth House <seth@eseth.com>

fpath=( ~/.zsh_functions $fpath )
[[ -d $HOME/.zsh_functions/VCS_Info ]] \
    && fpath[1]=( ${fpath[1]} ~/.zsh_functions/**/*~*/(CVS)#(/) )

autoload -U colors && colors
autoload -U promptinit
autoload -Uz vcs_info

local reset white gray green red yellow
reset="%{${reset_color}%}"
white="%{$fg[white]%}"
gray="%{$fg_bold[black]%}"
green="%{$fg_bold[green]%}"
red="%{$fg[red]%}"
yellow="%{$fg[yellow]%}"

# Set nethack prompt options
local -A pr_com
local -a pr_llines pr_rlines

# zstyle ':vcs_info:*+*:*' debug true
# zstyle ':pr_nethack:*' debug true

# Set default mode when zsh is first loaded (not every time prompt is drawn)
# Modes: full, compact, bare
if [[ $LINES -lt 5 ]] ; then
    zstyle ":pr_nethack:" mode compact
else
    zstyle ":pr_nethack:" mode full
fi
zstyle ':pr_nethack:*' hooks pwd usr vcs venv jobs prompt
zstyle ':pr_nethack:*' pet "d" # A domestic animal, the _tame dog_ (_Canis familiaris_)
zstyle ':pr_nethack:*' pwd "%~"
zstyle ':pr_nethack:*' usr "%n"
zstyle ':pr_nethack:*' host "%m"

# Set vcs_info options
zstyle ':vcs_info:*' enable git hg bzr svn
zstyle ':vcs_info:(hg*|git*):*' get-revision true
zstyle ':vcs_info:(hg*|git*):*' check-for-changes true

zstyle ':vcs_info:(hg*|git*)' formats "(%s) %12.12i %c%u %b%m" # hash changes branch misc
zstyle ':vcs_info:(hg*|git*)' actionformats "(%s|${white}%a${gray}) %12.12i %c%u %b%m"
zstyle ':vcs_info:hg*:*' branchformat "%b" # only show branch

zstyle ':vcs_info:(hg*|git*):*' stagedstr "${green}S${gray}"
zstyle ':vcs_info:(hg*|git*):*' unstagedstr "${red}U${gray}"

zstyle ':vcs_info:git*+set-message:*' hooks git-st git-stash git-untracked

# prompt functions ############################################################

# Run all the prompt hook functions
# (stolen, wholesale, from the excellent hook system in vcs_info)
function pr_run_hooks() {
    local debug hook func
    local -a hooks

    zstyle -g hooks ":pr_nethack:*" hooks
    zstyle -t ":pr_nethack:*" debug && debug=1 || debug=0

    (( ${#hooks} == 0 )) && return 0

    for hook in ${hooks} ; do
        func="+pr-${hook}"
        if (( ${+functions[$func]} == 0 )); then
            (( debug )) && printf '  + Unknown function: "%s"\n' "${func}"
            continue
        fi
        (( debug )) && printf '  + Running function: "%s"\n' "${func}"
        true
        ${func} "$@"
        case $? in
            (0)
                ;;
            (*)
                break
                ;;
        esac
    done
}

# Show the full two/three-line nethack prompt
# zstyle ':pr-nethack:' mode full
#
# ... ~/src/dotfiles v(dotfiles) .... shouse@ripley
# ... (git) d2a3f82fe9c5 U? master [origin/master ]
# ..d 3 %
function +pr-mode-full() {
    local -a lines pline infoline debug pet
    local i i_width i_pad filler dungeon

    zstyle -g pet ":pr_nethack:*" pet
    zstyle -t ":pr_nethack:*" debug && debug=1 || debug=0

    infoline=( ${pr_com[pwd]} ${pr_com[usr]} )
    [[ -n ${pr_com[venv]} ]] && infoline[1]=(
        ${infoline[1]}
        "v(${pr_com[venv]})"
    )

    # Full-width filler; search/replace color wraps to find real text width
    i_width=${(S)infoline//\%\{*\%\}} # search-and-replace color escapes
    i_width=${#${(%)i_width}} # expand all escapes and count the chars
    i_pad=5 # the dungeon floor + one space

    filler="${gray}${(l:$(( $COLUMNS - $i_width - $i_pad ))::.:)}${reset}"
    infoline[-1]=( ${filler} ${infoline[-1]} )

    [[ -n ${pr_com[jobs]} ]] && pline+=( ${pr_com[jobs]} )
    pline+=( ${pr_com[prompt]} )

    # Assemble all prompt lines
    lines=(
        "${(j: :)infoline}"
        "${(j: :)pline}"
    )
    [[ -n ${pr_com[vcs]} ]] && lines[1]=(
        "${lines[1]}"
        "${gray}${pr_com[vcs]}${reset}"
    )

    # Add dungeon floor to each line
    dungeon=${(l:$(( ${#lines} * 3 ))::.:)}
    dungeon[$[${RANDOM}%${#dungeon}]+1]=$pet

    for (( i=1; i < $(( ${#lines} + 1 )); i++ )) ; do
        case $i in
            1) x=1;; 2) x=4;; 3) x=7;; 4) x=10;;
        esac
        lines[$i]="${gray}${dungeon[x,$(( $x + 2 ))]} ${lines[$i]}${reset}"
    done

    pr_llines=( ${lines[@]} )
}

# Show the single-line prompt:
# zstyle ':pr-nethack:' mode compact
#
# ~/src/dotfiles %                        (git) d2a3f82f U? +1/-2
function +pr-mode-compact() {
    zstyle ':pr_nethack:*' pwd "%1~" # only last segment of cwd
    zstyle ':vcs_info:(hg*|git*)' formats "(%s) %8.8i %c%u %m" # no branch
    zstyle ':vcs_info:git*+set-message:*' hooks git-st git-st-compact git-untracked

    pr_llines=( "${pr_com[pwd]} ${pr_com[jobs]} ${pr_com[prompt]}" )

    [[ -n ${pr_com[vcs]} ]] && pr_rlines=(
        ${pr_com[vcs]}
    )
}

# Show just the prompt
# zstyle ':pr-nethack:' mode bare
#
# %
function +pr-mode-bare() {
    pr_llines=( "${pr_com[jobs]} ${pr_com[prompt]}" )
}

# Show the cwd in green if writable, yellow otherwise
function +pr-pwd() {
    local -a v_pwd i_pwd
    zstyle -g i_pwd ":pr_nethack:*" pwd

    [[ -w $PWD ]] && v_pwd+=( ${green} ) || v_pwd+=( ${yellow} )
    v_pwd+=( ${i_pwd} )
    v_pwd+=( ${reset} )
    pr_com[pwd]=${(j::)v_pwd}
}

# Show the current user, also show the host if SSH'ed in from somewhere
function +pr-usr() {
    local -a v_usr i_usr i_host
    zstyle -g i_usr ":pr_nethack:*" usr
    zstyle -g i_host ":pr_nethack:*" host

    v_usr=( ${i_usr} )
    [[ -n $SSH_CLIENT ]] && v_usr+=( "@${i_host}" )

    pr_com[usr]=${(j::)v_usr}
}

# Show info collected from vcs_info
function +pr-vcs() {
    local -a v_vcs

    [[ -n ${vcs_info_msg_0_} ]] && v_vcs=(
        ${gray}
        ${vcs_info_msg_0_}
        ${reset}
    )

    pr_com[vcs]=${(j::)v_vcs}
}

# Show virtualenv information
# TODO: possible to visually overlay this info with pwd if they overlap?
function +pr-venv() {
    local -a v_venv

    [[ -n ${VIRTUAL_ENV} ]] && v_venv=(
        ${gray}
        $(basename ${VIRTUAL_ENV})
        ${reset}
    )

    pr_com[venv]=${(j::)v_venv}
}

# Show number of background jobs, or hide if none
function +pr-jobs() {
    local v_jobs="%j"
    local n_jobs=${(%)v_jobs}

    [[ n_jobs -gt 0 ]] && pr_com[jobs]="${gray}${n_jobs}${reset}"
    return 0
}

# Show the shell prompt, red if the last exit code was non-zero
function +pr-prompt() {
    local -a v_prompt
    v_prompt=(
        "%(0?.${white}.${red})"
        "%#"
        ${reset}
    )
    pr_com[prompt]=${(j::)v_prompt}
}

# vcs_info functions ##########################################################

# Show remote ref name and number of commits ahead-of or behind
function +vi-git-st() {
    local ahead behind remote
    local -a gitstatus

    # Are we on a remote-tracking branch?
    remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} \
        --symbolic-full-name --abbrev-ref 2>/dev/null)}

    if [[ -n ${remote} ]] ; then
        ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
        (( $ahead )) && gitstatus+=( "${green}+${ahead}${gray}" )

        behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
        (( $behind )) && gitstatus+=( "${red}-${behind}${gray}" )

        user_data[gitstatus]=${gitstatus}
        hook_com[branch]="${hook_com[branch]} [${remote} ${(j:/:)gitstatus}]"
    fi
}

# Show the above/behind upstream counts more tersely for the compact display
function +vi-git-st-compact() {
    [[ -n ${user_data[gitstatus]} ]] \
        && hook_com[misc]="@{u}${(j:/:)user_data[gitstatus]}"
}

# Show count of stashed changes
function +vi-git-stash() {
    local -a stashes

    if [[ -s ${hook_com[base]}/.git/refs/stash ]] ; then
        stashes=$(git stash list 2>/dev/null | wc -l)
        hook_com[misc]+=" (${stashes} stashed)"
    fi
}

# Indicate if there are any untracked files present
function +vi-git-untracked() {
    local untracked

    #check if there's at least 1 untracked file
    untracked=${$(git ls-files --exclude-standard --others | head -n 1)}

    if [[ -n ${untracked} ]] ; then
        hook_com[unstaged]="${hook_com[unstaged]}${yellow}?${gray}"
    fi
}

# execute the above prompt functions ##########################################

# To be added to the precmd_* array so it is executed before each prompt
function precmd_prompt {
    local func debug
    local -a mode

    # Clear out old values
    pr_com=()
    pr_llines=()
    pr_rlines=()

    # Grab current values
    zstyle -g mode ":pr_nethack:" mode
    zstyle -t ":pr_nethack:*" debug && debug=1 || debug=0

    # Collect needed data
    vcs_info
    pr_run_hooks

    # Use the above data and build the prompt arrays
    func="+pr-mode-${mode}"
    if (( ${+functions[$func]} == 0 )); then
        (( debug )) && printf '  + Unknown function: "%s"\n' "${func}"
        func="+pr-mode-full"
    fi
    (( debug )) && printf '  + Running function: "%s"\n' "${func}"
    ${func} "$@"

    # Set the prompts
    PROMPT="${(F)pr_llines} "
    RPROMPT="${(F)pr_rlines}"
}