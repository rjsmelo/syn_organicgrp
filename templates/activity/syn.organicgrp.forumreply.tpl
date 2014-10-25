{assign "username" "{$activity.user|username}"}
{assign "user_id" "{$activity.user}"}

{assign "heading" "<a href='profile?view_user={$user_id}'>{$username}</a> replied to a post in <a href='#'>{$activity.topictitle}</a>"}
{assign "content" "{$activity.content}"}

{include file="./syn.general.activity.tpl" icon="fa-comments-o" heading="{$heading}" content="{$content}"}