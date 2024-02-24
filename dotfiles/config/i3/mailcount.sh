#! /bin/zsh

local maildir=~/.mail/gmail/
local -a boxes

boxes=( INBOX Sindicetech Sindicetech.Github rust rust.Github )

local unread=0
for box in $boxes; do
	local new=$(ls ${maildir}${box}/new | wc -l)
	unread=$((unread + new))
done

jo -- icon=mail -s text=$unread
