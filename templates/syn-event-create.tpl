{if $smarty.get.alert == 'y'}
	<div class="alert alert-success alert-dismissible" role="alert">
		<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">{tr}Close{/tr}</span></button>
		<strong>{tr}Well done {/tr}!</strong> {tr}You submitted your text. We will review your submission and will notify you if we have questions.{/tr}
	</div>
{/if}
{debug}
	{formitem _field={$f_eventTitle} _label="{tr}Title{/tr}"}
	{formitem _field={$f_presenter} _label="{tr}Presenter{/tr}"}
	{formitem _field={$f_eventLocation} _label="{tr}Location{/tr}"}
	{formitem _field={$f_region} _label="{tr}Region{/tr}"}
	{formitem _field={$f_eventType} _label="{tr}Event Type{/tr}"}
	{formitem _field={$f_eventDescription} _label="{tr}Description{/tr}"}
	{formitem _field={$f_startDate2} _label="{tr}Start Date and Time{/tr}" id="eventStart"}
	{formitem _field={$f_endDate} _label="{tr}End Date and Time{/tr}" id="eventEnd"}
	{formitem _field={$f_eventFiles} _label="{tr}Event Files{/tr}" class="file-section"}
	{formitem _field={$f_isWebinar} _label="{tr}Is Webinar{/tr}"}

{jq}
    var virginEndDate = 1; // This tracks whether endDate has been changed

    var startText = $('#eventStart .form-control');
    var endText = $('#eventEnd .form-control');
    $(startText).change(function(){
        if (virginEndDate){
            $(endText).val(startText.val());
        }
    });

    $(endText).change(function(){
        virginEndDate=0;
    });

{/jq}