<?php

/**
 * @copyright   &copy; 2005-2024 PHPBoost
 * @license     https://www.gnu.org/licenses/gpl-3.0.html GNU/GPL-3.0
 * @author      mipel <mipel@phpboost.com>
 * @version     PHPBoost 6.0 - last update: 2024 12 22
 * @since       PHPBoost 6.0 - 2024 12 22
 */
class LamTDBClubsController extends DefaultModuleController {

    protected function get_template_to_use() {
        return new FileTemplate('LamTDB/LamTDBClubsController.tpl');
    }

    public function execute(HTTPRequestCustom $request) {
        $this->build_view($request);
        return $this->generate_response();
    }

    public function build_view(HTTPRequestCustom $request) {

        $clubs_members = PersistenceContext::get_querier()->select('SELECT * FROM ' . DB_TABLE_MEMBER . ' member
        LEFT JOIN ' . DB_TABLE_MEMBER_EXTENDED_FIELDS . ' memext ON member.user_id = memext.user_id
        ORDER BY memext.f_votre_club
        ');

        while ($row = $clubs_members->fetch()) {
        Debug::dump($row);
            $clubs_inscrits[] = $row['f_votre_club'];
            $clubs_inscrits = array_unique($clubs_inscrits);
            $this->view->put('NB_CLUBS_INSCRITS', count($clubs_inscrits));

            $this->view->assign_block_vars('clubs', array(
                'CLUB_USER'         => $row['display_name'],
                'USER_EMAIL'        => $row['email'],
                'CLUB_NAME'         => $row['f_votre_club'],
                'PROFIL_DIRIGEANT'  => ($row['f_dirigeant_de_club'] == 'Oui') ? '<img src="../templates/images/icons8-ok-16.png" alt="OK" />' : '<img src="../templates/images/icons8-no-16.png" alt="NO" />',
                'PROFIL_LIGUE'      => ($row['user_groups'] == '1|2' OR $row['user_groups'] == '2' ) ? '<img src="../templates/images/icons8-ok-16.png" alt="OK" />' : '<img src="../templates/images/icons8-no-16.png" alt="NO" />',
                
            ));
        }
        $req_clubs = PersistenceContext::get_querier()->select('SELECT `ffam_nb` FROM ' . PREFIX . 'lamclubs');
        $this->view->put('NB_CLUBS', $req_clubs->get_rows_count());
        
        return $this->view;
    }

    private function generate_response() {
        $response = new SiteDisplayResponse($this->view);
        $graphical_environment = $response->get_graphical_environment();
        $graphical_environment->set_page_title($this->lang['lamtdb.module.title'], $this->lang['common.home']);
        $graphical_environment->get_seo_meta_data()->set_canonical_url(LamTDBUrlBuilder::home());

        $breadcrumb = $graphical_environment->get_breadcrumb();
        $breadcrumb->add($this->lang['lamtdb.module.title'], LamTDBUrlBuilder::home());

        return $response;
    }
}

?>
