<div class="nopadding mar-bottom-lg pull-right">{if $offsetplusmaxRecords>$count}{$offsetplusmaxRecords = $count}{/if}Showing {if $count}{$offsetplusone}{else}0{/if}-{$offsetplusmaxRecords} of {$count} {if $results->getEstimate() > $count}({$results->getEstimate()} Total){/if}
{assign var='customsearchid' value='syn_organicgrp_file_search'}</div>
<div class="clear">
	{foreach item=result from=$results}
		<div class="col-md-4 zoom">
			<div class=" contact-box bg-light-accent">
				<div class="pull-left mar-right-sm mar-top-xl mar-bottom-lg">

					{assign var=file_type value="/"|explode:$result.filetype}

					{if $file_type[0] eq 'image'}
						<span class="fa fa-file-image-o fa-3x"></span>
					{elseif $file_type[0] eq 'application'}
						{if $file_type[1] eq 'ms-excel'}
							<span class="fa fa-file-excel-o fa-3x"></span>
						{elseif $file_type[1] eq 'ms-powerpoint' || $file_type[1] eq 'vnd.openxmlformats-officedocument.presentationml.presentation'}
							<span class="fa fa-file-powerpoint-o fa-3x"></span>
						{elseif $file_type[1] eq 'msword' || $file_type[1] eq 'vnd.openxmlformats-officedocument.wordprocessingml.document'}
							<span class="fa fa-file-word-o fa-3x"></span>
						{elseif $file_type[1] eq 'pdf'}
							<span class="fa fa-file-pdf-o fa-3x"></span>
						{else}
							<span class="fa fa-file fa-3x"></span>	
						{/if}
					{elseif $file_type[0] eq 'text'}
						<span class="fa fa-file-text fa-3x"></span>
					{else}
						<span class="fa fa-file fa-3x"></span>
					{/if}
				</div>
				<div>
					<h3 class="mar-top-lg"><a href="{$result.url}">{$result.title}</a></h3>
					<span class="fa fa-user"></span> {$result.contributors|userlink}<br>
					<span class="fa fa-cloud-upload"></span> {$result.modification_date|date_format}
				</div>
				<div class="clear"></div>
				<p>{$result.contents|truncate:200}</p>
			</div>
		</div>
	{/foreach}
</div>
<div class="srShowResult clear">
    {pagination_links offset_jsvar="customsearch_`$customsearchid`.offset" _onclick="window.customsearch_`$customsearchid`.options.requireinput=false;$('#customsearch_`$customsearchid`').submit();return false;" resultset=$results}{/pagination_links}
	<div class="clear"></div>
</div>
