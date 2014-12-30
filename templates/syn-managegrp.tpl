{assign var=tikiaddon_package value="syn_organicgrp"}
{assign var=grpname value="syn_organicgrp_`$f_itemId`"}
{assign var=mgrpname value="syn_organicgrp_managers_`$f_itemId`"}
{assign var=pgrpname value="syn_organicgrp_pending_`$f_itemId`"}
{assign var=admgrpname value="Admins"}
{if $mgrpname|in_group || $admgrpname|in_group}
    <h2>Manage {$prefs.ta_syn_organicgrp_sterm} - {$f_og_title}</h2>
    <a href="syn_organicgrp_grouphomepage?organicgroup={$f_itemId}">
        <button class="btn btn-default">Return to {$prefs.ta_syn_organicgrp_sterm} Home Page</button>
    </a>
    <div role="tabpanel" class="mar-top-lg">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#" data-target="#managemembers" aria-controls="managemembers" role="tab"
                                                      data-toggle="tab">Manage Members</a></li>
            <li role="presentation"><a href="#" data-target="#editdetails" aria-controls="editdetails" role="tab" data-toggle="tab">Edit
                    Details</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="managemembers">
                <h3>Manage Members</h3>
                {wikiplugin _name="memberlist" groups="syn_organicgrp_pending_{$f_itemId}" addon_groups_approval_buttons="y"}{/wikiplugin}
                {wikiplugin _name="memberlist" groups="syn_organicgrp_{$f_itemId}" email_to_added_user="y" email_to_removed_user="y" title="Current Members"}{/wikiplugin}
                {wikiplugin _name="memberlist" groups="syn_organicgrp_managers_{$f_itemId}" title="Leaders" help_block="Only leaders can approve new requests to join, remove or add other members. As a leader, you can make other members leaders as well by adding them here."}{/wikiplugin}
            </div>
            <div role="tabpanel" class="tab-pane" id="editdetails">
                <h3>Edit {$prefs.ta_syn_organicgrp_sterm} Details</h3>

                <p class="help-block">Providing an informative description will enable visitors to quickly determine if
                    they would like to join your group or investigate further.</p>
                {wikiplugin _name="tracker" trackerId="{addonobjectid profile="004_og_tracker" ref="trk_og"}" fields="{addonobjectid profile="004_og_tracker" ref="trk_og_title"}:{addonobjectid profile="004_og_tracker" ref="trk_og_description"}" tpl="syn-editgroupdetails.tpl" action="Save Changes" url="syn_organicgrp_managegrp?itemId={$f_itemId}"}{/wikiplugin}
                <h3>Removing {$prefs.ta_syn_organicgrp_sterm}</h3>

                <p>Script to remove {$prefs.ta_syn_organicgrp_sterm} is under development. For now, please contact us if
                    you wish to remove the {$prefs.ta_syn_organicgrp_sterm}.
            </div>
        </div>

    </div>
    <br>
{else}
    {remarksbox type="error" title="{$prefs.ta_syn_organicgrp_sterm} Management Pages" close="n"}
        You are not allowed to view this page.
    {/remarksbox}
{/if}
