<div class="row">
{foreach item=result from=$results}
	{assign var=grpname value="syn_organicgrp_`$result.object_id`"}
	{if $grpname|in_group}
	<div class="col-xs-12 mar-top-xl">
		{include file="syn-groupsbox.tpl" private="n"}
	</div>
	{/if}
{/foreach}
</div>