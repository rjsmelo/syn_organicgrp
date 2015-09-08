{activityframe 	heading="{$activity.user|userlink} updated the {object_link title=whiteboard type=$activity.type id=$activity.object}."
				content="{$activity.content|escape|truncate:100}"
				icon={icon name="pencil-square-o" iclass="fa-2x"}}
{/activityframe}