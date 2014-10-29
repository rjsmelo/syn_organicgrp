
<table id="table-forum" class="table table-hover table-striped table-condensed table-hover table-forum">
	<thead>
		<tr>
			<th><span class="mar-left-lg">Discussion</span></th>
			<th class="text-center">Replies</th>
			<th class="text-right"><span class="mar-right-lg">Last Reply</span></th>
		</tr>
	</thead>
	<tbody>
		{foreach item=result from=$results}
		<tr>
			<td>
				<div class="avatar display-in-block mar-left-lg hidden-xs hidden-sm">
					<div class="thumb" style="background-image: url(tiki-show_user_avatar.php?user={$result.contributors[0]})"></div>
				</div>
				<div class="display-in-block pad-left-lg">
					<a href="./tiki-view_forum_thread.php?comments_parentId={$result.object_id|escape}"><h4>{$result.title|escape}</h4></a>
					<h6>By <a href="profile?view_user={$result.contributors[0]}">{$result.contributors[0]|username}</a></h6>
				</div>
			</td>
			<td class="text-center">
				{$result.comment_count}
			</td>
			<td class="text-right">
				<span class="mar-right-lg">{$result.modification_date|date_format}</span>
			</td>
		</tr>
		{/foreach}
	</tbody>
</table>	