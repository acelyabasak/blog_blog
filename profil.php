
<?php
if($_SESSION){
  $uye = @$_GET["uye"];
  $v = $db->prepare("select * from uyeler where uye_adi=?");
  $v->execute(array($uye));
  $m = $v->fetch(PDO::FETCH_ASSOC);
  $x = $v->rowCount();
  if($x){
    ?>
    <div class="profil">
      <h2>Profil Bölümü
<?php
if($_SESSION["uye"] == $uye){
echo'  <span style="float:right;"><a href="?do=profil_duzenle&uye='.$_SESSION["uye"].'"style="color:red;">Düzenle</a></span>';
}

 ?>

      </h2>
      <ul>
        <li><span style="font-weight:bold">Üye Adi : <?php echo $m["uye_adi"]; ?></span></li>
        <li><span style="font-weight:bold">Üye Eposta : <?php echo $m["uye_eposta"]; ?></span></li>
        <li><span style="font-weight:bold">Üye Hakkında : <?php echo $m["uye_hakkimda"]; ?></span></li>
        <li><span style="font-weight:bold">Kayıt Tarihi : <?php echo $m["uye_tarih"]; ?></span></li>
      </ul>
    </div>

    <?php
  }
  else {
    echo '<div class="hata">Böyle bir üye sistemde kayıtlı gözükmüyor</div>';
  }
}
else {
  echo '<div class="hata">üye olmadan profil bölümünü göremezsiniz </div>';
}


 ?>
