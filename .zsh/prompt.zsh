CHAR="$" # "⟩"

if (( $UID == 0 )) ISROOT="%F{magenta}root%f "

PROMPT="$ISROOT%(?,%F{blue},%F{red})$CHAR %f"
RPROMPT="%F{yellow}%~%f"
