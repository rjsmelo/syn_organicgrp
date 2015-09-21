{if !empty($datachannel_feedbacks)}
    {remarksbox type='note' title="{tr}Feedback{/tr}"}
    {foreach from=$datachannel_feedbacks item=feedback}
        {$feedback|escape}<br>
    {/foreach}
    {/remarksbox}
{/if}
<form method="post" id="datachannel" action="#{$datachannel_execution}"{$form_class_attr}{$datachannel_form_onsubmit}>
    {foreach from=$datachannel_fields key=name item=label}
        {if $label eq "external"}
            <input type="hidden" name="{$name|escape}" value="">
        {elseif $datachannel_inputfields.$name eq "hidden"}
            <input type="hidden" name="{$name|escape}" value="{$label}">
        {else}
            <div class=form-group>
                <label>{$label|escape}</label>
                {if $name eq "groupdescription"}
                    <textarea type="text" data-validation="required" class="form-control" name="{$name|escape}" rows='4'></textarea>
                {elseif $name eq "welcomeMessage"}
                    <textarea type="text" class="form-control" name="{$name|escape}" rows='4'></textarea>
                {elseif $name eq "publicprivate"}
                    <select name="publicprivate" class="form-control" >
                        <option value="public" selected>Public</option>
                        <option value="private">Private</option>
                    </select>
                {else}
                    <input type="text" data-validation="required" class="form-control" name="{$name|escape}">
                {/if}
            </div>
        {/if}
    {/foreach}
    <div class="submit_row">
        <input type="hidden" name="datachannel_execution" value="{$datachannel_execution|escape}">
        <input type="submit" class="btn btn-default" value="{tr}{$button_label}{/tr}">
    </div>
</form>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.1.47/jquery.form-validator.min.js"></script>
<script> $.validate(); </script>