{assign "username" "{$activity.user|username}"}
{assign "user_id" "{$activity.user}"}

{assign "usergrp" "syn_organicgrp_{$activity.organicgroupid}"}
{if $usergrp eq $activity.groupname}
	{if $activity.groupname|in_group}
		{if $activity.group_creator eq $activity.user}
			{assign "heading" "<a href='profile?view_user={$user_id}'>{$username}</a> created the group <a href='syn_organicgrp_grouphomepage?itemId={$activity.organicgroupid|escape}'>{$activity.organicgroupname}</a>"}
		{else}
			{assign "heading" "<a href='profile?view_user={$user_id}'>{$username}</a> joined the group <a href='syn_organicgrp_grouphomepage?itemId={$activity.organicgroupid|escape}'>{$activity.organicgroupname}</a>"}
		{/if}
	{else}
		{if $activity.group_creator eq $activity.user}
			{assign "heading" "<a href='profile?view_user={$user_id}'>{$username}</a> created the group <a href='syn_organicgrp_grouphomepage?itemId={$activity.organicgroupid|escape}'>{$activity.organicgroupname}</a>"}
		{else}
			{assign "heading" "<a href='profile?view_user={$user_id}'>{$username}</a> joined the group <a href='syn_organicgrp_grouphomepage?itemId={$activity.organicgroupid|escape}'>{$activity.organicgroupname}</a>"}
		{/if}
	{/if}
	{assign "content" "{$activity.organicgroupname}</a> is pleased to welcome its newest member."}

	{include file="./syn.general.activity.tpl" icon="fa-sign-in" heading="{$heading}" content="{$content}"}
{/if}