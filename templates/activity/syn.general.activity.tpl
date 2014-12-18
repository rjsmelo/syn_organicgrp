<div class="activity_border"></div>
<div class="activity_item clearfix">
	<div class="pull-left">
		<span class="fa {$icon} activity_icon"></span>
	</div>
	<div class="panel panel-default col-xs-9 col-sm-10">
		<div class="arrow"><span class="fa fa-caret-left fa-2x"></span></div>
		<div class="panel-body">
			<div class="topline">{$heading}</div>
			{if $content}
			<div class="well well-sm">
				<p>{$content}</p>
			</div>
			{/if}
			<span class="date"><small>{$activity.modification_date|date_format:'%B %e, %Y at %l:%M %p'}</small></span>
		</div>
	</div>
</div>