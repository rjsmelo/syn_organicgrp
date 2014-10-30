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
	<div class="panel panel-default search-result">
	    <div class="panel-body">
	    	<div class="media">
		        <a class="pull-left" href="./syn_organicgrp_ViewEvent?itemId={$result.object_id|escape}&organicgroup={$result.tracker_field_groupId}&cat={$result.categories[0]}">
		  			<i class="fa fa-calendar fa-4x"></i>
				</a>
	  			<div class="media-body">
	  			 	{* If Created in the past two weeks, display new_ribbon. *}
                    {if '-14 days'|date_format:'%Y-%m-%d'  <=  $result.creation_date}
                            <div class="pull-right new_ribbon">New</div>
                    {/if}
					<h3 class="media-heading"><a href="./syn_organicgrp_ViewEvent?itemId={$result.object_id|escape}&organicgroup={$result.tracker_field_groupId}&cat={$result.categories[0]}" class="title">{$result.title|escape}</a></h3>
					<div class="mar-bottom-lg mar-top-lg"><strong>
                        {if $result.tracker_field_startDate2|date_format:"%b %e" eq $result.tracker_field_endDate|date_format:"%b %e"}
                        {$result.tracker_field_startDate2|date_format:"%b %e %R"} - {$result.tracker_field_endDate|date_format:"%R"}
                        {else}
                                {$result.tracker_field_startDate2|date_format:"%b %e %R"} - {$result.tracker_field_endDate|date_format:"%b %e %R"}
                        {/if}
					</strong> </div>
		  		</div>
		  		<p>{$result.desc}</p>
	  		</div>
	    </div>
	    <div class="panel-footer clearfix">
	    	<div class="pull-left icon-bar">
		    	<div class="icon"><span class="fa fa-location-arrow fa-lg"></span> {$result.tracker_field_eventLocation}</div>
		  		<div class="icon"><span class="fa fa-user fa-lg"></span> {$result.tracker_field_presenter}</div>
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

