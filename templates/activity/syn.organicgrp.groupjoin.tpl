<div class="activity_border"></div>
<div class="clearfix pad-bottom-xl pad-top-xl">
	<div class="pull-left">
		<span class="activitytime">{$activity.modification_date|date_format:'%H:%M'}</span><span class="fa fa-user activity_icon"></span>
	</div>
	<div class="activity_popover popover right col-md-9">	
		<div class="arrow"></div> 
		<div class="popover-content">
			{activityframe activity=$activity heading="{tr _0=$activity.user|username _1=$activity.user}<a href='profile?view_user=%1'>%0</a> uploaded a resource.{/tr}"}
			<div class="well well-sm mar-top-xl">
				<p><a href="#">{$activity.organicgroupname}</a> has been uploaded to the repository.</p>
			</div>
			{/activityframe}
		</div>
	</div>
</div>