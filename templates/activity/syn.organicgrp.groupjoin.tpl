{assign "username" "{$activity.user|username}"}
{assign "user_id" "{$activity.user}"}

{assign "usergrp" "syn_organicgrp_{$activity.organicgroupid}"}
{if $usergrp eq $activity.groupname}
	{if $activity.groupname|in_group}
		{if $activity.group_creator eq $activity.user}
			{assign "heading" "{$user_id|userlink} created the group <a href='syn_organicgrp_grouphomepage?itemId={$activity.organicgroupid|escape}'>{$activity.organicgroupname}</a>"}
			{assign var="faicon" value="fa-plus-square"}
		{else}
			{assign "heading" "{$user_id|userlink} joined the group <a href='syn_organicgrp_grouphomepage?itemId={$activity.organicgroupid|escape}'>{$activity.organicgroupname}</a>"}
			{assign var="faicon" value="fa-sign-in"}
		{/if}
	{else}
		{if $activity.group_creator eq $activity.user}
			{assign "heading" "{$user_id|userlink} created the group <a href='syn_organicgrp_grouphomepage?itemId={$activity.organicgroupid|escape}'>{$activity.organicgroupname}</a>"}
			{assign var="faicon" value="fa-plus-square"}
		{else}
			{assign "heading" "{$user_id|userlink} joined the group <a href='syn_organicgrp_grouphomepage?itemId={$activity.organicgroupid|escape}'>{$activity.organicgroupname}</a>"}
			{assign var="faicon" value="fa-sign-in"}
		{/if}
	{/if}

	{include file="./syn.general.activity.tpl" icon="{$faicon}" heading="{$heading}"}
{/if}