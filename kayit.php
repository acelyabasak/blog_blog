<?php
if(!$_SESSION){
  if($_POST){
    $isim = trim($_POST["isim"]);
    $sifre = trim(md5($_POST["sifre"]));
    $email = $_POST["email"];
    $hakkimda = $_POST["hakkimda"];

    if(!$isim || !$sifre || !$email){
      echo '<div class="hata">Doldurulması gereken alanları boş geçemezsiniz.</div>';
    }
    elseif (!filter_var($email,FILTER_VALIDATE_EMAIL)) {
      echo '<div class="hata">bu mail adresi geçerli değil</div>';
    }
    else {
      $v = $db->prepare("select * from uyeler where uye_adi=?");
      $v->execute(array($isim));
      $x = $v->fetch(PDO::FETCH_ASSOC);
      $y = $v->rowCount();
      if($y){
        echo '<div class="hata"><span style="color:red;">'.$x["uye_adi"].'</span> adlı üye sistemde zaten var başka bir tane deneyin</div>';
      }
      else {
        $x = $db->prepare("insert into uyeler set
        uye_adi=?,
        uye_sifre=?,
        uye_eposta=?,
        uye_hakkimda=?");

        $kayit = $x->execute(array($isim,$sifre,$email,$hakkimda));
        if($kayit){
          echo '<div class="basarili2">başarıyla kayıt oldunuz bilgilerinizle giriş yapabilirsiniz </div>';
        }
        else {
          echo '<div class="hata">kayıt olurken bir hata oluştu tekrar deneyiniz </div>';
        }
      }
    }
  }
  else {
    ?>
    <div class="sol2">
  <h2>Kayıt Formu</h2>
  <form action="" method="post">
    <ul>
      <li>Adınız</li>
      <li><input type="text" name="isim" value=""></li>
      <li>Şifre</li>
      <li><input type="text" name="sifre"placeholder="şifrenizi girin" value=""></li>
      <li>email</li>
      <li><input type="text" name="email" value=""></li>
      <li>Hakkımda</li>
      <li><textarea name="hakkimda" rows="10" cols="50"></textarea></li>
      <li><button type="submit">Gönder</button></li>
    </ul>
  </form>
</div>


    <?php
  }
}


 ?>
