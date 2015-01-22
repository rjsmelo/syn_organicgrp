{assign "username" "{$activity.user|username}"}
{assign "user_id" "{$activity.user}"}
{assign "orgid"  "{$activity.groupid|groupnamebycatid|replace:'syn_organicgrp_':''}"}
{assign "url" "syn_organicgrp_ViewEvent?itemId={$activity.object}&organicgroup={$orgid|escape}"}

{assign "heading" "{$user_id|userlink} created the event {object_link type=$activity.type id=$activity.object url={$url}} in group <a href='syn_organicgrp_grouphomepage?organicgroup={$orgid|escape}'>{$orgid|groupnamebyid}</a>"}
{assign "content" "{$activity.desc|truncate:200|escape}"}
{include file="./syn.general.activity.tpl" icon="fa-calendar-o" heading="{$heading}" content="{$content}"}