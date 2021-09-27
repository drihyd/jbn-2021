<?php

defined('BASEPATH') OR exit('No direct script access allowed');



# ----------------------------------------------------------------------

# CONFIG ARRAYS

# ----------------------------------------------------------------------



# REGISTER MODULES:

$this->modules_register = array(

	

	'main', // the app	

	'people',

	'clients',

	'projects',

	'tasks',

	'campaigns',

	

);





# ROLE PRIVILEGE MAP

$this->role_privilege_map = array(

	

	'default' 	=> 1,

	'ceo' 		=> 3,

	'pmo' 		=> 3,

	'coo' 		=> 3,

	

);





# MODULE <-> ROLE PRIVILEGE MAP

$this->module_privilege_map = array(

	

	'people' => array(

		

		'default' 	=> 1,

		'hr' 		=> 3,

		

	),

	

	'clients' => array(

		

		'default' 	=> 1,

		'srt' 		=> 3,

		'am' 		=> 3,

	

	),

	

	'projects' => array(

		

		'default' 	=> 1,

		'srt' 		=> 3,

	

	),

	

	'campaigns' => array(

		

		'default' 	=> 0,

		'srt' 		=> 3,

		

	),

	

);





# MAIN MENU

$this->main_menu = array(

	

	/*

	

	FORMAT:

	

	'link_text' => array(

		'url' => 'link_url',

		'module' => 'module_name',

		'min_privilege' => number,

	),

	

	*/

	

	'people' => array(

		'text' 				=> 'team',

		'id' 				=> 'team',

		'url' 				=> 'team/all',

		'module' 			=> 'team',

		'min_privilege' 	=> 3,

	),

	

	'clients' => array(

		'text' 				=> 'clients',

		'id' 				=> 'clients',

		'url' 				=> 'clients',

		'module' 			=> 'clients',

		'min_privilege' 	=> 1,

	),

	

	'projects' => array(

		'text' 				=> 'projects',

		'id' 				=> 'projects',

		'url' 				=> 'orders',

		'module' 			=> 'projects',

		'min_privilege' 	=> 3,

	),

	

	'tasks' => array(

		'text' 				=> 'tasks',

		'id' 				=> 'tasks',

		'url' 				=> 'tasks/all',

		'module' 			=> 'tasks',

		'min_privilege' 	=> 3,

	),

	

	'campaigns' => array(

		'text' 				=> 'campaigns',

		'id' 				=> 'campaigns',

		'url' 				=> 'campaigns/dashboard',

		'module' 			=> 'campaigns',

		'min_privilege' 	=> 3,

	),

	

);



# REGISTER MODULE MENUS

$this->module_menus = array(

	

	'main' => array(

		

		'dashboard' => array(

			

			'text' => 'dashboard',

			'id' => 'dashboard',

			'url' => 'home',

			'min_privilege' => 1,

			

		),

		

		'my_tasks' => array(

			

			'text' => 'my tasks',

			'id' => 'mytasks',

			'url' => 'tasks/my',

			'min_privilege' => 3,

		),

		

		'my_profile' => array(

			

			'text' => 'my profile',

			'id' => 'myprofile',

			'url' => 'user/profile',

			'min_privilege' => 1,

		),

		

		'salary_slips' => array(

			

			'text' => 'salary slips',

			'id' => 'salaryslips',

			'url' => 'user/salary_slips',

			'min_privilege' => 3,

		),

	

	),

	

	'clients' => array(

		

		'all' => array(

			

			'text' => 'all projects',

			'id' => 'all-projects',

			'url' => 'projects',

			'min_privilege' => 3,

			

		),



			

		'clients' => array(			

			'text' => 'Clients',

			'id' => 'project-performance-reports',

			'url' => 'clients/',

			'min_privilege' => 1,

		),

				

		'logout' => array(

			

			'text' => 'Logout',

			'id' => 'logout',

			'url' =>'logout',

			'min_privilege' => 1,

		),

	

	),

	

);

