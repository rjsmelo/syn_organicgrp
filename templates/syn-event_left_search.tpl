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
		<div class="form-group listview">
			<div class="search-category-header" data-toggle="collapse" data-target="#collapsible1"><label>By Status</label><span class="pull-right fa fa-minus-square-o fa-lg"></span></div>
			<div class="collapse in" id="collapsible1">
				<ul>
					<li class="mar-bottom-sm">{literal}{input type="checkbox" _field="tracker_id" _filter="content" _value="4" _group="2"}{/literal} All</li>
					<li class="mar-bottom-sm">{literal}{input type="checkbox" _field="tracker_status" _filter="content" _value="o" _group="2"}{/literal} Open</li>
					<li class="mar-bottom-sm">{literal}{input type="checkbox" _field="tracker_status" _filter="content" _value="p" _group="2"}{/literal} Archived</li>
				</ul>
			</div>
		</div>
		<hr>
		{include file="syn-collapsible-categories.tpl" id="5" header_label="By Region" category_id="43"}
	</div>
	<hr>
	<div class="clear">
 		<div class="search-category-header" data-toggle="collapse" data-target="#collapsible2"><label>Date</label><span class="pull-right fa fa-minus-square-o fa-lg"></span></div>
		<div class="collapse in" id="collapsible2"> </div>
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

