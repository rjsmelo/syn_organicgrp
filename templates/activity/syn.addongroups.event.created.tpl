{assign "username" "{$activity.user|username}"}
{assign "user_id" "{$activity.user}"}
{assign "heading" "{$user_id|userlink} created the event <a href='syn_organicgrp_event?organicgroup={$activity.groupid|escape}&start=now&end=1893495012&type=up'>{$activity.title}</a> in group <a href='syn_organicgrp_grouphomepage?organicgroup={$activity.groupid|escape}'>{$activity.groupid|groupnamebyid}</a>"}
{assign "content" "{$activity.desc|truncate:200|escape}"}
{include file="./syn.general.activity.tpl" icon="fa-calendar-o" heading="{$heading}" content="{$content}"}