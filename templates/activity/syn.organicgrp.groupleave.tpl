{assign "username" "{$activity.user|userlink}"}

{assign "heading" "{$user_id|userlink} has left the group <a href='syn_organicgrp_grouphomepage?organicgroup={$activity.organicgroupid|escape}'>{$activity.organicgroupname}</a>"}

{include file="./syn.general.activity.tpl" icon="fa-sign-out fa-flip-horizontal" heading="{$heading}"}