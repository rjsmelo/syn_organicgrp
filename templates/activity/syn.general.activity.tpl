<div class="activity_border"></div>
<div class="clearfix pad-bottom-xl pad-top-xl">
	<div class="pull-left">
		<span class="fa {$icon} activity_icon"></span>
	</div>
	<div class="activity_popover popover right col-xs-9 col-sm-10 popview">	
		<div class="arrow"></div> 
		<div class="popover-content">
			{$heading}
			{if $content}
			<div class="well well-sm mar-top-xl mar-bottom-sm">
				<p>{$content}</p>
			</div>
			{/if}
			<span class="pull-right mar-bottom-sm"><small>{$activity.modification_date|date_format:'%B %e, %Y at %l:%M %p'}</small></span>
		</div>
	</div>
</div>