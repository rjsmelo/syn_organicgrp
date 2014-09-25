{foreach item=result from=$results}
	{assign var=grpname value="syn_organicgrp_`$result.object_id`"}
	{if $grpname|in_group}
		{if $result.tracker_status == 'o'}
			{include file="syn-groupsbox.tpl" private="n"}
		{elseif $result.tracker_status == 'p'}
			{include file="syn-groupsbox.tpl" private="y"}
		{/if}
	{/if}
{/foreach}
