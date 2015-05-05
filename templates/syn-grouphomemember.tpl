{assign var=mgrpname value="syn_organicgrp_managers_{$smarty.get.organicgroup}"}
{assign var=grpname value="{$smarty.get.organicgroup|groupnamebyid}"}
{if $mgrpname|in_group}
	<div class="mar-bottom-xl">
		<a href="syn_organicgrp_managegrp?itemId={$smarty.get.organicgroup}&organicgroup={$smarty.get.organicgroup}" class="btn btn-default button-bar pull-left"> {tr}Manage Collaboration Members{/tr} </a>
		{wikiplugin _name="mail" bypass_preview="y" popup="y" showgroupdd="n" showuser="n" group="{$grpname}" mail_subject="{tr}LEAF - A Message from the Leader of{/tr} {$grpname}" label_name="{tr}Send Email to All Members{/tr}"}{/wikiplugin}
	</div>
{/if}