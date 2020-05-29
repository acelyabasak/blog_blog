<?php session_start(); ?>
<?php include("ayar.php"); ?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/admin.css">
    <title>DarkSwan Admin</title>
  </head>
  <body>
    <?php
    if($_SESSION){
      if($_SESSION["rutbe"] == 1){
        ?>
        <div class="admin-genel">
          <div class="admin-header">
            <h2><a href="./">DarkSwan <span style="color:red;">Admin Paneli</span></a>
              <span style="float:right;margin-right:30px;"><a href="../index.php">Siteyi Görüntüle</a> </span>
            </h2>
            <div class="uye">
              <span>Admin paneline hoş geldiniz : <?php echo $_SESSION["uye"];?></span>
            </div>
            <div class="admin-icerik">
              <div class="admin-menu">
                <ul>
                  <li><a href="./">Anasayfa</a></li>
                  <li><a href="./?do=konular">Konular</a></li>
                  <li><a href="./?do=uyeler">Üyeler</a></li>
                  <li><a href="./?do=yorumlar">Yorumlar</a></li>
                  <li><a href="./?do=kategoriler">Kategoriler</a></li>
                  <li><a href="./?do=sabit_sayfalar">Sabit Sayfalar</a></li>
                  <li><a href="./?do=cikis">Çıkış</a></li>
                </ul>
              </div>
              <?php
              $do = @$_GET["do"];
              if(file_exists("{$do}.php")){
                include("{$do}.php");
              }
              else {
                include("anasayfa.php");
              }

               ?>
            </div>
          </div>
        </div>

        <?php
      }
      else {
        echo '<div class="hata">Admin panelinde yetkiniz bulunmuyor.</div>';
      }
    }
    else {
      echo '<div class="hata">Admin paneline girmek için üye girişi yapmalısınız.</div>';
    }


     ?>
  </body>
</html>
