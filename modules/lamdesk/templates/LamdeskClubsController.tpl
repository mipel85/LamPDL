# INCLUDE MENU #
<script>
    // Liste des clubs source FFAM
    jQuery(document).ready(function () {
        jQuery('td[id^="clubs_ffam_"]').click(function () {
            let clubs_ffam = jQuery(this).attr('id');
            jQuery.ajax({
                type: "POST",
                async: true,
                url: '${relative_url(LamdeskUrlBuilder::clubs_ajax())}',
                data: {
                    token: TOKEN,
                    param: clubs_ffam
                },
                dataType: "json",
                success: function (data) {
                    if (clubs_ffam.substring(11) != '00') {
                        jQuery('#liste').html('<br/><span class="title-list">Liste des clubs du département ' + clubs_ffam.substring(11) + ' (source FFAM)</span>');
                    } else {
                        jQuery('#liste').html('<br/><span class="title-list">Liste de tous les clubs (source FFAM)</span>');
                    }

                    jQuery('#liste').append('<table id="t_clubs_ffam"></table>');
                    jQuery('#t_clubs_ffam').append('<thead id="thead_clubs_ffam"></thead>');
                    jQuery('#t_clubs_ffam').append('<tbody id="tbody_clubs_ffam"></tbody>');
                    jQuery('#thead_clubs_ffam').append('<tr><th>Nom du club</th><th>N° FFAM</th><th>Site web</th></tr>');
                    jQuery.each(data, function (index, value) {
                        jQuery.each(value, function (index, nom) {
                            jQuery('#tbody_clubs_ffam').append('<tr><td>' + nom.name + '</td><td>' + nom.ffam_nb + '</td><td><a href="' + nom.website_url + '">' + nom.website_url + '</a></td></tr>');
                        });
                    });
                }
            });
        });
        // Liste des clubs inscrits sur le site
        jQuery('td[id^="clubs_site_"]').click(function () {
            let clubs_site = jQuery(this).attr('id');
            jQuery.ajax({
                type: "POST",
                async: true,
                url: '${relative_url(LamdeskUrlBuilder::clubs_ajax())}',
                data: {
                    token: TOKEN,
                    param: clubs_site
                },
                dataType: "json",
                success: function (data) {
                    if (clubs_site.substring(11) != '00') {
                        jQuery('#liste').html('<br/><span class="title-list">Liste des interlocuteurs du département ' + clubs_site.substring(11) + '</span> (il peut y avoir plusieurs inscrits pour le même club)');
                    } else {
                        jQuery('#liste').html('<br/><span class="title-list">Tous les interlocuteurs inscrits</span>');
                    }

                    jQuery('#liste').append('<table id="t_clubs_site"></table>');
                    jQuery('#t_clubs_site').append('<thead id="thead_clubs_site"></thead>');
                    jQuery('#t_clubs_site').append('<tbody id="tbody_clubs_site"></tbody>');
                    jQuery('#thead_clubs_site').append('<tr><th>Club</th><th>Interlocuteur</th><th>Dirigeant</th><th>Ligue</th></tr>');
                    jQuery.each(data, function (index, value) {
                        jQuery.each(value, function (index, nom) {
                            let dirigeant = (nom.f_dirigeant_de_club == "Oui") ? '<img class="img_center" src="/modules/lamdesk/templates/images/icons8-ok-16.png">' : '<img class="img_center" src=" /modules/lamdesk/templates/images/icons8-no-16.png">';
                            let ligue = (nom.user_groups == "1|2" || nom.user_groups == "2") ? '<img class="img_center" src=" /modules/lamdesk/templates/images/icons8-ok-16.png">' : '<img class="img_center" src=" /modules/lamdesk/templates/images/icons8-no-16.png">';
                            jQuery('#tbody_clubs_site').append('<tr><td>' + nom.f_votre_club + '</td><td>' + nom.display_name + '</td><td>' + dirigeant + '</td><td>' + ligue + '</td></tr>');
                        });
                    });
                }
            });
        });
        // demandes financières
        jQuery('td[id^="clubs_request_"]').click(function () {
            let clubs_request = jQuery(this).attr('id');
            jQuery.ajax({
                type: "POST",
                async: true,
                url: '${relative_url(LamdeskUrlBuilder::clubs_ajax())}',
                data: {
                    token: TOKEN,
                    param: clubs_request
                },
                dataType: "json",
                success: function (data) {
                    if (clubs_request.substring(11) != '00') {
                        jQuery('#liste').html('<br/><span class="title-list">Liste des interlocuteurs du département ' + clubs_request.substring(11) + '</span> (il peut y avoir plusieurs inscrits pour le même club)');
                    } else {
                        jQuery('#liste').html('<br/><span class="title-list">Liste de tous les interlocuteurs de clubs inscrits sur le site</span>');
                    }

                    jQuery('#liste').append('<table id="t_clubs_site"></table>');
                    jQuery('#t_clubs_site').append('<thead id="thead_clubs_site"></thead>');
                    jQuery('#t_clubs_site').append('<tbody id="tbody_clubs_site"></tbody>');
                    jQuery('#thead_clubs_site').append('<tr><th>Club</th><th>Interlocuteur</th><th>Groupe dirigeant</th><th>Groupe Ligue</th></tr>');
                    jQuery.each(data, function (index, value) {
                        jQuery.each(value, function (index, nom) {
                            let dirigeant = (nom.f_dirigeant_de_club == "Oui") ? '<img src=" ../templates/images/icons8-ok-16.png">' : '<img src=" ../templates/images/icons8-no-16.png">';
                            let ligue = (nom.user_groups == "1|2" || nom.user_groups == "2") ? '<img src=" ../templates/images/icons8-ok-16.png">' : '<img src=" ../templates/images/icons8-no-16.png">';
                            jQuery('#tbody_clubs_site').append('<tr><td>' + nom.f_votre_club + '</td><td>' + nom.display_name + '</td><td>' + dirigeant + '</td><td>' + ligue + '</td></tr>');
                        });
                    });
                }
            });
        });
    });

</script>

<div id="clubs">
    <table id="clubs-table">
        <caption>Tableau de bord - situation des Clubs</caption>
        <colgroup>
            <col class="col-large" />
            <col class="col-large ffam-color" />
            <col>
            <col>
            <col>
        </colgroup>
        <thead class="clubs-thead">
            <tr><th>Département</th><td>Inscrits FFAM</td><td>Inscrits site</td><td>Manifestations prévues</td><td>Demandes financières</td></tr>
        </thead>
        <tbody class="clubs-tbody">
            # START clubs_ffam #
            # START clubs_site #
            # START clubs_planning #
            # START clubs_request #
            <tr>
                <td>44 - Loire Atlantique</td><td id="clubs_ffam_44" aria-label="Liste des clubs de Loire-Atlantique" class="counter-number">{clubs_ffam.FFAM_44}</td><td id="clubs_site_44">{clubs_site.SITE_44}</td><td>{clubs_planning.PLANNING_44}</td><td id="clubs_request_49">{clubs_request.REQUEST_44}</td>
            </tr>
            <tr>
                <td>49 - Maine et Loire</td><td id="clubs_ffam_49">{clubs_ffam.FFAM_49}</td><td id="clubs_site_49">{clubs_site.SITE_49}</td><td>{clubs_planning.PLANNING_49}</td><td id="clubs_request_49">{clubs_request.REQUEST_49}</td>
            </tr>
            <tr>
                <td>53 - Mayenne</td><td id="clubs_ffam_53">{clubs_ffam.FFAM_53}</td><td id="clubs_site_53">{clubs_site.SITE_53}</td><td>{clubs_planning.PLANNING_53}</td><td id="clubs_request_53">{clubs_request.REQUEST_53}</td>
            </tr>
            <tr>
                <td>72 - Sarthe</td><td id="clubs_ffam_72">{clubs_ffam.FFAM_72}</td><td id="clubs_site_72">{clubs_site.SITE_72}</td><td>{clubs_planning.PLANNING_72}</td><td id="clubs_request_72">{clubs_request.REQUEST_72}</td>
            </tr>
            <tr>
                <td>85 - Vendée</td><td id="clubs_ffam_85">{clubs_ffam.FFAM_85}</td><td id="clubs_site_85">{clubs_site.SITE_85}</td><td>{clubs_planning.PLANNING_85}</td><td id="clubs_request_85">{clubs_request.REQUEST_85}</td>
            </tr>
            <tr>
                <td>Total</td><td id="clubs_ffam_00">{clubs_ffam.FFAM_TOTAL}<span aria-label="Détails" alt="voir"></span></td><td id="clubs_site_00">{clubs_site.SITE_TOTAL}</td><td>{clubs_planning.PLANNING_TOTAL}</td><td id="clubs_request_00">{clubs_request.REQUEST_TOTAL}</td>
            </tr>
            # END clubs_site #
            # END clubs_ffam #
            # END clubs_request #
            # END clubs_planning #

        </tbody>
    </table>
</div>
<div id="liste"></div>