{assign "username" "{$activity.user|username}"}
{assign "user_id" "{$activity.user}"}

{assign "usergrp" "syn_organicgrp_{$activity.organicgroupid}"}

{assign "heading" "{$user_id|userlink} Requested to joined the group <a href='syn_organicgrp_grouphomepage?organicgroup={$activity.object|escape}'>{$activity.organicgroupname}</a>"}
{assign var="faicon" value="fa-user"}
{include file="./syn.general.notification.tpl" heading="{$heading}"}
