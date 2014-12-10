<div class="col-md-9">
	{if {$user} eq {$f_eventAddedBy} }
		<a class="btn btn-default pull-right mar-right-lg" href="syn_organicgrp_EditEvent?itemId={$f_itemId}&organicgroup={$smarty.get.organicgroup}&cat={$smarty.get.cat}"><span class="fa fa-edit"></span></a>
		<div class="clear"></div>
	{else}
		{wikiplugin _name="GROUP" groups="Admins"}
			<a class="btn btn-default pull-right mar-right-lg" href="syn_organicgrp_EditEvent?itemId={$f_itemId}&organicgroup={$smarty.get.organicgroup}&cat={$smarty.get.cat}"><span class="fa fa-edit"></span></a>
			<div class="clear"></div>
		{/wikiplugin}
	{/if}
	<h2 class="align-top">{$f_eventTitle}</h2>
	<i class="fa fa-users fa-6"></i> 
		{wikiplugin _name=relations qualifiers="leaf.event.attending.invert" object="trackeritem:{$f_itemId}" showonlycount="1"}{/wikiplugin} Confirmed Attendees &nbsp;&nbsp;<i class="fa fa-comments fa-6"></i> 
		{wikiplugin _name="list"}
            {literal}
                {filter type="trackeritem"}
                {filter content="4" field="tracker_id"}
                {filter field="object_id" content="{/literal}{$f_itemId}{literal}"}
                {filter categories="{/literal}{$smarty.get.cat}{literal}"}
                {output template="templates/syn-comments-count.tpl"}
                {ALTERNATE()}There is no result for this search{ALTERNATE}
            {/literal}
        {/wikiplugin} Comments
	<hr>
	<div class="col-xs-12 col-sm-8 col-md-8">
		<div class="row mar-top-sm">
			<div class="col-xs-12 col-sm-4 text-right text-left-xs event_view_title">Start Time</div>
			<div class="col-xs-12 col-sm-6">{$f_startDate2|date_format:"%B %e, %Y at %l:%M %p"}</div>
		</div>
		<div class="row mar-top-sm">
			<div class="col-xs-12 col-sm-4 text-right text-left-xs event_view_title">End Time</div>
			<div class="col-xs-12 col-sm-6">{$f_endDate|date_format:"%B %e, %Y at %l:%M %p"}</div>
		</div>
		{if $f_eventLocation}
			<div class="row mar-top-sm">
				<div class="col-xs-12 col-sm-4 text-right text-left-xs event_view_title">Location</div>
				<div class="col-xs-12 col-sm-6">{$f_eventLocation} <i class="fa fa-paper-plane fs-6"></i></div>
			</div>
		{/if}	

		{if $f_region}
			<div class="row mar-top-sm">
				<div class="col-xs-12 col-sm-4 text-right text-left-xs event_view_title">Region</div>
				<div class="col-xs-12 col-sm-6">{$f_region}</div>
			</div>	
		{/if}

		{if $f_presenter}
			<div class="row mar-top-sm">
				<div class="col-xs-12 col-sm-4 text-right text-left-xs event_view_title">Presenter(s)</div>
				<div class="col-xs-12 col-sm-6">{$f_presenter}</div>
			</div>
		{/if}	

		{if $f_eventType}	
			<div class="row mar-top-sm">
				<div class="col-xs-12 col-sm-4 text-right text-left-xs event_view_title">Event Type</div>
				<div class="col-xs-12 col-sm-6">{$f_eventType}</div>
			</div>	
		{/if}

		<div class="row mar-top-sm">
			<div class="col-xs-12 col-sm-4 text-right text-left-xs event_view_title">Posted By</div>
			<div class="col-xs-12 col-sm-6">{$f_eventAddedBy|username}</div>
		</div>	
	</div>
	<div class="text-center col-xs-12 col-sm-4 col-md-4">
		<div class="favimage">{wikiplugin _name="FAVORITE" objectType="trackeritem" objectId="{$f_itemId}"}{/wikiplugin}</div>
		<div class="attend-btn mar-top-sm">{wikiplugin _name=addrelation label_add="I Wish to Attend" label_added="I am Attending" label_remove="Remove" qualifier="leaf.event.attending" source_object="user:{$user}" target_object="trackeritem:{$f_itemId}"}{/wikiplugin}</div>
	</div>
	<div class="clearfix"></div>
	<div class="col-md-12">
		<div class="row mar-top-sm">
			<div class="col-xs-12 col-sm-3 text-right text-left-xs event_view_title visibleleft">Summary</div>
			<div class="col-xs-12 col-sm-9 hidden-xs visibleright">{$f_eventSummary}</div>
			<div class="col-xs-12 col-sm-9 visible-xs">{$f_eventSummary}</div>
		</div>	

		<div class="row mar-top-sm">
			<div class="col-xs-12 col-sm-3 text-right text-left-xs event_view_title visibleleft">Full Description</div>
			<div class="col-xs-12 col-sm-9 hidden-xs visibleright">{$f_eventDescription}</div>
			<div class="col-xs-12 col-sm-9 visible-xs">{$f_eventDescription}</div>
		</div>	
		
		{if $f_eventFiles}
			<div class="row mar-top-lg">
				<div class="col-xs-12 col-sm-3 text-right text-left-xs event_view_title visibleleft">Event Resources</div>
				<div class="col-xs-12 col-sm-9 hidden-xs visibleright">
					<div class="row">
						{wikiplugin _name="list"}
	                	 {literal}
	                    	{filter type="trackeritem"}
	                    	{filter content="4" field="tracker_id"}
	                    	{filter field="object_id" content="{/literal}{$f_itemId}{literal}"}
	                    	{filter categories="{/literal}{$smarty.get.cat}{literal}"}
	                    	{output template="templates/syn-lists-files.tpl"}
	                    	{ALTERNATE()}There is no result for this search{ALTERNATE}
	                	 {/literal}
	            		{/wikiplugin}
	            	</div>
	            </div>
			</div>
		{/if}

		<div class="col-md-12">
			<div id="comment-container" data-target="{service controller=comment action=list type=trackeritem objectId={$f_itemId}}"></div>
		</div>
	</div>
</div>
<div class="col-md-3">
	<div class="panel panel-default">
	  	<div class="panel-heading"><i class="fa fa-star fa-6"></i> Event Attendees</div>
	  	<div class="panel-body">
	  		{wikiplugin _name=relations qualifiers="leaf.event.attending.invert" object="trackeritem:{$f_itemId}" singlelist="1"}{/wikiplugin}
	  	</div>
	</div>
	<div class="panel panel-default">
	  	<div class="panel-heading"><i class="fa fa-star fa-6"></i> Similar Events</div>
	  	<div class="panel-body">
	  		{wikiplugin _name="list"}
                {literal}
                	{list max="5"}
                    {filter type="trackeritem"}
                    {filter content="4" field="tracker_id"}
                    {filter categories="{/literal}{$smarty.get.cat}{literal}"}
                    {output template="templates/syn-lists-event.tpl"}
                    {ALTERNATE()}There is no result for this search{ALTERNATE}
                {/literal}
            {/wikiplugin}
	  	</div>
	</div>
</div>

{JQ}
	var id = '#comment-container';
	$(id).comment_load($(id).data('target'));
{/JQ}