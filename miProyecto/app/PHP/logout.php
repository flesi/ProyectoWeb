<?

session_abort();

if (isset($_COOKIE['username_id'])) {
    setcookie('username_id','',time()- 3600, '/');
}

?>