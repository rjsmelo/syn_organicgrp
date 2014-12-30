{assign "username" "{$activity.user|username}"}
{assign "user_id" "{$activity.user}"}

{assign "heading" "<a href='profile?view_user={$user_id}'>{$username}</a> uploaded a file <a href='syn_organicgrp_groupfiles?organicgroup={$activity.groupid|escape}'>{$activity.file|filenamebyid}</a> in <a href='syn_organicgrp_grouphomepage?organicgroup={$activity.groupid|escape}'>{$activity.groupid|groupnamebyid}</a>"}

{assign "content" "{$activity.desc}"}

{include file="./syn.general.activity.tpl" icon="fa-upload" heading="{$heading}" content="{$content}"}