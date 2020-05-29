<div class="admin-icerik-sag">
			<h2>Admin Paneli Anasayfa</h2>
		<?php
		$onayla = $_POST["onayla"];
		$a = implode(",",$onayla);
		  $toplu = $db->query("update yorumlar set yorum_onay=1  where yorum_id in($a)");
		  if($toplu){
			  echo '<div class="basarili2">Seçilen yorumlar basarıyla guncellendi...</div>';
			  header("refresh: 2; url=./?do=yorumlar");
		  }
      else{
			 echo '<div class="hata">Secilen yorumlar onaylanırken bir hata olustu..</div>';
		  }
         ?>
			</div>
