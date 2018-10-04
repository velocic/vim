# Launch a customized gdb debugging window with tmux & voltron
debug()
{
    terminalRows=$(tput lines)
    terminalCols=$(tput cols)

    tmux new -s gdb-session -x $terminalCols -y $terminalRows -d gdb $1
    tmux set-option mouse
    tmux split-window -vb "voltron view disasm --hide-header --hide-footer"
    tmux split-window -t 0 -h "voltron view command 'info locals' --lexer cpp --hide-header --hide-footer"
    tmux resize-pane -t 1 -R 30
    tmux resize-pane -t 2 -U 10
    tmux select-pane -t 2
    tmux attach -t gdb-session
}

vdebug()
{
    terminalRows=$(tput lines)
    terminalCols=$(tput cols)

    tmux new -s gdb-info -x $terminalCols -y $terminalRows -d "voltron view breakpoints"
    tmux set-option mouse
    tmux split-window "voltron view disasm"
    tmux split-window -h "voltron view command 'info locals' --lexer cpp"
    tmux resize-pane -t 1 -U 20
    tmux resize-pane -t 2 -R 40
    tmux select-pane -t 1
    tmux attach -t gdb-info
}

# More easily search for c++ std library features from man pages (if already installed via stdman on github: https://github.com/jeaye/stdman.git
ref()
{
    apropos . | grep -i std:: | grep -i "$1"
}

# Colors
default=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
purple=$(tput setaf 5)
orange=$(tput setaf 9)

# Less colors for man pages
export PAGER=less
# Begin blinking
export LESS_TERMCAP_mb=$red
# Begin bold
export LESS_TERMCAP_md=$orange
# End mode
export LESS_TERMCAP_me=$default
# End standout-mode
export LESS_TERMCAP_se=$default
# Begin standout-mode - info box
export LESS_TERMCAP_so=$purple
# End underline
export LESS_TERMCAP_ue=$default
# Begin underline
export LESS_TERMCAP_us=$green
