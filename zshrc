# -*- mode: sh -*-
# Xorg

[[ -z $DISPLAY && $XDG_VTNR == 1 ]] && exec startx

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload -U colors && colors

# Prompt
prompt off
setopt PROMPT_SUBST

PROMPT="%(?,%F{blue},%F{red})λ %{$reset_color%}"
RPROMPT="%F{black}%~%{$reset_color%}"

source ~/.shell.d/environment
source ~/.shell.d/aliases
source ~/.shell.d/functions
source ~/.shell.d/infinality

unalias lsw

PERL5LIB="/home/arianon/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/arianon/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/arianon/perl5\""; export PERL_MB_OPT;
PERL_LOCAL_LIB_ROOT="/home/arianon/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/arianon/perl5\""; export PERL_MB_OPT;
PERL_MM_OPiiT="INSTALL_BASE=/home/arianon/perl5"; export PERL_MM_OPT;
PERL_MM_OPiiT="INSTALL_BASE=/home/arianon/perl5"; export PERL_MM_OPT;

which todo && todo
