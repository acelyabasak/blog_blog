<link rel="stylesheet" href="css/styles.css">
<?php
if($_POST){
  $name = trim($_POST["name"]);
  $sifre = trim(md5($_POST["sifre"]));
  if(!$name || !$sifre){
    echo '<div class="hata">kullanıcı adı ve şifre boş bırakılamaz </div>';
  }
  else {
    $uye = $db->prepare("select * from uyeler where uye_adi=? and uye_sifre=? and uye_onay=?");
    $uye->execute(array($name,$sifre,1));
    $z = $uye->fetch(PDO::FETCH_ASSOC);
    $x = $uye->rowCount();

    if($x){
      $_SESSION["uye"] = $z["uye_adi"];
      $_SESSION["eposta"] = $z["uye_eposta"];
      $_SESSION["rutbe"] = $z["uye_rutbe"];
      $_SESSION["id"] = $z["uye_id"];

      header("location:index.php");
    }
    elseif ($z["uye_onay"] == 0) {
        echo '<div class="hata">Üyeliğiniz onaylanmadı bekleyin </div>';
    }
    else {
      echo '<div class="hata">uye adı yada şifreniz yanlış </div>';
    }
  }
}
 ?>
