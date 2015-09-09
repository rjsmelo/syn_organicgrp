{activityframe 	heading="{icon name="comment-o" iclass="fa-2x"} {$activity.user|userlink} posted {object_link type=$activity.type id=$activity.object} in {object_link type="forum" id=$activity.forum_id}."
                content="{$activity.content|escape|truncate:100}"}
{/activityframe}