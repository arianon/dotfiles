function weechat --description 'Wrapper for weechat using dtach(1)'
	if which dtach > /dev/null ^& 1
        dtach -A /tmp/weechat.sk weechat $argv
    else
        weechat $argv
    end
end
