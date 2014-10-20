{foreach $results as $result}
		<div class="col-md-6">
			{assign var=grpname value="syn_organicgrp_`$result.object_id`"}
			{if not $grpname|in_group}
				{include file="syn-groupsbox.tpl" private="{if $result.status == 'o'}n{elseif $result.status == 'p'}y{/if}"}
			{/if}
		</div>
{/foreach}
