{foreach item=result from=$results}
	<div class="clear"></div>
	<div class="row">
		<div class="col-md-2 col-sm-3 col-xs-4">
			<div class="thumb" style="background-image: url(tiki-show_user_avatar.php?user={$result.contributors[0]})"></div>
		</div>
		<div class="col-md-10 col-sm-9 col-xs-8">
			<h3 class="nomargin pad-bottom"><a href="./tiki-view_forum_thread.php?comments_parentId={$result.object_id|escape}" class="title">{$result.title|escape}</a></h3>
			<p class="h5 align-top">By <a href="profile?view_user={$result.contributors[0]}">{$result.contributors[0]|username}</a></p>
			<p>{$result.contents|truncate:300:"..."}</p>
			<a class="pull-right btn btn-primary" href="./tiki-view_forum_thread.php?comments_parentId={$result.object_id|escape}"><span class="fa fa-location-arrow fa-lg"></span> Read More</a>
		</div>
		<div class="col-lg-12"><hr class="bold_hr"></div>
	</div>
{/foreach}