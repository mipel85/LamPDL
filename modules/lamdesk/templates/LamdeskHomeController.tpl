<span class="version">Version : {VERSION}</span>
<div id="menu">
    # INCLUDE MENU #
</div>
<!-- statistiques clubs -->
<div class="page_accueil">
    <table> 
        <thead>
            <tr><th colspan="3">Clubs</th></tr>
        </thead>
        <tbody>
            <tr>
                <td class="nb_clubs">Nb. clubs FFAM</td>
                <td>{NB_CLUBS_FFAM}</td><td><a href="{PATH_TO_ROOT}/lamdesk/clubs/">Détails</a></td>
            </tr>
            <tr>
                <td>Nb. clubs inscrits</td>
                <td>{NB_CLUBS_INSCRITS}</td>
                <td>{RATIO} inscrits</td>
            </tr>
        </tbody>
    </table>

    <!-- statistiques manifestations -->
    <table>
        <thead>
            <tr><th colspan="3">Manifestations</th></tr>
        </thead>
        <tbody>
            <tr>
                <td class="nb_clubs">Nb. de manifestations inscrites</td>
                <td>{NB_CLUBS_MANIFS}</td><td><a href="{PATH_TO_ROOT}/planning/">Détails</a></td>
            </tr>
            <tr>
                <td>Nb. clubs organisateurs</td>
                <td>{NB_CLUBS_MANIFS}</td>
            </tr>
        </tbody>
    </table>

    <!-- statistiques demandes financières -->
    <table>
        <thead>
            <tr><th colspan="3">Demandes d'aides</th></tr>
        </thead>
        <tbody>
            <tr>
                <td class="nb_clubs">Nb. de demandes</td>
                <td>??</td><td><a href="{PATH_TO_ROOT}/financial/">Détails</a></td>
            </tr>
            <tr>
                <td>Nb. clubs demandeurs</td>
                <td>??</td>
            </tr>
            <tr>
                <td>Montant prévu</td>
                <td>€</td>
            </tr>
            <tr>
                <td>Montant réglé</td>
                <td>€</td>
            </tr>
        </tbody>
    </table>
</div>