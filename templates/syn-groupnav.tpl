<div class="errormail"></div>
{foreach item=result from=$results}
	{assign var=grpname value="syn_organicgrp_`$result.object_id`"}
	{assign var=mgrpname value="syn_organicgrp_managers_`$result.object_id`"}
	{assign var=pgrpname value="syn_organicgrp_pending_`$result.object_id`"}
	{if $smarty.get.forumId}
		{wikiplugin _name="synpagetitle" title="{$prefs.ta_syn_organicgrp_sterm} - {$result.title}" iconsrc="themes/leaf/images/4-Collaborate.png" breadcrumb="organicgrp_forum"}{/wikiplugin}
	{elseif $smarty.get.comments_parentId}
		{wikiplugin _name="synpagetitle" title="{$prefs.ta_syn_organicgrp_sterm} - {$result.title}" iconsrc="themes/leaf/images/4-Collaborate.png" breadcrumb="organicgrp_forum_thread"}{/wikiplugin}
	{else}
		 {wikiplugin _name="synpagetitle" title="{$prefs.ta_syn_organicgrp_sterm} - {$result.title}" iconsrc="themes/leaf/images/4-Collaborate.png"}{/wikiplugin}
	{/if}
	<div class="row">
		{$result.logo_image}
	</div>

	<div class="row collab">
	{if !$mgrpname|in_group}
		{if $result.tracker_status eq 'o'}
			{assign var="typeofgrp" value="{$result.tracker_field_privateGroup}"}
			{wikiplugin _name="subscribegroup" group=$grpname subscribe_action="Join {$prefs.ta_syn_organicgrp_sterm}" postsubscribe_url="syn_organicgrp_grouphomepage?organicgroup={$result.object_id}" unsubscribe_action="Withdraw from {$prefs.ta_syn_organicgrp_sterm}" postunsubscribe_url="syn_organicgrp_joingroups" subscribe="" unsubscribe=""}{/wikiplugin}
			{if $typeofgrp eq "y"}
			{JQ}
			var colvalue = $(".collab div input").val();
				if(colvalue == 'Join Collaboration') {
					$(".notmember").addClass("hide");
					$("#table-forum").addClass("hide");
					$("#page-bar").addClass("hide");
				} 
			{/JQ}
			{/if}
		{elseif $result.tracker_status eq 'p' && !$grpname|in_group}
			{wikiplugin _name="subscribegroup" group=$pgrpname subscribe_action="Request to Join {$prefs.ta_syn_organicgrp_sterm}" postsubscribe_url="syn_organicgrp_grouphomepage?organicgroup={$result.object_id}" unsubscribe_action="Cancel Request to Join {$prefs.ta_syn_organicgrp_sterm}" postunsubscribe_url="syn_organicgrp_joingroups" subscribe="" unsubscribe=""}{/wikiplugin}
		{elseif $result.tracker_status eq 'p' && $grpname|in_group}
			{wikiplugin _name="subscribegroup" group=$grpname subscribe_action="Join {$prefs.ta_syn_organicgrp_sterm}" postsubscribe_url="syn_organicgrp_grouphomepage?organicgroup={$result.object_id}" unsubscribe_action="Withdraw from {$prefs.ta_syn_organicgrp_sterm}" postunsubscribe_url="syn_organicgrp_joingroups" subscribe="" unsubscribe="" allowLeaveNonUserChoice="y"}{/wikiplugin}
		{elseif $result.tracker_status eq 'p' && $pgrpname|in_group}
			{tr}Your membership to this {$prefs.ta_syn_organicgrp_sterm} is pending approval{/tr}
		{/if}
	{/if}
	</div>

	{if $grpname|in_group || $result.tracker_status eq 'o'}
	<div class="row groupnav-bar">
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
				{*Strip approvalcount of ~np~ tags from Formatter.php*}
				{assign var='count' value=$result.approvalCount|replace:'~np~':''|replace:'~/np~':''}
				<li id="manage" class="pull-right"><a href="syn_organicgrp_managegrp?itemId={$result.object_id}&organicgroup={$result.object_id}"><span class="fa fa-cog"></span>{if $count neq '0'}<span class="badge">{$count}</span>{/if} Manage</a></li>
			{/if}
		</ul>
	</div>
	{/if}

	{if $result.tracker_status eq 'o' && !$grpname|in_group}
		<div class="row">
			{remarksbox type="note" title="Join!" close="n"}
				{tr}Since you are not currently a member of this collaboration, you can view but not participate in the activity. Click on the "Join Collaboration" button to gain full access.{/tr}
			{/remarksbox}
		</div>
	{/if}
{/foreach}
{if $smarty.get.page eq "syn_organicgrp_grouphomepage"}
{jq}
	$('#home').addClass('active');
{/jq}
{elseif $smarty.get.page eq "syn_organicgrp_groupfiles"}
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
{elseif ($smarty.get.page eq "syn_organicgrp_event") OR ($smarty.get.page eq "syn_organicgrp_ViewEvent")}
{jq}
	$('#events').addClass('active');
{/jq}
{elseif $smarty.get.page eq "syn_organicgrp_{$result.object_id}:_:whiteboard_{$result.object_id}"}
{jq}
	$('#white').addClass('active');
{/jq}
{/if}