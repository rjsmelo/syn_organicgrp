{jq}
	$("#reset_search").click(function(){
		window.location.reload(true);
	});	
{/jq}
{assign var="todatedate" value="{$smarty.now}"}
{assign var="typefilter" value="{$smarty.get.type}"}
{assign var="organicid" value="{$smarty.get.organicgroup}"}
{if $typefilter eq 'up'}
{jq}
	$(".upevent").prop( "checked", true );
{/jq}
{elseif $typefilter eq 'past'}
{jq}
	$(".pastevent").prop( "checked", true );
{/jq}
{else}
{jq}
	$(".allevent").prop( "checked", true );
{/jq}
{/if}
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
					<li class="mar-bottom-sm">{literal}{input type="radio" _filter="content" class="upevent"}{/literal} Upcoming Events</li>
					<li class="mar-bottom-sm">{literal}{input type="radio" _filter="content" class="pastevent"}{/literal} Past Events</li>
					<li class="mar-bottom-sm">{literal}{input type="radio" _filter="content" _field="tracker_id" _value="4" _group="2" class="allevent"}{/literal} All Events</li>
				</ul>
			</div>
		</div>
		<hr>
		{include file="syn-collapsible-categories.tpl" id="10" header_label="By Region" category_id="95"}
		<hr>
		{include file="syn-collapsible-categories.tpl" id="11" header_label="By Type" category_id="100"}
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
	$(".listview .upevent").click(function(){
		var organcid = {{$organicid}};
		var todate = {{$todatedate}};
		$(location).attr('href', 'syn_organicgrp_event?organicgroup='+organcid+'&start='+todate+'&end=1893495012&type=up');
	});
	$(".listview .pastevent").click(function(){
		var todate = {{$todatedate}};
		var organcid = {{$organicid}};
		$(location).attr('href', 'syn_organicgrp_event?organicgroup='+organcid+'&start=946723812&end='+todate+'&type=past');
	});
	$(".listview .allevent").click(function(){
		var organcid = {{$organicid}};
		$(location).attr('href', 'syn_organicgrp_event?organicgroup='+organcid+'&start=946723812&end=1893495012&type=all');
	});
{/jq}

