    <span class="pull-right mar-bottom-lg clear"><a class="btn btn-action" href="syn_organicgrp_sharefile?organicgroup={$smarty.get.organicgroup}"><span class="fa fa-cloud-upload"></span> Share New Files</a></span>
	<div class="clear"></div>
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
