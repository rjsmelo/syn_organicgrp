    {foreach item=result from=$results}
    <div class="col-md-6 col-sm-12 mar-top-xl">
        {assign var=grpname value="organic_grp_`$result.object_id`"}
        {include file="syn-groups_box.tpl" private="n"}
    </div>
    {/foreach}

