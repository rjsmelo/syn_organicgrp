{activityframe activity=$activity heading="
<div class='activity_border'></div>
<div class='clearfix pad-bottom-xl pad-top-xl'>
	<div class='pull-left'>
		<span class='fa fa-sign-out activity_icon'></span>
	</div>
	<div class='activity_popover popover right col-xs-9 col-sm-10'>	
		<div class='arrow'></div> 
		<div class='popover-content'>
			{tr _0=$activity.user|userlink}%0 left {$prefs.ta_syn_organicgrp_sterm|a_or_an}			<a href='syn_organicgrp_grouphomepage?itemId={$activity.organicgroupid|escape}'>{$activity.organicgroupname|escape}</a>{/tr}"}
			<div class='well well-sm mar-top-xl mar-bottom-sm'>
				<p>{$activity.organicgroupname|escape}	is missed the member</p>
			</div>
			<span class='pull-right mar-bottom-sm'><small>September 12, 2014 10:21AM</small></span>
		</div>
	</div>
</div>
{/activityframe}
