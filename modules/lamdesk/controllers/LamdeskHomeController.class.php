<?php
/**
 * @copyright   &copy; 2005-2024 PHPBoost
 * @license     https://www.gnu.org/licenses/gpl-3.0.html GNU/GPL-3.0
 * @author      mipel <mipel@phpboost.com>
 * @version     PHPBoost 6.0 - last update: 2026 02 28
 * @since       PHPBoost 6.0 - 2024 12 22
 */
class LamdeskHomeController extends DefaultModuleController
{
    private $version = '28.02.26';

    protected function get_template_to_use()
    {
        return new FileTemplate('lamdesk/LamdeskHomeController.tpl');
    }

    public function execute(HTTPRequestCustom $request)
    {
        $this->check_authorizations();

        $this->build_view($request);

        return $this->generate_response();
    }

    public function build_view(HTTPRequestCustom $request)
    {
        $this->view->put_all([
            'VERSION' => $this->version,
            'MENU'    => LamdeskMenu::get_menu()
        ]);

        /* table clubs */
        $nb_clubs_inscrits = LamdeskService::count_clubs_site();
        $nb_clubs_ffam = LamdeskService::count_clubs_ffam();
        $ratio = round($nb_clubs_inscrits[0] / $nb_clubs_ffam[0] * 100) . "%";
        $this->view->put_all([
            'NB_CLUBS_FFAM'     => $nb_clubs_ffam[0],
            'NB_CLUBS_INSCRITS' => $nb_clubs_inscrits[0],
            'RATIO'             => $ratio
        ]);

        /* table manifestations */
        $nb_clubs_planning = LamdeskService::count_event_current_year();
        $this->view->put_all([
            'NB_CLUBS_EVENTS' => $nb_clubs_planning['current_year_event'],
            'NB_CLUBS_ID'     => $nb_clubs_planning['clubs']
        ]);

        $nb_dept_activity_current_year = LamdeskService::count_activity_by_club_current_year();
        $this->view->put_all([
            'NB_44' => $nb_dept_activity_current_year[0]['nb'],
            'NB_49' => $nb_dept_activity_current_year[1]['nb'],
            'NB_53' => $nb_dept_activity_current_year[2]['nb'],
            'NB_72' => $nb_dept_activity_current_year[3]['nb'],
            'NB_85' => $nb_dept_activity_current_year[4]['nb'],
        ]);

        /* table demandes d'aides */

        return $this->view;
    }

    private function check_authorizations()
    {
        if (!LamclubsAuthorizationsService::check_authorizations()->read())
        {
            $error_controller = PHPBoostErrors::user_not_authorized();
            DispatchManager::redirect($error_controller);
        }
    }

    private function generate_response()
    {
        $response = new SiteDisplayResponse($this->view);
        $graphical_environment = $response->get_graphical_environment();
        $graphical_environment->set_page_title($this->lang['lamdesk.tdb'], $this->lang['common.home']);
        $graphical_environment->get_seo_meta_data()->set_canonical_url(LamdeskUrlBuilder::home());

        $breadcrumb = $graphical_environment->get_breadcrumb();
        $breadcrumb->add($this->lang['lamdesk.tdb'], LamdeskUrlBuilder::home());

        return $response;
    }

    public static function get_view()
    {
        $object = new self('lamdesk');
        $object->check_authorizations();
        $object->build_view(AppContext::get_request());
        return $object->view;
    }
}
?>
