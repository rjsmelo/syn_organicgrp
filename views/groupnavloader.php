<?php

namespace tikiaddon\syn\organicgrp;

function groupnavloader($data, $params)
{
	if (!isset($params['from'])) {
		return 'Please specify parameter: from';
	}

	$app = \TikiAddons::get('syn_organicgrp');
	$api = new \TikiAddons_Api_Group;

	if (!isset($_REQUEST['organicgroup']) && !empty($_REQUEST['page'])) {
		$info = $api->getOrganicGroupInfoForItem('wiki page', $_REQUEST['page']);
		$cat = $info['cat'];
		$ogid = $info['organicgroup'];
		$app->smarty->assign('groupTrackerItemId', $ogid);
		$_REQUEST['organicgroup'] = $ogid;
		if (!isset($_REQUEST['cat'])) {
			$_REQUEST['cat'] = $cat;
		}
	} 

	if (!isset($_REQUEST['organicgroup']) && !empty($_REQUEST['itemId'])) {
		$info = $api->getOrganicGroupInfoForItem('trackeritem', $_REQUEST['itemId']);
		$cat = $info['cat'];
		$ogid = $info['organicgroup'];
		$app->smarty->assign('groupTrackerItemId', $ogid);
		$_REQUEST['organicgroup'] = $ogid;
		if (!isset($_REQUEST['cat'])) {
			$_REQUEST['cat'] = $cat;
		}
	}

	if (!empty($_REQUEST['organicgroup']) && empty($_REQUEST['cat'])) {
		$ogname = 'syn_organicgrp_' . $_REQUEST['organicgroup'];
		$cat = \TikiLib::lib('categ')->get_category_id($ogname);
		$_REQUEST['cat'] = $cat;
	}

	// if og is private, always redirect to home page
	if (isset($_REQUEST['organicgroup'])) {
		$ogname = 'syn_organicgrp_' . $_REQUEST['organicgroup'];
		global $user;
		if ($_REQUEST['page'] != 'syn_organicgrp_grouphomepage' && $api->organicGroupIsPrivate($ogname) && !\TikiLib::lib('user')->user_is_in_group($user, $ogname)) {
			header( 'Location: tiki-index.php?page=syn_organicgrp_grouphomepage&itemId=' . $_REQUEST['organicgroup']);
		}
	}

	$userlib = \TikiLib::lib('user');
	$approvalCount = $userlib->nb_users_in_group("syn_organicgrp_pending_". $_REQUEST['organicgroup']); //get the number of pending users
	$app->smarty->assign('approvalcount', $approvalCount);
	$app->smarty->assign('groupnavfrom', $params['from']);
	return $app->smarty->fetch('syn-groupnavloader.tpl');
}
