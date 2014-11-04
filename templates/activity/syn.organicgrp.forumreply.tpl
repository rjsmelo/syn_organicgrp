{assign "username" "{$activity.user|username}"}
{assign "user_id" "{$activity.user}"}

{assign "heading" "<a href='profile?view_user={$user_id}'>{$username}</a> replied to a post in <a href='syn_organicgrp_grouphomepage?itemId={$activity.object|escape}'>{$activity.topictitle}</a>"}
{assign "content" "{$activity.post_content_no_quote}"}

{include file="./syn.general.activity.tpl" icon="fa-comments-o" heading="{$heading}" content="{$content}"}