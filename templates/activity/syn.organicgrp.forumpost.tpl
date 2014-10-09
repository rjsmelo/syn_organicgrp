<div class="activity_border"></div>
<div class="clearfix pad-bottom-xl pad-top-xl">
	<div class="pull-left">
		<span class="activitytime">{$activity.modification_date|date_format:'%H:%M'}</span><span class="fa fa-comment activity_icon"></span>
	</div>
	<div class="activity_popover popover right col-md-9">	
		<div class="arrow"></div> 
		<div class="popover-content">
			{activityframe activity=$activity heading="{tr _0=$activity.user|userlink}%0 has started a new topic in{/tr} <a href=tiki-view_forum.php?forumId={$activity.forum_id|escape}>{$activity.object|forumname|addongroupname}</a>"}
			<div class="well well-sm mar-top-xl">
				<p>
					{ifsearchexists type="forum post" id="{$activity.object|escape}"}
						<a href="tiki-view_forum_thread.php?comments_parentId={$activity.object|escape}">{$activity.title|escape}</a><br/>
						{$activity.content|truncate:80}
					{/ifsearchexists}
					{ifsearchnotexists type="forum post" id="{$activity.object|escape}"}
						{$activity.title|escape} (deleted)
					{/ifsearchnotexists}
				</p>
			</div>
			{/activityframe}
		</div>
	</div>
</div>
