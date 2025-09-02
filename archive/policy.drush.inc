<?php

function policy_drush_sitealias_alter(&$alias_record) {
    // Fix pantheon aliases!
    $d8_sites = array(
      'craft-council'
    );

    foreach ($d8_sites as $d8_site) {
      if (isset($alias_record['#name']) && strpos($alias_record['#name'], $d8_site)) {
        $alias_record['path-aliases']['%drush-script'] = 'drush';
      } elseif (isset($alias_record['remote-host']) &&
      (substr($alias_record['remote-host'],0,10) == 'appserver.')) {
        $alias_record['path-aliases']['%drush-script'] = 'drush7';
      }
    }
}
