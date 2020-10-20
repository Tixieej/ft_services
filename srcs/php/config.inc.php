<?php
declare(strict_types=1);

$cfg['blowfish_secret'] = 'sOX.4o0buhv6EPRqE/FIuNRc4gt]4.pE';

$i = 1;

/**
 * First server
 */
/* Authentication type */
$cfg['Servers'][$i]['auth_type'] = 'cookie';
/* Server parameters */
$cfg['Servers'][$i]['host'] = 'mysql';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = false;

$cfg['Servers'][$i]['port'] = '3306';
$cfg['Servers'][$i]['user'] = 'mysql';
$cfg['Servers'][$i]['password'] = 'mysql';

$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';
/*haal dit weg als er iets niet goed gaat, of als dit niks helpt bij reverse proxy:*/
#$cfg['PmaAbsoluteUri'] = 'https://192.168.99.220/phpmyadmin/';
