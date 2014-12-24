{assign "username" "{$activity.user|userlink}"}
{assign "user_id" "{$activity.user}"}

{assign "heading" "{$username} posted in the forum <a href='#'>{$activity.title}</a>"}
{assign "content" "{$activity.content|truncate:100}"}

{include file="./syn.general.activity.tpl" icon="fa-comment-o" heading="{$heading}" content="{$content}"}