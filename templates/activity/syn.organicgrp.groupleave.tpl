{assign "username" "{$activity.user|username}"}
{assign "user_id" "{$activity.user}"}

{assign "heading" "<a href='profile?view_user={$user_id}'>{$username}</a> left {$prefs.ta_syn_organicgrp_sterm|a_or_an} <a href='syn_organicgrp_grouphomepage?itemId={$activity.organicgroupid|escape}'>{$activity.organicgroupname}</a>"}
{assign "content" "{$activity.organicgroupname}</a> bids you farewell."}

{include file="./syn.general.activity.tpl" icon="fa-sign-in" heading="{$heading}" content="{$content}"}