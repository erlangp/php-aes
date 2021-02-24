<?php

function _encrypt($plaintext, $password)
{
    $method = "AES-256-CBC";
    $key = hash('sha256', $password, true);
    $iv = openssl_random_pseudo_bytes(16);

    $ciphertext = openssl_encrypt($plaintext, $method, $key, OPENSSL_RAW_DATA, $iv);
    $hash = hash_hmac('sha256', $ciphertext . $iv, $key, true);

    return urlencode(base64_encode($iv . $hash . $ciphertext));
}

function _decrypt($ivHashCiphertext, $password)
{
    $ivHashCiphertext = base64_decode(urldecode($ivHashCiphertext));

    $method = "AES-256-CBC";
    $iv = substr($ivHashCiphertext, 0, 16);
    $hash = substr($ivHashCiphertext, 16, 32);
    $ciphertext = substr($ivHashCiphertext, 48);
    $key = hash('sha256', $password, true);

    if (!hash_equals(hash_hmac('sha256', $ciphertext . $iv, $key, true), $hash)) return null;

    return openssl_decrypt($ciphertext, $method, $key, OPENSSL_RAW_DATA, $iv);
}

function _generate($pass, $str)
{
    echo 'Encrypted: ';
    // echo $encrypted = _encrypt('<?php echo "<h1>Hello World!</h1>\n"; ', $pass);
    // echo $encrypted = _encrypt('<?php phpinfo(); ', $pass);
    echo $encrypted = _encrypt($str, $pass);
    echo PHP_EOL;
    echo 'Decrypted: ';
    echo $decrypted = _decrypt($encrypted, $pass);
    echo PHP_EOL;
}

function _run($str)
{
    eval('?>' . _decrypt($str, 'password') . '<?php;');
}
