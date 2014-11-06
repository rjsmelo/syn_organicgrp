<div class="split-box group-box">
	<div class="col-xs-10 main-content">
		<div class="group_avatar col-xs-12">
			<div class="pull-right lock-icon">
				{if $result.tracker_status == 'p'}
					<span data-toggle="tooltip" title="Private (You must be accepted to join)" class="fa fa-lock tooltip-activate"></span>
				{else}
					<span data-toggle="tooltip" title="Public (Anyone can join)" class="fa fa-unlock tooltip-activate"></span>
				{/if}
			</div>
			<div class="col-xs-4">
				<div class="thumb grpavatar" style="background-image: url('tiki-show_user_avatar.php?user={$result.tracker_field_og_creator}');"></div>
			</div>
		</div>
		<div class="col-xs-12 group-content">
			<h3><a href="syn_organicgrp_grouphomepage?itemId={$result.object_id}">{$result.tracker_field_og_title|escape}</a></h3>
			<p>{$result.tracker_field_og_description|truncate:200}</p>
		</div>
	</div>
	<div class="col-xs-2 summary-content vcenter">
	 	<div class="icon-stack">
			<div>
				<span data-toggle="tooltip" title="Number of Members" data-placement="left" class="fa fa-users tooltip-activate"></span><span> {$grpname|groupmembercount}</span>
			</div>
			<div>
				<span data-toggle="tooltip" title="Number of Discussions in the Forum" data-placement="left" class="fa fa-comments tooltip-activate"></span><span> {if $result.tracker_field_og_forum_ID}{$result.tracker_field_og_forum_ID|forumtopiccount}{else}0{/if}</span>
			</div>
		</div>
	</div>	
</div>

{JQ}
	$(document).ready(function () {
  		$(".tooltip-activate").tooltip({
    		'container':'body'
  		});
	});
{/JQ}