<?php !defined("index") ? die("hacking ?") : null; ?>
<link rel="stylesheet" href="css/styles.css">
<?php
$id = $_GET["id"];
$konu = $db->prepare("select *from konular inner join kategoriler on kategoriler.kategori_id = konular.konu_kategori
where konu_kategori=? and konu_durum=?");
$konu->execute(array($id,1));
$x = $konu->fetchALL(PDO::FETCH_ASSOC);
$v = $konu->rowCount();

if($v){
  foreach ($x as $m) {
    $yorum = $db->prepare("select * from yorumlar where yorum_konu_id=? and yorum_onay=?");
    $yorum->execute(array($m["konu_id"],1));
    $yorum->fetchALL(PDO::FETCH_ASSOC);
    $x = $yorum->rowCount();

  ?>
  <div class="sol2">
    <h2><?php echo $m["konu_baslik"]; ?></h2>
    <div class="bilgi">kategori : <?php echo $m["kategori_adi"]; ?> yazan : <?php echo $m["konu_ekleyen"];?>
      okunma : <?php echo $m["konu_hit"]; ?> yorum : <?php echo $x; ?>
      <span style="float:right;">tarih :<?php echo $m["konu_tarih"]; ?></span></div>
      <div class="resim">
        <img src="<?php echo $m["konu_resim"]; ?>" alt="">
      </div>
      <p><?php echo substr($m["konu_aciklama"],0,300);?>...</p>
        <div class="devam">
          <a href="?do=devam&id=<?php echo $m["konu_id"]; ?>">devam</a>
        </div>
        <div style="clear:both;"></div>
  </div>

  <?php
  }
}
else {
  echo '<div class="hata">bu kategoriye ait hiç konu bulunmuyor </div>';
}

 ?>
