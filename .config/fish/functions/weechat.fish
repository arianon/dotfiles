function weechat
	set -l manager

	for mgr in abduco dtach
		set manager (which $mgr ^/dev/null)
		and break
	end

	if [ "$manager" ]
		eval $manager -A /tmp/weechat.sk /usr/bin/weechat
	else
		/usr/bin/weechat
	end
end
