CHAR="»"

if (( $UID == 0 )) {
	COLOR="%(?,green,red)"
} else {
	COLOR="%(?,blue,red)"
}

PROMPT="%F{$COLOR}$ %f"
#PROMPT="%F{black}%S%s%K{black}%F{$COLOR} $CHAR %F{black}%K{$COLOR}%k%F{$COLOR}%f "
#RPROMPT="%F{yellow}%F{black}%K{yellow}%K{black}%F{yellow} %~ %k%F{black}%S%s"
