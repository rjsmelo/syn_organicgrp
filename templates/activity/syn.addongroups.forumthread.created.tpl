{assign "username" "{$activity.user|userlink}"}
{assign "user_id" "{$activity.user}"}
{assign "groupid" "{$activity.forum_id|groupidbyforumid}"}
{assign "url" "forumthread{$activity.object}?organicgroup={$groupid}"}

{assign "heading" "{$username} started a discussion {object_link type=$activity.type id=$activity.object url={$url}} in <a href='syn_organicgrp_grouphomepage?organicgroup={$groupid}'>{$groupid|groupnamebyid}</a>"}

{assign "content" "{$activity.content|truncate:100}"}

{include file="./syn.general.activity.tpl" icon="fa-comment-o" heading="{$heading}" content="{$content}"}