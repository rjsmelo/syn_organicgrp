{assign "username" "{$activity.user|username}"}
{assign "user_id" "{$activity.user}"}
{assign "usergrp" "syn_organicgrp_{$activity.organicgroupid}"}
{if $usergrp eq $activity.groupname}
	{if $activity.groupname|in_group}
		{if $activity.group_creator neq $activity.user}
			{assign "heading" "{$user_id|userlink} created a group <a href='syn_organicgrp_grouphomepage?organicgroup={$activity.organicgroupid|escape}'>{$activity.organicgroupname}</a>"}
			{assign var="faicon" value="fa-plus-square"}
		{/if}
	{else}
		{if $activity.group_creator neq $activity.user}
			{assign "heading" "{$user_id|userlink} created a group <a href='syn_organicgrp_grouphomepage?organicgroup={$activity.organicgroupid|escape}'>{$activity.organicgroupname}</a>"}
			{assign var="faicon" value="fa-plus-square"}
		{/if}
	{/if}

	{include file="./syn.general.activity.tpl" icon="{$faicon}" heading="{$heading}"}
{/if}