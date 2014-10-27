<div class="col-md-4 col-sm-12 pull-left left_search right_border">
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
	<div>
		<span class="h4">Refine</span>
		<div class="form-group pull-right">
			<button class="btn btn-action" type="reset" id="reset_search">Reset</button>
		</div>
	</div>
	<div class="clear">
	<div class="form-group listview">
	<div class="search-category-header" data-toggle="collapse" data-target="#collapsible1"><label>By Status</label><span class="pull-right fa fa-minus-square-o fa-lg"></span></div>
		<div class="collapse in" id="collapsible1">
			{literal}{input type="checkbox" _field="tracker_id" _filter="content" _value="4" _group="2"}{/literal}
			All<br>
			{literal}{input type="checkbox" _field="tracker_status" _filter="content" _value="o" _group="2"}{/literal}
			Open<br>
			{literal}{input type="checkbox" _field="tracker_status" _filter="content" _value="p" _group="2"}{/literal}
			Archived
		</div>
	</div>
	<div class="clear">
 	<div class="search-category-header" data-toggle="collapse" data-target="#collapsible2"><label>Date</label><span class="pull-right fa fa-minus-square-o fa-lg"></span></div>
		<div class="collapse in" id="collapsible2"> 
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

