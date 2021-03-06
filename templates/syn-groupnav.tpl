<div class="errormail"></div>
{foreach item=result from=$results}
	{assign var=grpname value="syn_organicgrp_`$result.object_id`"}
	{assign var=mgrpname value="syn_organicgrp_managers_`$result.object_id`"}
	{assign var=pgrpname value="syn_organicgrp_pending_`$result.object_id`"}

	<h2>{$prefs.ta_syn_organicgrp_sterm} - {$result.title}</h2>
	<div class="row">
		{$result.logo_image}
	</div>

	<div class="row group">
		<div class="col-xs-12">
			{if !$mgrpname|in_group}
				{if $result.tracker_status eq 'o'}
					{assign var="isprivate" value="{$result.tracker_field_privateGroup}"}
					{wikiplugin _name="subscribegroup" group=$grpname subscribe_action="{tr _0=$prefs.ta_syn_organicgrp_sterm}Join %0{/tr}" postsubscribe_url="syn_organicgrp_grouphomepage?organicgroup={$result.object_id}&congrats=y" unsubscribe_action="{tr _0=$prefs.ta_syn_organicgrp_sterm}Withdraw from %0{/tr}" postunsubscribe_url="syn_organicgrp_joingroups" subscribe="" unsubscribe=""}{/wikiplugin}
					{if $isprivate eq "y"}
						{jq}
							if(colvalue == 'Join Collaboration') {
								$(".notmember").addClass("hide");
								$("#table-forum").addClass("hide");
								$("#page-bar").addClass("hide");
							}
						{/jq}
					{/if}
				{elseif $result.tracker_status eq 'p' && !$grpname|in_group}
					{wikiplugin _name="subscribegroup" group=$pgrpname subscribe_action="{tr _0=$prefs.ta_syn_organicgrp_sterm}Request to Join %0{/tr}" postsubscribe_url="syn_organicgrp_grouphomepage?organicgroup={$result.object_id}" unsubscribe_action="{tr _0=$prefs.ta_syn_organicgrp_sterm}Cancel Request to Join %0{/tr}" postunsubscribe_url="syn_organicgrp_joingroups" subscribe="" unsubscribe=""}{/wikiplugin}
					<div class="alert alert-info alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<p>{tr}As this is a private group, permission to join is required before you can view the details of, and participate in, its activities.{/tr}</p>
					</div>
					<p>{$result.tracker_field_og_description|nl2br}</p>
				{elseif $result.tracker_status eq 'p' && $grpname|in_group}
					{wikiplugin _name="subscribegroup" group=$grpname subscribe_action="{tr _0=$prefs.ta_syn_organicgrp_sterm}Join %0{/tr}" postsubscribe_url="syn_organicgrp_grouphomepage?organicgroup={$result.object_id}" unsubscribe_action="{tr _0=$prefs.ta_syn_organicgrp_sterm}Withdraw from %0{/tr}" postunsubscribe_url="syn_organicgrp_joingroups" subscribe="" unsubscribe="" allowLeaveNonUserChoice="y"}{/wikiplugin}
				{elseif $result.tracker_status eq 'p' && $pgrpname|in_group}
					{tr _0=$prefs.ta_syn_organicgrp_sterm}Your membership to this %0 is pending approval{/tr}
				{/if}
			{/if}
		</div>
	</div>

	{if $grpname|in_group || $result.tracker_status eq 'o'}
	<div class="groupnav-bar">
		<ul class="nav nav-pills">
			<li id="home"><a href="syn_organicgrp_grouphomepage?organicgroup={$result.object_id}"><span class="fa fa-home"></span> {tr}Home{/tr}</a></li>
			<li id="forum"><a href="tiki-view_forum.php?forumId={$result.tracker_field_og_forum_ID}&organicgroup={$result.object_id}"><span class="fa fa-comments"></span> {tr}Forums{/tr}</a></li>
			<li id="white"><a href="syn_organicgrp_{$result.object_id}:_:whiteboard_{$result.object_id}?organicgroup={$result.object_id}"><span class="fa fa-edit"></span> {tr}Whiteboard{/tr}</a></li>
			{if $prefs.ta_syn_ogevents_on eq 'y'}
				<li id="events"><a href="syn_ogevents?organicgroup={$result.object_id}"><span class="fa fa-calendar"></span> {tr}Events{/tr}</a></li>
			{/if}
			{if $prefs.ta_syn_ogfiles_on eq 'y'}
				<li id="files"><a href="syn_ogfiles?organicgroup={$result.object_id}"><span class="fa fa-file"></span> {tr}Files{/tr}</a></li>
			{/if}
			{if $prefs.ta_syn_ogwebinars_on eq 'y'}
				<li id="live"><a href="syn_organicgrp_liveconferencing?organicgroup={$result.object_id}"><span class="fa fa-laptop"></span> {tr}Live Conferencing{/tr}</a></li>
			{/if}
		  	<li id="members"><a href="syn_organicgrp_groupmembers?organicgroup={$result.object_id}"><span class="fa fa-users"></span> {tr}Members{/tr}</a></li>
			{assign var=mgrpname value="syn_organicgrp_managers_{$smarty.get.organicgroup}"}
			{if $mgrpname|in_group}
				<li id="manage" class="pull-right"><a href="syn_organicgrp_managegrp?itemId={$result.object_id}&organicgroup={$result.object_id}"><span class="fa fa-cog"></span>{if $result.approvalCount neq '0'}<span class="badge">{$result.approvalCount}</span>{/if} {tr}Manage{/tr}</a></li>
			{/if}
		</ul>
	</div>
	{/if}
{/foreach}

{if $result.groupnavfrom eq 'home'}
{jq}
	$('#home').addClass('active');
{/jq}
{elseif $result.groupnavfrom eq 'forum'}
{jq}
	$('#forum').addClass('active');
{/jq}
{elseif $result.groupnavfrom eq 'files'}
{jq}
	$('#files').addClass('active');
{/jq}
{elseif $result.groupnavfrom eq 'members'}
{jq}
	$('#members').addClass('active');
{/jq}
{elseif $result.groupnavfrom eq 'manage'}
{jq}
	$('#manage').addClass('active');
{/jq}
{elseif $result.groupnavfrom eq 'live'}
{jq}
    $('#live').addClass('active');
{/jq}
{elseif $result.groupnavfrom eq 'events'}
{jq}
	$('#events').addClass('active');
{/jq}
{elseif $result.groupnavfrom eq 'whiteboard'}
{jq}
	$('#white').addClass('active');
{/jq}
{/if}
