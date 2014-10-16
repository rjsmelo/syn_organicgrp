{foreach item=result from=$results}
	<div class="clear"></div>
	<div class="row event-split-box">
		<div class="col-md-2  col-sm-3 col-xs-4 event_left_panel vcenter text-center clickable">
			<a href="./ViewEvent?itemId={$result.object_id|escape}"></a>
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
		<div class="col-md-10 col-sm-9 col-xs-8">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mar-bottom-lg">
				<h3 class="nomargin"><a href="./ViewEvent?itemId={$result.object_id|escape}" class="title">{$result.title|escape}</a></h3>
			</div>
			<div class="de_emphasize col-xs-3 col-sm-4 col-md-4 col-lg-4">
				<span class="fa fa-location-arrow fa-lg"></span>{$result.tracker_field_eventLocatiob}
			</div>
			<div class="de_emphasize col-xs-3 col-sm-3 col-md-3 col-lg-3">
				<span class="fa fa-user fa-lg"></span>{$result.tracker_field_presenter}
			</div>
			<div class="de_emphasize col-xs-5 col-sm-5 col-md-5 col-lg-5">
				<span class="fa fa-calendar fa-lg"></span>
				{if $result.tracker_field_startDate2|date_format:"%b %e" eq $result.tracker_field_endDate|date_format:"%b %e"} 
					{$result.tracker_field_startDate2|date_format:"%b %e %R"} - {$result.tracker_field_endDate|date_format:"%R %Z"}
				{else}
					{$result.tracker_field_startDate2|date_format:"%b %e %R"} - {$result.tracker_field_endDate|date_format:"%b %e %R %Z"}
				{/if}
			</div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mar-bottom-lg">
				{$result.event_desc}
			</div>
			<div class="text-left col-xs-6 col-sm-6 col-md-6 col-lg-6">
				{* If Created in the past two weeks, display new_ribbon. *}
				{if '-14 days'|date_format:'%Y-%m-%d'  <=  $result.creation_date}
					<div class="new_ribbon folded_corner">New</div>
				{/if}
			</div>
			<div class="text-right col-xs-6 col-sm-6 col-md-6 col-lg-6 mar-bottom-lg">
				<a class="btn btn-primary" href="./ViewEvent?itemId={$result.object_id|escape}"><span class="fa fa-location-arrow fa-lg"></span> Read More</a>
			</div>
		</div>
	</div>
			<div class="col-lg-12"><hr class="bold_hr"></div>
{/foreach}