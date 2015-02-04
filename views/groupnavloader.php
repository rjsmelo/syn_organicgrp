<?php

namespace tikiaddon\syn\organicgrp;

function groupnavloader_info()
{
	return array(
		'name' => tra('Group Navigation Loader'),
		'description' => tra('Display the Organic Group Navbar'),
		'filter' => 'text',
		'params' => array(
			'from' => array(
				'required' => false,
				'name' => tra('Where it is placed'),
				'description' => tra('This is used to set the current page to highlight the current button'),
				'filter' => 'text',
			),
		),
	);

}


function groupnavloader($data, $params)
{
	if (!isset($params['from'])) {
		return 'Please specify parameter: from';
	}

	$navapi = new \TikiAddons_Api_NavBar;
	$navbar = $navapi->getNavBar('syn_organicgrp', $params['from']);

	return $navbar;
}
