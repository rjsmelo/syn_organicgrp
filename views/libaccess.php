<?php
namespace tikiaddon\syn\organicgrp;

function libaccess_info()
{
	return array(
		'name' => tra('getOrganicGroupIdByCat'),
		'description' => tra('Display output of a Tiki Addon View'),
		'filter' => 'text',
		'params' => array(
			'category' => array(
				'required' => false,
				'name' => tra('Color of introductory text'),
				'description' => tra('The color to display the introductory text in'),
				'extraparams' => false,
				'filter' => 'text',
			),
		),
	);
}
function libaccess($data, $params)
{
	// extracts parameters passed from wikiplugin_addon.php
	// Note that $data is the data passed as well
	extract($params, EXTR_SKIP);
	$og_addon = \TikiAddons::get('syn_organicgrp');
	$oglib = $og_addon->lib('organicgrp');

	$result="";
	switch ($function) {
		case "getOrganicGroupIdByCat":
			if (empty($category)) {
				return false;
			}
			return $oglib->getOrganicGroupIdByCat($category);
		case "getCatbyOrganicGroupId":
			if (empty($organicgrp)) {
				return false;
			}
			return $oglib->getCatbyOrganicGroupId($organicgrp);
	}

	return "Library function not found";
}