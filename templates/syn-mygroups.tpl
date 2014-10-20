{foreach item=result from=$results}
	<div class="col-md-12 col-sm-12 mar-top-xl">
		{assign var=grpname value="organic_grp_`$result.object_id`"}
		{include file="syn-groupsbox.tpl" private="n"}
	</div>
{/foreach}