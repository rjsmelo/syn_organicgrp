<div class="mygroups">
	<div class="btn-group">
		<a href="syn_organicgrp_joingroups"  class="btn btn-default">{tr _0=$prefs.ta_syn_organicgrp_pterm}Join %0{/tr}</a><a href="syn_organicgrp_creategroup"  class="btn btn-default">{tr _0=$prefs.ta_syn_organicgrp_sterm}Create %0{/tr}</a>
	</div>
	<div class="clear"></div>
	<div class="row">
		<div class="col-md-6 mygroups-list">
			{wikiplugin _name="CUSTOMSEARCH" tpl="syn-groupsearchui.tpl" id="mygrp" searchonload="1" requireinput="0" autosearchdelay="0" recalllastsearch="0"}
			{literal}
				{list max="999"}
				{sort mode="title_asc"}
				{filter type="trackeritem"}
				{filter field="tracker_id" exact="{/literal}{addonobjectid profile='004_og_tracker' ref='trk_og' package='syn_organicgrp'}{literal}"}
				{output template="syn-mygroups.tpl"}
				{ALTERNATE()}<div class="well">You are not participating in any {/literal}{$prefs.ta_syn_organicgrp_pterm}{literal} yet.</div>{ALTERNATE}
				{FORMAT(name="og_descrip")}{display name=tracker_field_og_description default="" format=snippet length=200 suffix="..."}{FORMAT}
			{/literal}
			{/wikiplugin}
		</div>
		<div class="col-md-6 mygroups-activity">
			{wiki}
			{literal}
				{ACTIVITYSTREAM()}
				{pagination max="7"}
				{filter personalize="addongroups"}
				{group field=aggregate collect=user}
				{ACTIVITYSTREAM}
			{/literal}
			{/wiki}
		</div>
	</div>
</div>