<div class="form-group listview">
	<div class="search-category-header" data-toggle="collapse" data-target="#collapsible{$id}"><label>{$header_label}</label><span class="pull-right fa fa-minus-square-o fa-lg"></span></div>
		<div class="collapse in hide-select" id="collapsible{$id}">
			{literal}
				{categories _parent="{/literal}{$category_id}{literal}" _style="checkbox" _group="{/literal}{$category_id}{literal}"}
			{/literal}
		</div>
</div>

{jq}
	$(".listview .search-category-header").click(function(){
		if($(this).hasClass('collapsed')){
			$(this).find("span").removeClass("fa-plus-square-o");
			$(this).find("span").addClass("fa-minus-square-o");
		} else {      
			$(this).find("span").addClass("fa-plus-square-o");
			$(this).find("span").removeClass("fa-minus-square-o");
		}	
	});
{/jq}
