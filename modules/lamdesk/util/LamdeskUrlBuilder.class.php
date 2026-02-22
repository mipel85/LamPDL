<?php
/**
 * @copyright   &copy; 2005-2024 PHPBoost
 * @license     https://www.gnu.org/licenses/gpl-3.0.html GNU/GPL-3.0
 * @author      mipel <mipel@phpboost.com>
 * @version     PHPBoost 6.0 - last update: 2024 12 22
 * @since       PHPBoost 6.0 - 2024 12 22
 */

class LamdeskUrlBuilder
{
    private static $dispatcher = '/lamdesk';
    
    
    public static function clubs()
    {
        return DispatchManager::get_url(self::$dispatcher, '/clubs/');
    }
    
    public static function clubs_ajax()
    {
        return DispatchManager::get_url(self::$dispatcher, '/clubs_ajax/');
    }
    
    public static function dates()
    {
        return DispatchManager::get_url(self::$dispatcher, '/dates/');
    }
    
    public static function home()
    {
        return DispatchManager::get_url(self::$dispatcher, '/home/');
    }
    
}
?>
