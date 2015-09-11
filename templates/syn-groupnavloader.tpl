{if !isset($groupTrackerItemId)}{assign var=groupTrackerItemId value=$smarty.request.organicgroup scope=global}
{/if}
{if $groupTrackerItemId}
	{wikiplugin _name="list"}
	{literal}
		{list max="1" offset="0"}
		{filter type="trackeritem"}
		{filter content="{/literal}{addonobjectid profile="004_og_tracker" reference="trk_og"}{literal}" field="tracker_id"}
		{filter content="{/literal}{$groupTrackerItemId}{literal}" field="object_id"}
		{output template="addons/syn_organicgrp/templates/syn-groupnav.tpl" groupnavfrom={/literal}{$groupnavfrom}{literal}}
		{FORMAT(name="logo_image")}{display name="tracker_field_og_logo_image" format="trackerrender" default=""}{FORMAT}
		{FORMAT(name="approvalCount" mode="raw")}{/literal}{$approvalcount}{literal}{FORMAT}
		{FORMAT(name="groupnavfrom" mode="raw")}{/literal}{$groupnavfrom}{literal}{FORMAT}
	{/literal}
	{/wikiplugin}
{else}
	{jq}
		window.location.replace("syn_organicgrp_mygroups");
	{/jq}
{/if}
