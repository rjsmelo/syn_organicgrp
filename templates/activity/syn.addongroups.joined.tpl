{assign "username" "{$activity.user|username}"}
{assign "user_id" "{$activity.user}"}
{assign "usergrp" "syn_organicgrp_{$activity.organicgroupid}"}
{if $activity.user neq $activity.group_creator}
	{assign "heading" "{$user_id|userlink} joined the group <a href='syn_organicgrp_grouphomepage?organicgroup={$activity.object|escape}'>{$activity.organicgroupname}</a>"}
	{assign var="faicon" value="fa-sign-in"}
	{include file="./syn.general.activity.tpl" icon="{$faicon}" heading="{$heading}"}
{/if}
