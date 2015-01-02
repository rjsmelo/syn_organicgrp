<div class="col-md-12 mar-bottom-xl mar-top pull-right">
	<a href="syn_organicgrp_creategroup"  class="btn btn-action pull-right">Create Collaboration</a>
</div>
<div class="clear"></div>
<div class="col-md-12">
	<div class="col-md-6 projectgrp">
		{wikiplugin _name="CUSTOMSEARCH" tpl="syn-groupsearch.tpl" id="mygrp" searchonload="1" requireinput="0" autosearchdelay="0" recalllastsearch="0"}
			{literal}
			 	{list max="999"}
			  	{filter type="trackeritem"} 
			  	{filter field="tracker_id" content="6"}
			  	{output template="addons/syn_organicgrp/templates/syn-mygroups.tpl"}
			  	{FORMAT(name="og_descrip")}
			  		{display name=tracker_field_og_description default="" format=snippet length=200 suffix="..."}
				{FORMAT}
			  	{sort mode="title_asc"}
			{/literal}
    	{/wikiplugin}
	</div>
	<div class="col-md-6 projectlist pull-right">
		{wiki}
			{literal}
			{ACTIVITYSTREAM(auto="0")}
	            {pagination max="10"}
	            {filter categories="{/literal}{$user|my_group}{literal}"}
	            {group field=aggregate collect=user}
			{ACTIVITYSTREAM}
			{/literal}
		{/wiki}
	</div>
</div>

