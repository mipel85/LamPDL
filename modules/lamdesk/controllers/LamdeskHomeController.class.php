<?php
/**
 * @copyright   &copy; 2005-2024 PHPBoost
 * @license     https://www.gnu.org/licenses/gpl-3.0.html GNU/GPL-3.0
 * @author      mipel <mipel@phpboost.com>
 * @version     PHPBoost 6.0 - last update: 2024 12 22
 * @since       PHPBoost 6.0 - 2024 12 22
 */
class LamdeskHomeController extends DefaultModuleController
{
    private $version = '02.02.26';

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
                'VERSION'=> $this->version,
                'MENU'=> LamdeskMenu::get_menu()
        ]);
//        $this->view->put('MENU', LamdeskMenu::get_menu());

        /* table clubs */
        $nb_clubs_inscrits = LamdeskService::count_clubs_site();
//        $this->view->put('NB_CLUBS_INSCRITS', $nb_clubs_inscrits[0]);

        $nb_clubs_ffam = LamdeskService::count_clubs_ffam();
        $this->view->put('NB_CLUBS_FFAM', $nb_clubs_ffam[0]);

        $ratio = round($nb_clubs_inscrits[0] / $nb_clubs_ffam[0] * 100) . "%";
        $this->view->put('RATIO', $ratio);

        /* table manifestations */
        $nb_clubs_planning = LamdeskService::count_clubs_planning();
//      Debug::stop($nb_clubs_planning);

        $this->view->put('NB_CLUBS_MANIFS', $nb_clubs_planning[0]['planning_count']);

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
