<div class="col-md-6 col-sm-6 mar-bottom mar-top nopadding">
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
</div>

{assign var='customsearchid' value='solsearch'}
	<div class="srShowResult col-md-6 col-sm-6 mar-bottom-lg nopadding">
        {pagination_links offset_jsvar="customsearch_`$customsearchid`.offset" _onclick="window.customsearch_`$customsearchid`.options.requireinput=false;$('#customsearch_`$customsearchid`').submit();return false;" resultset=$results}{/pagination_links}
		<div class="clear"></div>
	</div>
	<div class="clear"></div>

{foreach item=result from=$results}
	<div class="panel panel-default search-result">
	    <div class="panel-body">
	    	{* If Created in the past two weeks, display new_ribbon. *}
            {if '-14 days'|date_format:'%Y-%m-%d'  <=  $result.creation_date}
                <div class="col-md-2 pull-right newribbon" style="background-image:url('img/new-ribbon.png');"></div>
            {/if}
	    	<div class="media">
		        <a class="pull-left" href="./syn_organicgrp_ViewEvent?itemId={$result.object_id|escape}&organicgroup={$result.tracker_field_groupId}&cat={$result.categories[0]}">
		  			<i class="fa fa-calendar fa-4x"></i>
				</a>
	  			<div class="media-body">
					<h3 class="media-heading"><a href="./syn_organicgrp_ViewEvent?itemId={$result.object_id|escape}&organicgroup={$result.tracker_field_groupId}&cat={$result.categories[0]}" class="title">{$result.title|escape}</a></h3>
					<div class="mar-bottom-lg mar-top-lg"><strong>
                        {if $result.tracker_field_startDate2|date_format:"%Y" eq $result.tracker_field_endDate|date_format:"%Y"}
							{if $result.tracker_field_startDate2|date_format:"%B %e" eq $result.tracker_field_endDate|date_format:"%B %e"}
								{$result.tracker_field_startDate2|date_format:"%B %e, %l:%M%p"} - {$result.tracker_field_endDate|date_format:"%l:%M%p"}
							{elseif $result.tracker_field_startDate2|date_format:"%B" eq $result.tracker_field_endDate|date_format:"%B"} 
								{$result.tracker_field_startDate2|date_format:"%B %e"} - {$result.tracker_field_endDate|date_format:"%e, %Y"}
							{else}
								{$result.tracker_field_startDate2|date_format:"%B %e"} - {$result.tracker_field_endDate|date_format:"%B %e, %Y"}
							{/if}
						{else}
							{$result.tracker_field_startDate2|date_format:"%B %e, %Y"} - {$result.tracker_field_endDate|date_format:"%B %e, %Y"}
						{/if}
					</strong> </div>
		  		</div>
		  		{assign var="summary_desc" value={$result.tracker_field_eventSummary}|cat:' '|cat:{$result.tracker_field_eventDescription}}
		  		<p>{$summary_desc|truncate:200}</p>
	  		</div>
	    </div>
	    <div class="panel-footer clearfix">
	    	<div class="pull-left icon-bar">
	    		{if $result.tracker_field_eventLocation}
		    		<div class="icon"><span class="fa fa-location-arrow fa-lg"></span> {$result.tracker_field_eventLocation}</div>
		    	{/if}
		    	{if $result.tracker_field_presenter}
		  			<div class="icon"><span class="fa fa-microphone fa-lg"></span> {$result.tracker_field_presenter}</div>
		  		{/if}
		  	</div>
	  		<div class="pull-right">
	  			<a class="pull-right btn btn-action" href="./syn_organicgrp_ViewEvent?itemId={$result.object_id|escape}&organicgroup={$result.tracker_field_groupId}&cat={$result.categories[0]}"><span class="fa fa-arrow-circle-o-right fa-lg"></span> Details</a>
	  		</div> 
	    </div>
	</div>
{/foreach}

<div class="srShowResult">
    {pagination_links offset_jsvar="customsearch_`$customsearchid`.offset" _onclick="window.customsearch_`$customsearchid`.options.requireinput=false;$('#customsearch_`$customsearchid`').submit();return false;" resultset=$results}{/pagination_links}
	<div class="clear"></div>
</div>

