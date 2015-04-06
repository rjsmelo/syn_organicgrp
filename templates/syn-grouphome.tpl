{strip}
    {if $smarty.get.congrats eq "y"}
        <div id="congrats-alert" class="alert alert-success alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            You've successfully joined the collaboration!
        </div>
    {/if}
    <div>
	{*{include file="syn-groupnav.tpl"}*}
	{wikiplugin _name="addon" package="syn/organicgrp" view="groupnavloader" from="home"}{/wikiplugin}
<div class="notmember">
	{foreach item=result from=$results}
		{assign var=grpname value="syn_organicgrp_`$result.object_id`"}
		{assign var=mgrpname value="syn_organicgrp_managers_`$result.object_id`"}
		{assign var=pgrpname value="syn_organicgrp_pending_`$result.object_id`"}
		{if $result.tracker_status == 'o' || $grpname|in_group}
			{if $result.tracker_field_og_welcome_message}
				<div class="row">
					<div class="alert alert-info">{$result.tracker_field_og_welcome_message|nl2br}</div>
				</div>
			{/if}
			<form name="commSearch" method="post" action="./syn_organicgrp_groupsearchpage?organicgroup={$result.object_id}&cat={$result.tracker_field_og_categoryID}&forgetlastsearch=y">
				<div class="form-group">
					<div class="input-group">
						<input type="text" name="default[content]" placeholder="{tr _0=$prefs.ta_syn_organicgrp_sterm}Search within this %0{/tr}..." class="searchField form-control">
						<span class="input-group-btn">
							<input type="submit" value="{tr}Search{/tr}" name="submit" class="btn btn-search">
						</span>
					</div>
				</div>
			</form>
			<div class="clear mar-bottom-lg"></div>
			<div class="row">
				<div class="col-md-8 mar-bottom projectlist">
					{$result.tracker_field_og_description|nl2br}<br/>
					<h3>{tr}Recent Activity{/tr}</h3>
					{wikiplugin _name="activitystream" auto="0"}
					{literal}
						{pagination max="10"}
						{filter field="feed" content="syn_organicgrps"}
						{filter categories="{/literal}{$result.tracker_field_og_categoryID}{literal}"}
						{group field=aggregate collect=user}
					{/literal}
					{/wikiplugin}
					{jq}
						$('a').each(function(index, value) {
							var url = $(this).attr('href');
							if (typeof url !== 'undefined') {
								var ogid = '{{$result.object_id}}';
								var newurl = url.replace('?itemId', '?organicgroup=' + ogid + '&itemId');
								$(this).attr('href', newurl);
							}
						});
					{/jq}
				</div>

				<div class="col-md-4 mar-bottom">
					<div class="hide">
						<h3>{tr}New Members{/tr}</h3>
						{wikiplugin _name="activitystream"}
						{literal}
							{pagination max="5"}
							{filter field="type" exact="user"}
							{filter field="organicgroupid" exact="{/literal}{$result.object_id}{literal}"}
							{group field=aggregate collect=user}
						{/literal}
						{/wikiplugin}
						{jq}
							$('a').each(function(index, value) {
								var url = $(this).attr('href');
								if (typeof url !== 'undefined') {
									var ogid = '{{$result.object_id}}';
									var newurl = url.replace('?itemId', '?organicgroup=' + ogid + '&itemId');
									$(this).attr('href', newurl);
								}
							});
						{/jq}
					</div>

					<div class="panel panel-default">
						<div class="panel-heading">{tr}Recent Forum Posts{/tr}</div>
						<div class="panel-body">
							{wikiplugin _name="list"}
							{literal}
								{list max="5" offset="0"}
								{filter type="forum post"}
								{filter content="0" field="parent_thread_id"}
								{filter content="{/literal}{$result.tracker_field_og_forum_ID}{literal}" field="parent_object_id"}
								{sort mode="modification_date_desc"}
								{output template="addons/syn_organicgrp/templates/syn-forum_list_title.tpl"}
								{ALTERNATE()}<p class="emptyinfo">{tr}No post available.{/tr}</p>{ALTERNATE}
							{/literal}
							{/wikiplugin}
						</div>
					</div>
					<div class="panel panel-default" id="upcoming_events">
						<div class="panel-heading">{tr}Upcoming Events{/tr}</div>
						<div class="panel-body">
							{wikiplugin _name="list"}
								{literal}
									{list max="3"}
									{filter type="trackeritem"}
									{filter content="4" field="tracker_id"}
									{filter range="tracker_field_endDate" from="now" gap="31536000"}
									{filter  categories="{/literal}{$result.tracker_field_og_categoryID}{literal}"}
									{sort mode="tracker_field_startDate2_asc"}
									{output template="addons/syn_organicgrp/templates/syn-event_list.tpl"}
									{FORMAT(name="event_desc")}{display name="tracker_field_eventDescription" format="snippet" length="50"}{FORMAT}
									{ALTERNATE()}
										<p id="hide_panel" class="no_event">{tr}There is no upcoming event.{/tr}</p>
									{ALTERNATE}
								{/literal}
							{/wikiplugin}
						</div>
					</div>
				</div>
			</div>
		{else}
			{wikiplugin _name = "alert" id="privategrp-alertmsg" dismissable="n" cookies="n"}
				<p>{tr}This is a private collaboration, so you need to be a member to view the activity. Click on the "Request to Join Collaboration" button to indicate your interest to participate.{/tr}</p>
			{/wikiplugin}
		{/if}
	{/foreach}
	</div>
	</div>
{/strip}

{jq}
	if ( $( "#hide_panel" ).hasClass( "no_event" ) )
 	{
		$("#upcoming_events").hide();
	}
{/jq}
