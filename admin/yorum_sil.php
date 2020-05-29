<?php
$id = $_GET["id"];
?>
<div class="admin-icerik-sag">
			<h2>Yorum Sil</h2>
			<div class="konular">
			<?php
			$v = $db->prepare("delete from yorumlar where yorum_id=?");
			$sil = $v->execute(array($id));
			if($sil){

				echo '<div class="basarili2">Yorum basarıyla silindi yonlendiriliyorsunuz..</div>';
				header("refresh: 2; url=./?do=yorumlar");
			}
      else {

				echo '<div class="hata">Yorum silinirken bir hata olustu</div>';
			}
			?>
			</div>
			</div>
