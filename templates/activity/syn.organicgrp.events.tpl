{assign "username" "{$activity.user|username}"}
{assign "user_id" "{$activity.user}"}

{assign "heading" "<a href='profile?view_user={$user_id}'>{$username}</a> created the event <a href='syn_organicgrp_event?organicgroup={$activity.groupid|escape}&start=now&end=1893495012&type=up'>{$activity.title}</a> in <a href='syn_organicgrp_grouphomepage?organicgroup={$activity.groupid|escape}'>{$activity.groupid|groupnamebyid}</a>"}

{include file="./syn.general.activity.tpl" icon="fa-calendar-o" heading="{$heading}"}