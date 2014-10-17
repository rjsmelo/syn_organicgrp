{foreach item=result from=$results}
	<div class="col-md-12 col-sm-12 mar-top-xl">
		{assign var=grpname value="syn_organicgrp_`$result.object_id`"}
		{if $grpname|in_group}
			{include file="syn-groupsbox.tpl" private="n"}
		{/if}
	</div>
{/foreach}