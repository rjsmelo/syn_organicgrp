<div class="split-box group-box">
	<div class="col-sm-10 main-content">
		<div class="group_avatar col-md-12">
			<div class="pull-right lock-icon">{if $result.tracker_status == 'p'}<span class="fa fa-lock"></span>{else}<span class="fa fa-unlock"></span>{/if}</div>
			{$result.tracker_field_og_creator|avatarize}
		</div>
		<div class="col-md-12 group-content">
			<h3><a href="syn_organicgrp_grouphomepage?itemId={$result.object_id}">{$result.tracker_field_og_title|escape}</a></h3>
			<p>{$result.og_descrip|nl2br}</p>
		</div>
	</div><!--
	--><div class="col-sm-2 summary-content vcenter">
	 	<div class="icon-stack">
			<div><span class="fa fa-users"></span><span> {$grpname|groupmembercount}</span></div>
			<div><span class="fa fa-comments"></span><span> {$result.tracker_field_og_forum_ID|forumtopiccount}</span></div>
		</div>
	</div>	
</div>