{foreach item=result from=$results}
	<div class="media">
		<div class="pull-left event_left_panel_home">
			<span>
			{if $result.tracker_field_startDate2|date_format:"%b %e" eq $result.tracker_field_endDate|date_format:"%b %e"}
				{$result.tracker_field_startDate2|date_format:"%b %e"}
			{elseif $result.tracker_field_startDate2|date_format:"%b" eq $result.tracker_field_endDate|date_format:"%b"}
				{$result.tracker_field_startDate2|date_format:"%b <br> %e"} - {$result.tracker_field_endDate|date_format:"%e"}
			{else}
				{$result.tracker_field_startDate2|date_format:"%b %e"} - {$result.tracker_field_endDate|date_format:"%b %e"}
			{/if}
			</span>
		</div>

		<div class="media-body">
			<h5 class="media-heading">
				<a href="./syn_organicgrp_ViewEvent?itemId={$result.object_id|escape}" class="title">{$result.title|escape}</a>
			</h5>
			{$result.event_desc}
				<a class="btn btn-link" href="./syn_organicgrp_ViewEvent?itemId={$result.object_id|escape}"></span>{tr}More{/tr}</a>
		</div>
	</div>
{/foreach}