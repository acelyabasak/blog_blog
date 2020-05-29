<?php
if($_SESSION){
  if($_POST){
    $baslik = trim($_POST["baslik"]);
    $resim = trim($_POST["resim"]);
    $kategori = $_POST["kategori"];
    $aciklama = strip_tags($_POST["aciklama"]);
    if(!$baslik || !$resim || !$aciklama){
      echo '<div class="hata">gerekli alanları doldurmanız gerek </div>';
    }
    else {
      $v = $db->prepare("select * from konular where konu_baslik=?");
      $v->execute(array($baslik));
      $x = $v->fetch(PDO::FETCH_ASSOC);
      $z = $v->rowCount();
      if($z){
        echo '<div class="hata"> '.$baslik.'böyle bir konu daha önce açılmış başka bir konu deneyin</div>';
      }
      else {
        $x = $db->prepare("insert into konular set
        konu_baslik=?,
        konu_resim=?,
        konu_kategori=?,
        konu_aciklama=?,
        konu_ekleyen=?
        ");

        $kayit = $x->execute(array($baslik,$resim,$kategori,$aciklama,$_SESSION["uye"]));
        if($kayit){
          echo '<div class="basarili2">konu başarıyla eklendi</div>';
        }
        else {
          echo '<div class="hata">konu eklerken bir hata oluştu</div>';
        }
      }
    }
  }
  else {
    ?>
    <div class="sol2">
  <h2>Konu Ekle</h2>
  <form class="" action="" method="post">
  <ul>
    <li>Başlık</li>
    <li><input type="text" name="baslik" value=""></li>
    <li>Konu Resim</li>
    <li><input type="text" name="resim"placeholder="Resim kodunu giriniz" value=""></li>
    <li>kategori</li>
    <li>
      <select id="" name="kategori">
        <?php
         $v = $db->prepare("select * from kategoriler");
         $v->execute(array());
         $x = $v->fetchALL(PDO::FETCH_ASSOC);

         foreach ($x as $m) {
           echo '<option value="'.$m["kategori_id"].'">'.$m["kategori_adi"].'</option>';
         }
         ?>
      </select>
    </li>
    <li>Konu Açıklaması</li>
    <li><textarea name="aciklama" rows="10" cols="50"></textarea></li>
    <li><button type="submit">Gönder</button></li>
  </ul>
</form>
</div>
    <?php
  }
}
else {
  echo '<div class="hata">uye olmadan konu ekleyemezsiniz</div>';
}


 ?>
