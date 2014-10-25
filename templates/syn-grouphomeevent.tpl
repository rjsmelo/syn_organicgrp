{if $offsetplusmaxRecords>$count}
	{$offsetplusmaxRecords = $count}
{/if}
Results 
{if $count}
	{$offsetplusone}
{else}
	0
{/if}
- {$offsetplusmaxRecords} of {$count} 
{if $results->getEstimate() > $count}
	({$results->getEstimate()} Total)
{/if}

{assign var='customsearchid' value='solsearch'}
	<div class="srShowResult col-md-12 pad-bottom-xl">
          {pagination_links offset_jsvar="customsearch_`$customsearchid`.offset" _onclick="window.customsearch_`$customsearchid`.options.requireinput=false;$('#customsearch_`$customsearchid`').submit();return false;" resultset=$results}{/pagination_links}
	</div>

{foreach item=result from=$results}
	<div class="clear"></div>
	<div class="split-box event-box">
		<div class="col-sm-3 col-xs-4 event_left_panel vcenter text-center clickable">
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

		<div class="event_right_panel col-sm-9 col-xs-8">
			<h3><a href="./ViewEvent?itemId={$result.object_id|escape}" class="title">{$result.title|escape}</a></h3>
			<div class="row icon-bar de_emphasize">
				<div class="col-xs-3">
					<span class="fa fa-location-arrow fa-lg"></span> {$result.tracker_field_eventLocatiob}
				</div>
				<div class="col-xs-3">
					<span class="fa fa-user fa-lg"></span> {$result.tracker_field_presenter}
				</div>
				<div class="col-xs-6">
					<span class="fa fa-calendar fa-lg"></span> 
					{if $result.tracker_field_startDate2|date_format:"%b %e" eq $result.tracker_field_endDate|date_format:"%b %e"} 
						{$result.tracker_field_startDate2|date_format:"%b %e %R"} - {$result.tracker_field_endDate|date_format:"%R"}
					{else}
						{$result.tracker_field_startDate2|date_format:"%b %e %R"} - {$result.tracker_field_endDate|date_format:"%b %e %R"}
					{/if}
				</div>
			</div>
			<div class="mar-top-lg mar-bottom-xl">
				{$result.desc}
			</div>
			
			<div class="row">
				<div class="text-left col-xs-6">
					{* If Created in the past two weeks, display new_ribbon. *}
					{if '-14 days'|date_format:'%Y-%m-%d'  <=  $result.creation_date}
						<div class="new_ribbon">New</div>
					{/if}
				</div>
				<div class="text-right col-xs-6 mar-bottom-lg">
					<a class="btn btn-primary" href="./ViewEvent?itemId={$result.object_id|escape}"><span class="fa fa-arrow-circle-o-right fa-lg"></span>Details ...</a>
				</div>	

			</div>
			
		</div>
	</div>
{/foreach}

<div class="srShowResult">
           {pagination_links offset_jsvar="customsearch_`$customsearchid`.offset" _onclick="window.customsearch_`$customsearchid`.options.requireinput=false;$('#customsearch_`$customsearchid`').submit();return false;" resultset=$results}{/pagination_links}
		<div class="clear"></div>
</div>
