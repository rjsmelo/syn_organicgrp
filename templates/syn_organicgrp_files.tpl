<div class="col-xs-12 mar-bottom-lg clear">
    <div class="nopadding pull-left btn mar-top">{if $offsetplusmaxRecords>$count}{$offsetplusmaxRecords = $count}{/if}{tr}Showing{/tr} {if $count}{$offsetplusone}{else}0{/if}-{$offsetplusmaxRecords} {tr}of{/tr} {$count} {if $results->getEstimate() > $count}({$results->getEstimate()} Total){/if}
</div>
{assign var='customsearchid' value='syn_organicgrp_file_search'}</div>
<div class="clear">
	{foreach item=result from=$results}
        {*If PC file*}
        {if $result.tracker_field_fileType == $profileobject:002_og_categories:cat_organicgrp_filetypes_file$}
            {assign var="icon" value=$result.file_group|geticon}
            {assign "url" "dl{$result.tracker_field_pcFiles}"}
            {*if URL*}
        {elseif $result.tracker_field_fileType == $profileobject:002_og_categories:cat_organicgrp_filetypes_url$}
            {assign var="icon" value="fa-link"}
            {assign "url" "ContentView?itemId={$result.tracker_field_resourceLink}"}
        {/if}
		<div class="col-xs-12">
            <div class="filebox">
                <div class="media">
                    <div class="media-left col-xs-1">
                        <span class="fa {$icon} fa-3x"></span>
                    </div>
                    <div class="media-body col-xs-11">
                        {permission name="remove_tracker_items" object=$result.object_id type="trackeritem"}
                            <a class="pull-right" title="Delete" data-target=".bs-modal.fade:not(.in):first" data-toggle="modal" href="tiki-tracker-remove_item?trackerId=8&amp;itemId={$result.object_id}&amp;modal=1"><span class="fa fa-times-circle"></span></a>
                        {/permission}
                        <h4 class="media-heading"><a href="{$url}" target="_blank">{$result.title}</a></h4>
                        <span class="fa fa-user"></span> {$result.tracker_field_contributor|userlink}<br>
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

{jq}
    $(document).ready(function(){
    $("#customsearch_synorganicgrpfilesearch_results").addClass( "col-md-8 col-xs-12" );
    $('.collapse.in select').css('display','none');
    });
{/jq}