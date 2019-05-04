<?php
header('X-Custom-Header: Value custom');
?>
<div>APP_NAME:</div>
<h1><?= $_ENV['APP_NAME']; ?></h1>
<hr>
<pre>
    <?
    $cert = $_SERVER['HTTP_X_SSL_CLIENT_CERT'];
    $a = explode(' ', $cert);
    echo "$cert\n";
    echo "\n";
    $cert = implode("\n", $a);
    var_export($cert);
    echo "\n";
    echo str_repeat('-', 100);
    echo "\n";
    var_export(apache_request_headers());
    echo "\n";
    echo str_repeat('-', 100);
    echo "\n";
    var_export($_SERVER);
    ?>
</pre>
