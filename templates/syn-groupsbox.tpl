<div class="split-box group-box">
	<div class="col-xs-10 main-content">
		<div class="group_avatar col-xs-12">
			<div class="pull-right lock-icon">{if $result.tracker_status == 'p'}<span class="fa fa-lock"></span>{else}<span class="fa fa-unlock"></span>{/if}</div>
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
			<div><span class="fa fa-users"></span><span> {$grpname|groupmembercount}</span></div>
			<div><span class="fa fa-comments"></span><span> {if $result.tracker_field_og_forum_ID}{$result.tracker_field_og_forum_ID|forumtopiccount}{else}0{/if}</span></div>
		</div>
	</div>	
</div>