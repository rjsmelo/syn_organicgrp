{activityframe 	heading="{$activity.user|userlink} replied to the forum thread {object_link type=$activity.type id=$activity.object}."
                content="{$activity.content|escape|truncate:100}"
                icon={icon name=add iclass="fa-2x"}}
{/activityframe}