{literal}
	<div class="col-md-12 mar-bottom-xl mar-top-lg mygrp">
		<a href="#"><button type="button" class="btn btn-default pull-right">{tr}Create Project{/tr}</button></a>
	</div>
	<div class="col-md-12">
		<div class="input-group">
			{input _filter="tracker_field_og_title,tracker_field_og_description,tracker_field_groupState" type="text" class="form-control" placeholder="{/literal}{tr _0=$prefs.ta_syn_organicgrp_pterm}Search %0{/tr}{literal}..."}<span class="input-group-btn">{input type="Submit" value="{tr}Search{/tr}" class="btn btn-search"}</span>
		</div>
	</div>
{/literal}