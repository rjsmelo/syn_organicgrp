<div class="nopadding mar-bottom-lg pull-right">{if $offsetplusmaxRecords>$count}{$offsetplusmaxRecords = $count}{/if}Showing {if $count}{$offsetplusone}{else}0{/if}-{$offsetplusmaxRecords} of {$count} {if $results->getEstimate() > $count}({$results->getEstimate()} Total){/if}
{assign var='customsearchid' value='syn_organicgrp_file_search'}</div>
<div class="clear">
	{foreach item=result from=$results}
        {*If PC file*}
        {if $result.tracker_field_fileType == "117"}
            {assign var="icon" value=$result.tracker_field_pcFiles|geticon}
            {assign "url" "dl{$result.tracker_field_pcFiles}"}
            {*if URL*}
        {elseif $result.tracker_field_fileType == "118"}
            {assign var="icon" value="fa-external-link"}
            {assign "url" "http://{$result.tracker_field_externalURL}"}
            {*if Resource link*}
        {elseif $result.tracker_field_fileType == "119"}
            {assign var="icon" value="fa-link"}
            {assign "url" "ContentView?itemId={$result.tracker_field_resourceLink}"}
        {/if}
		<div class="col-md-4">
            <div class="filebox">
                <div class="media">
                    <div class="media-left">
                        <span class="fa {$icon} fa-3x"></span>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading"><a href="{$url}">{$result.title}</a></h4>
                        <span class="fa fa-user"></span> {$result.contributor|userlink}<br>
                        <span class="fa fa-cloud-upload"></span> {$result.modification_date|date_format}
                    </div>
                </div>
            <p>{$result.tracker_field_description|truncate:200}</p>
            </div>
		</div>
	{/foreach}
</div>
<div class="srShowResult clear">
    {pagination_links offset_jsvar="customsearch_`$customsearchid`.offset" _onclick="window.customsearch_`$customsearchid`.options.requireinput=false;$('#customsearch_`$customsearchid`').submit();return false;" resultset=$results}{/pagination_links}
	<div class="clear"></div>
</div>
