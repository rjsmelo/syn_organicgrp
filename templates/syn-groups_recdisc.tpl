{foreach item=result from=$results}
	<div class="row">
		<div class="group_dis_title"><a href="./tiki-view_forum_thread.php?comments_parentId={$result.object_id|escape}" class="title">{$result.title|escape}</a></div>
		<div class="group_avatar">
			{$result.author|replace:'~/np~':''|replace:'~np~':''|avatarize}
		</div>
		<div class="group_title">
			{if $result.parent_thread_id}
				<div class="author_group_info">{$result.contributors|userlink}</a> {tr}replied to{/tr} {$result.parent_contributors|userlink}'s {tr}discussion{/tr}</div>
				<div class="">{$result.post_snippet|truncate:100:"..."}<br /><i><a href="./tiki-view_forum_thread.php?comments_parentId={$result.object_id|escape}">{tr}read reply{/tr}</a></i></div>
			{else}
				<div class="author_group_info">{$result.contributors|userlink} {tr}started a new discussion{/tr}</div>
				<div class="">{$result.post_snippet|truncate:100:"..."}</div>
			{/if}
		</div>
	</div>
{/foreach}
