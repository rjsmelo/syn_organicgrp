{JQ}
    $("#reset_search").click(function(){
    window.location.reload(true);
    });
{/JQ}
<div class="col-md-4 col-xs-12 pull-left left_search">
    {literal}
        <div class="form-group">
            <div class="input-group">
                {input _filter="content" _field="title" type="text"  placeholder="Search... " class="form-control"}
				<span class="input-group-btn">
				   	{input type=submit value="Search" class="btn btn-search"}
				</span>
            </div>
        </div>
    {/literal}
    <div class="mar-top-xl">
        <div class="h4 text-primary mar-top pull-left">Refine Results</div>
        <div class="form-group pull-right">
            <button class="btn btn-action" type="reset" id="reset_search">Reset</button>
        </div>
    </div>
    <div class="clear">
        {include file="syn-collapsible-categories.tpl" id="10" header_label="By File Type" category_id="116"}
        <hr>
        <div class="form-group listview">
            <div class="search-category-header" data-toggle="collapse" data-target="#collapsible1"><label>By File Attachment Type</label><span class="pull-right fa fa-minus-square-o fa-lg"></span></div>
            <div class="collapse in" id="collapsible1">
                <ul>
                    {literal}
                        <li class="mar-bottom-sm">{input _filter="content" _value="Pdf" _default="n" _field="file_group" type="checkbox"} PDF</li>
                        <li class="mar-bottom-sm">{input _filter="content" _value="Document" _default="n" _field="file_group" type="checkbox"} Document</li>
                        <li class="mar-bottom-sm">{input _filter="content" _value="Spreadsheet" _default="n" _field="file_group" type="checkbox"} Spreadsheet</li>
                        <li class="mar-bottom-sm">{input _filter="content" _value="Presentation" _default="n" _field="file_group" type="checkbox"} Presentation</li>
                        <li class="mar-bottom-sm">{input _filter="content" _value="Video" _default="n" _field="file_group" type="checkbox"} Video</li>
                        <li class="mar-bottom-sm">{input _filter="content" _value="Image" _default="n" _field="file_group" type="checkbox"} Image</li>
                    {/literal}
                </ul>
            </div>
        </div>
    </div>
</div>

{JQ}
    $(".listview .search-category-header").click(function(){
        if($(this).hasClass('collapsed')){
            $(this).find("span").removeClass("fa-plus-square-o");
            $(this).find("span").addClass("fa-minus-square-o");
        } else {
            $(this).find("span").addClass("fa-plus-square-o");
            $(this).find("span").removeClass("fa-minus-square-o");
        }
    });
{/JQ}
