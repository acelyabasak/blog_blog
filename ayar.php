<?php !defined("index") ? die("hacking ?") : null; ?>
<?php
try {
  $db = new PDO("mysql:host=localhost;dbname=blog;charset=utf8;","root","");
} catch (PDOException $hata) {
  echo $hata ->getMessage();
}

 ?>
