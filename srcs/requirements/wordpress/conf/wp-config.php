<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('MYSQL_DATA_BASE') );

/** Database username */
define( 'DB_USER', getenv('WP_ADM_USER') );

/** Database password */
define( 'DB_PASSWORD', getenv('WP_ADM_PASSWORD') );

/** Database hostname */
define( 'DB_HOST', getenv('WP_DB_HOSTNAME') );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', getenv('WP_CHARSET') );

/** The database collate type. Don't change this if in doubt.  Collate means to collect. This is the default value. Some peers dont include it*/
define( 'DB_COLLATE', '' );

define( 'WP_ALLOW_REPAIR', true );



/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'gL#]GhpI+=D|o=RGXR,b~!I,Ju8RI_yyNVVcie,.7|57H47NS7FfB+|cn6}Yz%O)');
define('SECURE_AUTH_KEY',  'R>%yvZgt^NsZp5q}.:Ft~EU&rl!ob?l:3p2NW^z$d<,O~*v=H7Wek]D|+N-x%L,(');
define('LOGGED_IN_KEY',    'Bz!~^r$!^V63|:AM]|9gCF3e?{Fp;idaRX9-.{w:`fV[8bE;3L^7d1Ad9x=8Y]2+');
define('NONCE_KEY',        '<t&-B*_R>t(YhW#E.IADm7HLTtCYOj2(2@5}E<*Hcn-.N@f`K5EuO:F/K^zim[7A');
define('AUTH_SALT',        '-|X|KHpN0Jm]Iv%6y.Y,OKgy,Yz`rbXBmUlmCbiO+sNgaR-i|Go-fYQ zfnD)y1b');
define('SECURE_AUTH_SALT', 'Wi3<|` -omUNFV<l)JR_7!k9?2|.AuT[5~xZQP -#P[oU.r=x+du]F9x9)+Bu|l<');
define('LOGGED_IN_SALT',   'w2(SAr8<ALM=OW~>Gm6W4C4H[P*q%D-6!#$$M5b}kMn0>o4qp/JXIdc2X;hK~M|S');
define('NONCE_SALT',       '!@:+9!;:_gjT7$;`YDFz-c(Hr8l=Z!F%=*7aeY0(8x4+2:(cVqzvE:[oQJ9xKOiW');

/**#@-*/

/**
 * WordPress database table prefix.
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
define( 'WP_DEBUG', true );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
?>