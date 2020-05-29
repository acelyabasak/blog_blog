<?php
$id = $_GET["id"];
?>
<div class="admin-icerik-sag">
			<h2>Kategori Sil</h2>
			<div class="konular">
			<?php
			$v = $db->prepare("delete from kategoriler where kategori_id=?");
			$sil = $v->execute(array($id));
			if($sil){

				echo '<div class="basarili2">Kategori basarıyla silindi yonlendiriliyorsunuz..</div>';
				header("refresh: 2; url=./?do=kategoriler");
			}else {
				echo '<div class="hata">Kategori silinirken bir hata olustu</div>';
			}
			?>
			</div>
			</div>
