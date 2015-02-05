{if $groupTrackerItemId}
	{wikiplugin _name="list"}
	{literal}
		{list max="1" offset="0"}
		{filter type="trackeritem"}
		{filter content="{/literal}{addonobjectid profile="004_og_tracker" reference="trk_og" package="syn/organicgrp"}{literal}" field="tracker_id"}
		{filter content="{/literal}{$groupTrackerItemId}{literal}" field="object_id"}
		{output template="addons/syn_organicgrp/templates/syn-groupnav.tpl" somevar="test"}
		{FORMAT(name="logo_image")}{display name="tracker_field_og_logo_image" format="trackerrender" default=""}{FORMAT}
		{FORMAT(name="approvalCount" mode="raw")}{/literal}{$groupapprovalcount}{literal}{FORMAT}
	{/literal}
	{/wikiplugin}
{else}
	{jq}
		window.location.replace("syn_organicgrp_mygroups");
	{/jq}
{/if}
