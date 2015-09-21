<?php

namespace tikiaddon\syn\organicgrp;

class OrganicGroup {

	function __construct()
	{

	}
	function getCatByOrganicGroupId($organicgrp) {
		$catlib = \TikiLib::lib("categ");
		$catId = $catlib->get_category_id("syn_organicgrp_".$organicgrp);
		return $catId;
	}
}

