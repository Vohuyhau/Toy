<?php
$conn = pg_connect("postgres://wlaxhiltngjyzc:ffe23ff76ec1096bb86651b0def2766b2e568a74abc2d93601f8cd472e8b6f61@ec2-54-163-34-107.compute-1.amazonaws.com:5432/df039t92csr1lt");
	echo 'Connected Successfully!!!';
	if(!$conn)
	{
		die("Could not connect to database");
    }
    ?>