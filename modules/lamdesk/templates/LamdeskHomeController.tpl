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
                <td class="nb_clubs">Clubs source FFAM</td>
                <td>{NB_CLUBS_FFAM}</td><td><a href="{PATH_TO_ROOT}/lamdesk/clubs/">Détails</a></td>
            </tr>
            <tr>
                <td>Clubs inscrits sur le site</td>
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
            <tr>
                <td>Clubs organisateurs</td>
                <td>{NB_CLUBS_ID}</td>
            </tr>
                <td class="nb_clubs">Prévues à ce jour</td>
                <td>{NB_CLUBS_EVENTS}</td><td><a href="{PATH_TO_ROOT}/planning/">Détails</a></td>
            </tr>
            <tr>---</tr>
            <tr>
            <tr><th colspan="3">** Manifestations par département **</th></tr>
                <td>44 - Loire Atlantique</td>
                <td>{NB_44}</td>
            </tr>
            <tr>
                <td>49 - Maine et Loire</td><td>{NB_49}</td>
            </tr>
            <tr>
                <td>53 - Mayenne</td><td>{NB_53}</td>
            </tr>
            <tr>
                <td>72 - Sarthe</td><td>{NB_72}</td>
            </tr>
            <tr>
                <td>85 - Vendée</td><td>{NB_85}</td>
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