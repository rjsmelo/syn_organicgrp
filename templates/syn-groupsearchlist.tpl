<row>
{foreach $results as $result}
	{assign var=grpname value="syn_organicgrp_`$result.object_id`"}
	{if not $grpname|in_group}
		<div class="col-md-6">
			{include file="syn-groupsbox.tpl" private="{if $result.status == 'o'}n{elseif $result.status == 'p'}y{/if}"}
		</div>
	{/if}
{/foreach}
</row>
