{include file="syn-groupnav.tpl"}
{wikiplugin _name="CUSTOMSEARCH" tpl="addons/syn_organicgrp/templates/syn_organicgrp_files_search.tpl" id="syn_organicgrp_file_search"  searchfadediv="customsearch_announcementsearch_results" autosearchdelay="1500" recalllastsearch="0"} 
{literal}
	{filter type="file"}
	{pagination max="9"}
        {filter content="{/literal}{$smarty.get.itemId}{literal}" field="gallery_id"}
	{sort mode="modification_date_ndesc"}
	{output template="addons/syn_organicgrp/templates/syn_organicgrp_files.tpl"}
{/literal}
{/wikiplugin}