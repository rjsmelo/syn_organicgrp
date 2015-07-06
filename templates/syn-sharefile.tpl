{if $smarty.get.alert == 'y'}
    <div class="alert alert-success alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <strong>{tr}Well done !{/tr}</strong>{tr} You submitted your file.{/tr}
    </div>
{/if}
{formitem _field={$f_name} _label="{tr}Title{/tr}"}
{formitem _field={$f_description} _label="{tr}Description{/tr}"}
{formitem _field={$f_fileType} _label="{tr}File Type{/tr}" id="fileTypeSelector"}

<div class="fileSection hidden">
    <div class="show-pc">{formitem _field={$f_pcFiles} _label="{tr}Upload File{/tr}" class="file-section"}</div>
    <div class="show-external">{formitem _field={$f_externalURL} _label="{tr}External URL{/tr}"}</div>
</div>

{jq}
$('#fileTypeSelector>select').change(function(){
    $(".fileSection").removeClass("hidden");

    if ($( this ).val() == $profileobject:002_og_categories:cat_organicgrp_filetypes_file$){
        $(".show-pc").removeClass("hidden");
        $(".show-external").addClass("hidden");
    }
    if ($( this ).val() == $profileobject:002_og_categories:cat_organicgrp_filetypes_url$){
        $(".show-pc").addClass("hidden");
        $(".show-external").removeClass("hidden");
    }
});

{/jq}

