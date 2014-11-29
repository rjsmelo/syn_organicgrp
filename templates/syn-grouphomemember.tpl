<div class="row bg-light-accent pad-top-lg">
{foreach item=result from=$results}
	<div class="col-lg-4 col-sm-6 col-xs-12 zoom">
		<div class="contact-box clickable">
			<a href="profile?view_user={$result.tracker_field_user}"></a>
			<div class="col-xs-3 nopadding">
				<div class="imgbgd">
					<div class="thumb" style="background-image: url(tiki-show_user_avatar.php?user={$result.tracker_field_user})"></div>
				</div>
				<div class="text-center mar-top-sm home_right_panel">{$result.tracker_field_position}</div>
			</div> 
			<div class="col-xs-9 pad-left-xl">
				<h4 class="align-top">{$result.tracker_field_firstname} {$result.tracker_field_lastname}</h4>
				<h6>{$result.tracker_field_organization}</h6>
				<ul class="fa-ul align-bottom home_right_panel clear-stack">
				  	{if $result.tracker_field_city}
				  		<li><span class="fa-li fawidth fa fa-map-marker fa-fw"></span>{$result.tracker_field_city}, {$result.tracker_field_country}</li>
				 	{/if}
				  	<li><span class="fa-li fawidth fa fa-book fa-fw"></span>
				   		{wikiplugin _name="list"}
                       		{literal}
	                            {filter type="trackeritem"}
	                            {filter content="2" field="tracker_id"}
	                            {filter field="tracker_field_user" content="{/literal}{$result.tracker_field_user}{literal}"}
	                            {output template="themes/leaf/templates/syn-resource_count.tpl"}
	                            {ALTERNATE()}0{ALTERNATE}
                        	{/literal}
                    	{/wikiplugin}Total Contribution
				 	</li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>	
	</div>
{/foreach}
</div>