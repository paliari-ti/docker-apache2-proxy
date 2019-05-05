<?php
header('X-Custom-Header: Value custom');
?>
<div>APP_NAME:</div>
<h1><?= $_ENV['APP_NAME']; ?></h1>
<hr>
<pre>
    <?php
    if ($cert = $_SERVER['HTTP_X_SSL_CLIENT_CERT']) {
        $begin = '-----BEGIN CERTIFICATE-----';
        $end   = '-----END CERTIFICATE-----';

        $cert = str_replace([$begin, $end, "\n"], '', $cert);
        $cert = str_replace(["\r\n", "\n", "\r", "\t", ' '], '', $cert);
        $cert = wordwrap($cert, 64, "\n", true);
        $cert = rtrim($cert);
        $cert = implode("\n", [$begin, $cert, $end, '']);

        echo "\n$cert\n";
        echo str_repeat('-', 100);
        echo "\n";
    }
    echo "HEADERS:\n";
    var_export(apache_request_headers());
    echo "\n";
    echo str_repeat('-', 100);
    echo "\nSERVER:\n";
    var_export($_SERVER);
    ?>
</pre>
