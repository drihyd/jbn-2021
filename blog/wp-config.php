<?php
define('WP_AUTO_UPDATE_CORE', 'minor');// This setting is required to make sure that WordPress updates can be properly managed in WordPress Toolkit. Remove this line if this WordPress website is not managed by WordPress Toolkit anymore.
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'jeweller_blog21' );

/** MySQL database username */
define( 'DB_USER', 'jeweller_blog21' );

/** MySQL database password */
define( 'DB_PASSWORD', 'dY(So_34#{u^' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '$GN!9q;ny=xH(8f-%]D6:C;V%3_G@J:~:7.*La1-?2HJZ>9#7Vk^[14!HF3t8uLd');
define('SECURE_AUTH_KEY',  'quWE)wI&3R?7LS>R8e@ K =:0~SM<sE D>cXqX/%Eu_3^`p.0pa_cD|fP/kr1FTS');
define('LOGGED_IN_KEY',    '`F9/?PRZZw_Vv0UlCV]%!  ^`76Upc67@7jCn#Wd^Y&^Gz[rd6rA~0lE$El</[lc');
define('NONCE_KEY',        '#$T@4,+B%<|gyp{N#NKN*@[R YHPYo-+v@v2Xlnbce<_FK~w*EEV,!nC.m|!6w#{');
define('AUTH_SALT',        '@9~qGE=b84+a(fW:eEzerq^=wi(?FM~J*8}e1.,bJ|wv])=p~|V=+w6j):HEx/%$');
define('SECURE_AUTH_SALT', 'oC|XG+S.1ePqo@=39[(rGx[W7BO0.xk?up6uQHea/o}zPGbf?GWmehAjdQW[qn> ');
define('LOGGED_IN_SALT',   'Dj*E`o+IwPIDs{TFJuZqqO=~sj~NHF[jh,E>6nwk|%#`lsU=*77XT8+-hc2-v(6C');
define('NONCE_SALT',       'N,sDLnK(VWD]{Dqa:,|08i&+BoRz6Cm0wf?F@IZ-<e*m)eM2)D-(_-4`6tSoh5c+');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
