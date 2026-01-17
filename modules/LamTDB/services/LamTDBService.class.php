<?php
/**
 * @copyright   &copy; 2005-2024 PHPBoost
 * @license     https://www.gnu.org/licenses/gpl-3.0.html GNU/GPL-3.0
 * @author      mipel <mipel@phpboost.com>
 * @version     PHPBoost 6.0 - last update: 2024 12 22
 * @since       PHPBoost 6.0 - 2024 12 22
 */

class LamTDBService
{
    private static $db_querier;
    public static function __static()
    {
        self::$db_querier = PersistenceContext::get_querier();
    }
    public static function get_registred_clubs()
    {

        $req = self::$db_querier->select('SELECT f_votre_nom, f_votre_club 
		FROM ' . DB_TABLE_MEMBER . ' m
        LEFT JOIN ' . DB_TABLE_MEMBER_EXTENDED_FIELDS . ' me ON m.user_id = me.user_id 
        ');
        
        while($row = $req->fetch())
        {
            foreach ($row as $member)
            {
                Debug::dump($row);
                $data[] = $member;
            }
                return $data[0] . ' club : ' . $data[1];
        }
        $req->dispose();
    }
}
?>