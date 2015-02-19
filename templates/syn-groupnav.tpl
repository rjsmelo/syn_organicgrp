<div class="errormail"></div>
{foreach item=result from=$results}
	{assign var=grpname value="syn_organicgrp_`$result.object_id`"}
	{assign var=mgrpname value="syn_organicgrp_managers_`$result.object_id`"}
	{assign var=pgrpname value="syn_organicgrp_pending_`$result.object_id`"}
	{if $smarty.get.forumId}
		{wikiplugin _name="synpagetitle" title="{$prefs.ta_syn_organicgrp_sterm} - {$result.title}" iconsrc="themes/leaf/images/4-Collaborate.png" breadcrumb="organicgrp_forum"}{/wikiplugin}
	{elseif $smarty.get.comments_parentId}
		{wikiplugin _name="synpagetitle" title="{$prefs.ta_syn_organicgrp_sterm} - {$result.title}" iconsrc="themes/leaf/images/4-Collaborate.png" breadcrumb="organicgrp_forum_thread"}{/wikiplugin}
	{elseif $smarty.get.page eq "syn_organicgrp_{$result.object_id}:_:whiteboard_{$result.object_id}"}
		{wikiplugin _name="synpagetitle" title="{$prefs.ta_syn_organicgrp_sterm} - {$result.title}" iconsrc="themes/leaf/images/4-Collaborate.png" breadcrumb="whiteboard"}{/wikiplugin}
	{else}
		{wikiplugin _name="synpagetitle" title="{$prefs.ta_syn_organicgrp_sterm} - {$result.title}" iconsrc="themes/leaf/images/4-Collaborate.png"}{/wikiplugin}
	{/if}
	<div class="row">
		{$result.logo_image}
	</div>

	<div class="row collab">
		<div class="col-xs-12">
			{if !$mgrpname|in_group}
				{if $result.tracker_status eq 'o'}
					{assign var="typeofgrp" value="{$result.tracker_field_privateGroup}"}
					{wikiplugin _name="subscribegroup" group=$grpname subscribe_action="Join {$prefs.ta_syn_organicgrp_sterm}" postsubscribe_url="syn_organicgrp_grouphomepage?organicgroup={$result.object_id}" unsubscribe_action="Withdraw from {$prefs.ta_syn_organicgrp_sterm}" postunsubscribe_url="syn_organicgrp_joingroups" subscribe="" unsubscribe=""}{/wikiplugin}
					{if $typeofgrp eq "y"}
						{jq}
						var colvalue = $(".collab div input").val();
							if(colvalue == 'Join Collaboration') {
								$(".notmember").addClass("hide");
								$("#table-forum").addClass("hide");
								$("#page-bar").addClass("hide");
							}
						{/jq}
					{/if}
				{elseif $result.tracker_status eq 'p' && !$grpname|in_group}
					{wikiplugin _name="subscribegroup" group=$pgrpname subscribe_action="Request to Join {$prefs.ta_syn_organicgrp_sterm}" postsubscribe_url="syn_organicgrp_grouphomepage?organicgroup={$result.object_id}" unsubscribe_action="Cancel Request to Join {$prefs.ta_syn_organicgrp_sterm}" postunsubscribe_url="syn_organicgrp_joingroups" subscribe="" unsubscribe=""}{/wikiplugin}
					<div class="alert alert-info alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<p>As this is a private collaboration. permission to join is required before you can view the details of, and participate in, its activities.</p>
					</div>
					<p>{$result.tracker_field_og_description|nl2br}</p>
				{elseif $result.tracker_status eq 'p' && $grpname|in_group}
					{wikiplugin _name="subscribegroup" group=$grpname subscribe_action="Join {$prefs.ta_syn_organicgrp_sterm}" postsubscribe_url="syn_organicgrp_grouphomepage?organicgroup={$result.object_id}" unsubscribe_action="Withdraw from {$prefs.ta_syn_organicgrp_sterm}" postunsubscribe_url="syn_organicgrp_joingroups" subscribe="" unsubscribe="" allowLeaveNonUserChoice="y"}{/wikiplugin}
				{elseif $result.tracker_status eq 'p' && $pgrpname|in_group}
					{tr}Your membership to this {$prefs.ta_syn_organicgrp_sterm} is pending approval{/tr}
				{/if}
			{/if}
		</div>
	</div>

	{if $grpname|in_group || $result.tracker_status eq 'o'}
	<div class="groupnav-bar">
		<ul class="nav nav-pills">
			<li id="home"><a href="syn_organicgrp_grouphomepage?organicgroup={$result.object_id}"><span class="fa fa-home"></span> Home</a></li>
			<li id="forum"><a href="tiki-view_forum.php?forumId={$result.tracker_field_og_forum_ID}&organicgroup={$result.object_id}"><span class="fa fa-comments"></span> Forums</a></li>
			<li id="white"><a href="syn_organicgrp_{$result.object_id}:_:whiteboard_{$result.object_id}?organicgroup={$result.object_id}"><span class="fa fa-edit"></span> Whiteboard</a></li>
			<li id="events"><a href="syn_organicgrp_event?organicgroup={$result.object_id}&start=now&end=1893495012&type=up"><span class="fa fa-calendar"></span> Events</a></li>
			<li id="files"><a href="syn_organicgrp_groupfiles?organicgroup={$result.object_id}"><span class="fa fa-file"></span> Files</a></li>
			<li id="live"><a href="syn_organicgrp_liveconferencing?organicgroup={$result.object_id}"><span class="fa fa-laptop"></span> Live Conferencing</a></li>
		  	<li id="members"><a href="syn_organicgrp_groupmembers?organicgroup={$result.object_id}"><span class="fa fa-users"></span> Members</a></li>
			{assign var=mgrpname value="syn_organicgrp_managers_{$smarty.get.organicgroup}"}
			{if $mgrpname|in_group}
				<li id="manage" class="pull-right"><a href="syn_organicgrp_managegrp?itemId={$result.object_id}&organicgroup={$result.object_id}"><span class="fa fa-cog"></span>{if $result.approvalCount neq '0'}<span class="badge">{$result.approvalCount}</span>{/if} Manage</a></li>
			{/if}
		</ul>
	</div>
	{/if}
{/foreach}


{if $smarty.get.page eq "syn_organicgrp_grouphomepage"}
{jq}
	$('#home').addClass('active');
{/jq}
{elseif $smarty.get.page eq "tiki-view_forum_thread.php"}
{jq}
	$('#forum').addClass('active');
{/jq}
{elseif ($smarty.get.page eq "syn_organicgrp_groupfiles") OR ($smarty.get.page eq "syn_organicgrp_sharefile")}
{jq}
	$('#files').addClass('active');
{/jq}
{elseif $smarty.get.page eq "syn_organicgrp_groupmembers"}
{jq}
	$('#members').addClass('active');
{/jq}
{elseif $smarty.get.page eq "syn_organicgrp_managegrp"}
{jq}
	$('#manage').addClass('active');
{/jq}
{elseif $smarty.get.page eq "syn_organicgrp_liveconferencing"}
{jq}
    $('#live').addClass('active');
{/jq}
{elseif ($smarty.get.page eq "syn_organicgrp_event") OR ($smarty.get.page eq "syn_organicgrp_ViewEvent") OR ($smarty.get.page eq "syn_organicgrp_EditEvent") OR ($smarty.get.page eq "syn_organicgrp_createevent")}
{jq}
	$('#events').addClass('active');
{/jq}
{elseif $smarty.get.page eq "syn_organicgrp_{$result.object_id}:_:whiteboard_{$result.object_id}"}
{jq}
	$('#white').addClass('active');
	$("#Collaborate").addClass('active');
{/jq}
{/if}
