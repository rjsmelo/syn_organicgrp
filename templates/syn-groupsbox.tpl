<div class="split-box group-box">
	<div class="col-xs-10 main-content">
		<div class="group_avatar col-xs-12">
			<div class="pull-right lock-icon">
				{if $result.tracker_status == 'p'}
					<span data-toggle="tooltip" title="{tr}Private (Approval to join is required){/tr}" class="fa fa-lock tooltip-activate"></span>
				{else}
					<span data-toggle="tooltip" title="{tr}Public (Open to everyone){/tr}" class="fa fa-unlock tooltip-activate"></span>
				{/if}
			</div>
			<div class="col-xs-4">
				<div class="thumb grpavatar" style="background-image: url('tiki-show_user_avatar.php?user={$result.tracker_field_og_creator|urlencode}');"></div>
			</div>
		</div>
		<div class="col-xs-12 group-content">
			<h3><a href="syn_organicgrp_grouphomepage?organicgroup={$result.object_id}">{$result.tracker_field_og_title|escape}</a></h3>
			<p>{$result.tracker_field_og_description|truncate:200}</p>
		</div>
	</div>
	<div class="col-xs-2 summary-content vcenter">
	 	<div class="icon-stack">
			<div>
				<span data-toggle="tooltip" title="{tr}Number of Members{/tr}" data-placement="left" class="fa fa-users tooltip-activate"></span><span> {$grpname|groupmembercount}</span>
			</div>
			<div>
				<span data-toggle="tooltip" title="{tr}Number of Forum Discussions{/tr}" data-placement="left" class="fa fa-comments tooltip-activate"></span><span> {if $result.tracker_field_og_forum_ID}{$result.tracker_field_og_forum_ID|forumtopiccount}{else}0{/if}</span>
			</div>
			<div>
				<span data-toggle="tooltip" title="{tr}Number of Files{/tr}" data-placement="left" class="fa fa-file tooltip-activate"></span>
				{wikiplugin _name="list"}
		            {literal}
						{filter type="trackeritem"}
						{filter field="tracker_id" content="8"}
						{filter content="{/literal}{$result.object_id}{literal}" field="tracker_field_groupID"}
						{output template="themes/leaf/templates/syn-resource_count.tpl"}
		                {ALTERNATE()}0{ALTERNATE}
		            {/literal}
		        {/wikiplugin}
			</div>
			<div>
				<span data-toggle="tooltip" title="{tr}Number of Events{/tr}" data-placement="left" class="fa fa-calendar tooltip-activate"></span>
				{wikiplugin _name="list"}
		            {literal}
						{filter type="trackeritem"}
						{filter field="tracker_id" content="4"}
						{filter content="{/literal}{$result.tracker_field_og_categoryID_text}{literal}" field="tracker_field_groupId"}
						{output template="themes/leaf/templates/syn-resource_count.tpl"}
		                {ALTERNATE()}0{ALTERNATE}
		            {/literal}
		        {/wikiplugin}
			</div>
		</div>
	</div>	
</div>

{jq}
	$(document).ready(function () {
  		$(".tooltip-activate").tooltip({
    		'container':'body'
  		});
	});
{/jq}
