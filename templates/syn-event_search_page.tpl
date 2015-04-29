{assign var=start value="{if $smarty.get.start}{$smarty.get.start}{else}now{/if}"}
{assign var=end value="{if $smarty.get.end}{$smarty.get.end}{else}1893495012{/if}"}
{assign var=cat value=$values.cat}

{wikiplugin _name=customsearch tpl="addons/syn_organicgrp/templates/syn-event_left_search.tpl" id="solsearch"
searchfadediv="customsearch_solsearch_results" autosearchdelay="1" recalllastsearch="0"}
    {literal}
        {pagination max="10"}
        {filter type="trackeritem"}
        {filter content="4" field="tracker_id"}
        {sort mode="tracker_field_startDate2_asc"}
        {filter range="tracker_field_endDate" from="{/literal}{$start}{literal}" to="{/literal}{$end}{literal}"}
        {filter content="{/literal}{$cat}{literal}" field="tracker_field_groupId"}
        {filter field="tracker_status" content="o"}
        {output template="addons/syn_organicgrp/templates/syn-grouphomeevent.tpl"}
		{ALTERNATE()}{tr}There are currently no Events to display.{/tr}{ALTERNATE}
    {/literal}
{/wikiplugin}

{jq}
$(document).ready(function(){
    $("#customsearch_solsearch_results").addClass( "col-xs-12 col-md-8" );
    $('.collapse.in select').css('display','none');
});
{/jq}