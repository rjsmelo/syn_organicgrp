<div class="panel panel-default group-panel">
	<div class="panel-body">
		<div class="row">
			<div class="group-avatar col-xs-3">
				{$result.tracker_field_og_creator|avatarize:'':'':"n"}
			</div>
			<div class="col-xs-8">
				<h3 class="group-title"><a href="syn_organicgrp_grouphomepage?organicgroup={$result.object_id}">{$result.tracker_field_og_title|escape}</a></h3>
				<div class="lock-icon">
					{if $result.tracker_status == 'p'}
						<span data-toggle="tooltip" title="{tr}Private (Approval to join is required){/tr}" class="fa fa-lock tooltip-activate"> Private</span>
					{else}
						<span data-toggle="tooltip" title="{tr}Public (Open to everyone){/tr}" class="fa fa-unlock tooltip-activate"> Public</span>
					{/if}
				</div>
			</div>
		</div>
		<div class="group-summary">
			<p>{$result.tracker_field_og_description|truncate:200}</p>
		</div>
	</div>
	<div class="panel-footer">
		<span><i data-toggle="tooltip" title="{tr}Number of Members{/tr}" data-placement="left" class="fa fa-users tooltip-activate"></i> {$grpname|groupmembercount}</span>
		<span><i data-toggle="tooltip" title="{tr}Number of Forum Discussions{/tr}" data-placement="left" class="fa fa-comments tooltip-activate"></i> {if $result.tracker_field_og_forum_ID}{$result.tracker_field_og_forum_ID|forumtopiccount}{else}0{/if}</span>
		<span><i data-toggle="tooltip" title="{tr}Number of Files{/tr}" data-placement="left" class="fa fa-file tooltip-activate"></i>
			{wikiplugin _name="list"}
			{literal}
				{filter type="trackeritem"}
				{filter field="tracker_id" content="8"}
				{filter content="{/literal}{$result.object_id}{literal}" field="tracker_field_groupID"}
				{output template="tiki-search_count.tpl"}
				{ALTERNATE()}0{ALTERNATE}
			{/literal}
			{/wikiplugin}
		</span>
		<span><i data-toggle="tooltip" title="{tr}Number of Events{/tr}" data-placement="left" class="fa fa-calendar tooltip-activate"></i>
			{wikiplugin _name="list"}
			{literal}
				{filter type="trackeritem"}
				{filter field="tracker_id" content="4"}
				{filter content="{/literal}{$result.tracker_field_og_categoryID_text}{literal}" field="tracker_field_groupId"}
				{output template="tiki-search_count.tpl"}
				{ALTERNATE()}0{ALTERNATE}
			{/literal}
			{/wikiplugin}
		</span>
	</div>
</div>

{jq}
	$(document).ready(function () {
  		$(".tooltip-activate").tooltip({
    		'container':'body'
  		});
	});
{/jq}
