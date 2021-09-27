<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/*!
* HybridAuth
* http://hybridauth.sourceforge.net | http://github.com/hybridauth/hybridauth
* (c) 2009-2012, HybridAuth authors | http://hybridauth.sourceforge.net/licenses.html
*/

// ----------------------------------------------------------------------------------------
//	HybridAuth Config file: http://hybridauth.sourceforge.net/userguide/Configuration.html
// ----------------------------------------------------------------------------------------

$config =
	array(
		// set on "base_url" the relative url that point to HybridAuth Endpoint
		'base_url' => '/userLogin/endpoint',

		"providers" => array (
			// openid providers
			"OpenID" => array (
				"enabled" => false
			),

			"Yahoo" => array (
				"enabled" => false,
				"keys"    => array ( "id" => "", "secret" => "" ),
			),

			"AOL"  => array (
				"enabled" => false
			),

			"Google" => array (
				"enabled" => true,
				"keys"    => array ( "id" => "1057040117763-v630greggn3k5ntt4dn6q632cld914v6.apps.googleusercontent.com", "secret" => "PRMlSdJuLT3TIpkyHGULm2JN" ),
			),

			"Facebook" => array (
				"enabled" => true,
				"keys"    => array ( "id" => "1910490258996186", "secret" => "fcf098d10282a065e77928189445429b" ),
				'scope'   => 'email',
                'trustForwarded' => false
			),

			"Twitter" => array (
				"enabled" => false,
				"keys"    => array ( "key" => "", "secret" => "" )
			),

			// windows live
			"Live" => array (
				"enabled" => false,
				"keys"    => array ( "id" => "", "secret" => "" )
			),

			"MySpace" => array (
				"enabled" => false,
				"keys"    => array ( "key" => "", "secret" => "" )
			),

			"LinkedIn" => array (
				"enabled" => true,
				"keys"    => array ( "key" => "", "secret" => "" )
			),

			"Foursquare" => array (
				"enabled" => false,
				"keys"    => array ( "id" => "", "secret" => "" )
			),
		),

		// if you want to enable logging, set 'debug_mode' to true  then provide a writable file by the web server on "debug_file"
		"debug_mode" => (ENVIRONMENT == 'development'),

		"debug_file" => APPPATH.'logs/hybridauth.log',
	);

	if (!file_exists(APPPATH.'logs/hybridauth.log')) {
		$my_file = APPPATH.'logs/hybridauth.log';
		$handle = fopen($my_file, 'w') or die('Cannot open file:  '.$my_file); //implicitly creates file
	}


/* End of file hybridauthlib.php */
/* Location: ./application/config/hybridauthlib.php */