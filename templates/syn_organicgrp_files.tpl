<div class="col-xs-12 mar-bottom-lg clear">
    {assign var=resource value="="|explode:$smarty.server.HTTP_REFERER}
    <a class="btn btn-action pull-right" href="syn_organicgrp_sharefile?organicgroup={$resource[1]}"><span class="fa fa-cloud-upload"></span> Share New Files</a>
    <div class="nopadding pull-left btn mar-top">{if $offsetplusmaxRecords>$count}{$offsetplusmaxRecords = $count}{/if}Showing {if $count}{$offsetplusone}{else}0{/if}-{$offsetplusmaxRecords} of {$count} {if $results->getEstimate() > $count}({$results->getEstimate()} Total){/if}
</div>
{assign var='customsearchid' value='syn_organicgrp_file_search'}</div>
<div class="clear">
	{foreach item=result from=$results}
        {*If PC file*}
        {if $result.tracker_field_fileType == "117"}
            {assign var="icon" value=$result.file_group|geticon}
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
		<div class="col-xs-12">
            <div class="filebox">
                <div class="media">
                    <div class="media-left col-xs-1">
                        <span class="fa {$icon} fa-3x"></span>
                    </div>
                    <div class="media-body col-xs-11">
                        {if $result.tracker_field_pcFiles}
                            {if $smarty.session.u_info.login eq $result.tracker_field_contributor}
                                <input type="hidden" id="fileId" value="{$result.tracker_field_pcFiles}">
                                <div class="row">
                                    <div class="col-xs-11">
                                        <h4 class="media-heading"><a href="{$url}">{$result.title}</a></h4>  
                                    </div>
                                    <div class="col-xs-1 button-stack text-right">
                                        <a title="Delete" data-target=".bs-modal.fade:not(.in):first" data-toggle="modal" href="tiki-tracker-remove_item?trackerId=8&amp;itemId={$result.object_id}&amp;modal=1"><span class="fa fa-times-circle"></span></a>
                                    </div>
                                </div>
                            {else}
                                <h4 class="media-heading"><a href="{$url}">{$result.title}</a></h4>
                            {/if}
                        {else}
                            <h4 class="media-heading"><a href="{$url}">{$result.title}</a></h4>
                        {/if}
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

{jq}
    $(document).ready(function(){
    $("#customsearch_synorganicgrpfilesearch_results").addClass( "col-md-8 col-xs-12" );
    $('.collapse.in select').css('display','none');
    });
{/jq}