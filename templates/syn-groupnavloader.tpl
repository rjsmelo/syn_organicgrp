{if ($groupnavfrom == 'forum')}
	{if !isset($groupTrackerItemId)}{assign var=groupTrackerItemId value=$smarty.request.organicgroup}{/if}
{elseif ($groupnavfrom == 'whiteboard')}
	{if !isset($groupTrackerItemId)}{assign var=groupTrackerItemId value=$smarty.request.organicgroup}{/if}
{elseif ($groupnavfrom == 'events')}
	{if !isset($groupTrackerItemId)}{assign var=groupTrackerItemId value=$smarty.request.organicgroup}{/if}
{elseif ($groupnavfrom == 'files')}
	{if !isset($groupTrackerItemId)}{assign var=groupTrackerItemId value=$smarty.request.organicgroup}{/if}
{elseif ($groupnavfrom == 'home')}
	{if !isset($groupTrackerItemId)}{assign var=groupTrackerItemId value=$smarty.request.organicgroup}{/if}
{elseif ($groupnavfrom == 'live')}
    {if !isset($groupTrackerItemId)}{assign var=groupTrackerItemId value=$smarty.request.organicgroup}{/if}
{elseif ($groupnavfrom == 'members')}
	{if !isset($groupTrackerItemId)}{assign var=groupTrackerItemId value=$smarty.request.organicgroup}{/if}
{elseif ($groupnavfrom == 'manage')}
	{if !isset($groupTrackerItemId)}{assign var=groupTrackerItemId value=$smarty.request.organicgroup}{/if}
{/if}

{if $groupTrackerItemId}
	{wikiplugin _name="list"}
	{literal}
		{list max="1" offset="0"}
		{filter type="trackeritem"}
		{filter content="{/literal}{addonobjectid profile="004_og_tracker" reference="trk_og"}{literal}" field="tracker_id"}
		{filter content="{/literal}{$groupTrackerItemId}{literal}" field="object_id"}
		{output template="addons/syn_organicgrp/templates/syn-groupnav.tpl" somevar="test"}
		{FORMAT(name="logo_image")}{display name="tracker_field_og_logo_image" format="trackerrender" default=""}{FORMAT}
		{FORMAT(name="approvalCount")}{/literal}{$approvalcount}{literal}{FORMAT}
	{/literal}
	{/wikiplugin}
{/if}
