<div class="admin-icerik-sag">
<h2>Çıkıs Yap</h2>
<?php
session_destroy();
 echo '<div class="hata">Basariyla çıkıs yaptınız.. anasayfaya yonlendiriliyorsunuz...</div>';

 header("refresh: 2; url=../index.php");

?>
</div>
