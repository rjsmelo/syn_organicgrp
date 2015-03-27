{wikiplugin _name="addon" package="syn/organicgrp" view="groupnavloader" from="home"}{/wikiplugin}
{assign var=tikiaddon_package value="syn_organicgrp"}
{assign var=grpname value="syn_organicgrp_`$f_itemId`"}
{assign var=mgrpname value="syn_organicgrp_managers_`$f_itemId`"}
{assign var=pgrpname value="syn_organicgrp_pending_`$f_itemId`"}
{assign var=admgrpname value="Admins"}
{if $mgrpname|in_group || $admgrpname|in_group}
    {*<h2>Manage {$prefs.ta_syn_organicgrp_sterm} - {$f_og_title}</h2>*}
    <div role="tabpanel" class="mar-top-lg">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#" data-target="#managemembers" aria-controls="managemembers" role="tab" data-toggle="tab">{tr}Manage Members{/tr}</a></li>
            <li role="presentation"><a href="#" data-target="#editdetails" aria-controls="editdetails" role="tab" data-toggle="tab">{tr}Edit Collaboration Details{/tr}</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane clearfix active" id="managemembers">
                <h3>{tr}Manage Members{/tr}</h3>
                {wikiplugin _name="memberlist" groups="syn_organicgrp_pending_{$f_itemId}" addon_groups_approval_buttons="y" title="{tr}Users Pending Approval{/tr}"}{/wikiplugin}
                {wikiplugin _name="memberlist" groups="syn_organicgrp_{$f_itemId}" email_to_added_user="y" email_to_removed_user="y" title="{tr}Current Members{/tr}"}{/wikiplugin}
                {wikiplugin _name="memberlist" groups="syn_organicgrp_managers_{$f_itemId}" title="Leaders" help_block="{tr}Only leaders can approve new requests to join, remove or add other members. As a leader, you can make other members leaders as well by adding them here.{/tr}"}{/wikiplugin}
            </div>
            <div role="tabpanel" class="tab-pane clearfix" id="editdetails">
                <h3>{tr _0=$prefs.ta_syn_organicgrp_sterm}Edit %0 Details{/tr}</h3>

                <p class="help-block">{tr}Providing an informative description will enable visitors to quickly determine if they would like to join your group or investigate further.{/tr}</p>
                {wikiplugin _name="tracker" trackerId="{addonobjectid profile="004_og_tracker" ref="trk_og"}" fields="{addonobjectid profile="004_og_tracker" ref="trk_og_title"}:{addonobjectid profile="004_og_tracker" ref="trk_og_description"}:{addonobjectid profile="004_og_tracker" ref="trk_og_welcome_message"}" tpl="syn-editgroupdetails.tpl" action="{tr}Save Changes{/tr}" url="syn_organicgrp_managegrp?itemId={$f_itemId}"}{/wikiplugin}
                <h3>{tr _0=$prefs.ta_syn_organicgrp_sterm}Removing %0{/tr}</h3>

                <p>{tr _0=$prefs.ta_syn_organicgrp_sterm}Script to remove %0 is under development. For now, please contact us if you wish to remove the %0{/tr}.
            </div>
        </div>

    </div>
    <br>
{else}
    {remarksbox type="error" title="{tr _0=$prefs.ta_syn_organicgrp_sterm} %0 Management Pages{/tr}" close="n"}
        {tr}You are not allowed to view this page.{/tr}
    {/remarksbox}
{/if}
