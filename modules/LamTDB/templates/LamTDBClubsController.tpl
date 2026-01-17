<div id="clubs-manager">
    <span><h1>Informations sur les clubs</h1></span>
    <br>
    
    <table class="manage-clubs">
        <thead>
            <tr>
                <td><span><b><i>Clubs inscrits : {NB_CLUBS_INSCRITS}/{NB_CLUBS}</i></b></span></td><td></td><td></td><th colspan='2'>Profil</th>
            </tr>
            <tr>
                <th>Membre inscrit</th><th>Email</th><th>Club</th><td>Dirigeant</td><td>Ligue{COUNT_LIGUE}</td>
            </tr>
            <tr>
            # START clubs #
                <td class="align-left">{clubs.CLUB_USER}</td><td class="align-left">{clubs.USER_EMAIL}</td><td class="align-left">{clubs.CLUB_NAME}</td><td>{clubs.PROFIL_DIRIGEANT}</td><td>{clubs.PROFIL_LIGUE}</td>
            </tr>
            {clubs.FFAM}
            # END clubs #
        </thead>
    </table>
</div>