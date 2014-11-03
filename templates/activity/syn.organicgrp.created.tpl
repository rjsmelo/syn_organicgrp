{assign "username" "{$activity.user|username}"}
{assign "user_id" "{$activity.user}"}

{assign "heading" "New Collaboration"}
{assign "content" "<a href='profile?view_user={$user_id}'>{$username}</a> has been created <a href='#'>{$activity.organicgroupname}</a>"}

{include file="./syn.general.activity.tpl" icon="fa-comments-o" heading="{$heading}" content="{$content}"}