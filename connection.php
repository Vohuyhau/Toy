<?php
$conn = pg_connect("postgres://eqsswfxaphixgx:79c5717c086ecfdb796105255f2a0f48e0ec8b5c2278c2e680b24bb8689abc65@ec2-54-145-139-208.compute-1.amazonaws.com:5432/d200jeu77acrei");
	echo 'Connected Successfully!!!';
	if(!$conn)
	{
		die("Could not connect to database");
    }
    ?>