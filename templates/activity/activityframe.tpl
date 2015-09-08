
<div class="activity_border"></div>
<div class="activity_item clearfix">
	<div class="pull-left">
		{$activityframe.params["icon"]}
	</div>
	<div class="panel panel-default col-xs-9 col-sm-10">
		<div class="arrow"><span class="fa fa-caret-left fa-2x"></span></div>
		<div class="panel-body">
			<div class="topline">
				{$activityframe.params["heading"]}
				{if $tiki_p_admin == 'y'}
					<a class="pull-right delete-activity btn btn-xs"
					   href="{bootstrap_modal controller=managestream action=deleteactivity activityId=$activity.object_id}"
					   data-activity-id="{$activity.object_id}">
						<i class="fa fa-times fa-lg"></i>
					</a>
				{/if}
			</div>
			{if $activityframe.params["content"]}
				<div class="well well-sm">
					<p>{$activityframe.params["content"]}</p>
				</div>
			{/if}
			<span class="date"><small>{$activity.modification_date|date_format:'%B %e, %Y at %l:%M %p'}</small></span>
		</div>
	</div>
</div>