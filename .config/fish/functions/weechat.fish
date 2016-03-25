function weechat
	set -l manager (which abduco ^/dev/null; or which dtach ^/dev/null)

	if [ "$manager" ]
		eval $manager -A /tmp/weechat.sk weechat
	else
		weechat
	end
end
