{assign "username" "{$activity.user|username}"}
{assign "user_id" "{$activity.user}"}

{assign "heading" "<a href='profile?view_user={$user_id}'>{$username}</a> joined the group <a href='syn_organicgrp_grouphomepage?itemId={$activity.organicgroupid|escape}'>{$activity.organicgroupname}</a>"}
{assign "content" "{$activity.organicgroupname}</a> is pleased to welcome its new member."}

{include file="./syn.general.activity.tpl" icon="fa-sign-in" heading="{$heading}" content="{$content}"}