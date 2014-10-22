<div class="row">
{foreach item=result from=$results}
	<div class="col-lg-4 col-sm-6 col-xs-12 zoom">
		<div class="contact-box clickable">
			<a href="profile?view_user={$result.tracker_field_user}"></a>
			<div class="col-xs-3 nopadding mar-bottom-xl">
				<div class="thumb" style="background-image: url(tiki-show_user_avatar.php?user={$result.tracker_field_user})">
				</div>
			</div> 
			<div class="col-xs-9">
				<h5 class="align-top">{$result.tracker_field_firstname} {$result.tracker_field_lastname}</h5>
				<ul class="fa-ul clear-stack">
				  {if $result.tracker_field_city}
				  	<li><span class="fa-li fa fa-map-marker fa-fw"></span>{$result.tracker_field_city}</li>
				  {/if}
				  <li><span class="fa-li fa fa-book fa-fw"></span>
				    {wikiplugin _name="list"}
                        {literal}
                            {filter type="trackeritem"}
                            {filter content="2" field="tracker_id"}
                            {filter field="tracker_field_user" content="{/literal}{$result.tracker_field_user}{literal}"}
                            {output template="templates/styles/pagesvives/syn-resource_count.tpl"}
                            {ALTERNATE()}0{ALTERNATE}
                        {/literal}
                    {/wikiplugin}Announcements
				  </li>
				  <!--Placeholder to keep size of box thew same throughout -->
				  {if $result.tracker_field_city}{else}
				  	<li><span class="fa-li fa"></span></li>
				  {/if}
				  {if $result.tracker_field_siteWeb}{else}
				  	<li><span class="fa-li fa"></span></li>
				  {/if}
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>	
	</div>
{/foreach}
</div>