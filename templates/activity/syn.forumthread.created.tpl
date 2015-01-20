{assign "username" "{$activity.user|userlink}"}
{assign "user_id" "{$activity.user}"}

{assign "heading" "{$username} started a discussion {object_link type=$activity.type id=$activity.object} in Hot Topic
{object_link type=forum id=$activity.forum_id}"}
{assign "content" "{$activity.content|truncate:100}"}

{include file="./syn.general.activity.tpl" icon="fa-comment-o" heading="{$heading}" content="{$content}"}