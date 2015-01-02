{assign "username" "{$activity.user|userlink}"}
{assign "user_id" "{$activity.user}"}
{assign "groupid" "{$activity.forum_id|groupidbyforumid}"}

{assign "heading" "{$username} posted in the forum <a href='#'>{$activity.title}</a> in <a href='syn_organicgrp_grouphomepage?organicgroup={$groupid}'>{$groupid|groupnamebyid}</a>"}
{assign "content" "{$activity.content|truncate:100}"}

{include file="./syn.general.activity.tpl" icon="fa-comment-o" heading="{$heading}" content="{$content}"}