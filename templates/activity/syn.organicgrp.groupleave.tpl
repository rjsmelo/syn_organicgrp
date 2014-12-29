{assign "username" "{$activity.user|userlink}"}

{assign "heading" "<a href='profile?view_user={$user_id}'>{$username}</a> has left the group <a href='syn_organicgrp_grouphomepage?organicgroup={$activity.organicgroupid|escape}'>{$activity.organicgroupname}</a>"}

{include file="./syn.general.activity.tpl" icon="fa-sign-out" heading="{$heading}"}