{foreach item=result from=$results}
	<div class="mar-bottom-lg">
		<div class="mar-right-lg pull-left"><span class="fa fa-caret-right fa-lg"></span></div>
		<div>
			{if $result.parent_thread_id}
				<a href="./tiki-view_forum_thread.php?comments_parentId={$result.parent_thread_id|escape}" class="title">{$result.title|escape}</a>
			{else}
				<a href="./tiki-view_forum_thread.php?comments_parentId={$result.object_id|escape}" class="title">{$result.title|escape}</a>
			{/if}
		</div>
	</div>
{foreachelse}
	{tr}No items{/tr}
{/foreach}