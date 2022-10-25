<?php
$conn = pg_connect("postgres://kupukrqgfasefl:67dc47cfdf8e72ab50986f21e1954a31156356bc2a4f5635060adb40c43adcfa@ec2-52-86-115-245.compute-1.amazonaws.com:5432/dttrarmo6kits");
	echo 'Connected Successfully!!!';
	if(!$conn)
	{
		die("Could not connect to database");
    }
    ?>