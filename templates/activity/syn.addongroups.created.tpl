{assign "username" "{$activity.user|username}"}
{assign "user_id" "{$activity.user}"}
{assign "usergrp" "syn_organicgrp_{$activity.object}"}
{assign "heading" "{$user_id|userlink} created a group <a href='syn_organicgrp_grouphomepage?organicgroup={$activity.organicgroupid|escape}'>{$activity.organicgroupname}</a>"}
{assign var="faicon" value="fa-plus-square"}

{include file="./syn.general.activity.tpl" icon="{$faicon}" heading="{$heading}"}
