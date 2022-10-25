<?php
$conn = pg_connect("postgres:/postgres://xmfofeivszkrvv:ebf8d45355aa26e68f9754891d01b5520c18e01e67663438d5c847a783d3c583@ec2-54-82-205-3.compute-1.amazonaws.com:5432/d58novbg242gae
");
	echo 'Connected Successfully!!!';
	if(!$conn)
	{
		die("Could not connect to database");
    }
    ?>