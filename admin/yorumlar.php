<?php

$v = $db->prepare("select * from yorumlar order by yorum_id desc limit 20");
$v->execute(array());
$k = $v->fetchALL(PDO::FETCH_ASSOC);
$x = $v->rowCount();

?>

<div class="admin-icerik-sag">
			<h2>Yorumlar </h2>
			<div class="konular">
			<table cellspacing="0" cellpadding="0">
			<thead>
			<tr>
			<th width="600">Yorumlar</th> <th width="300">Yorum Ekleyen</th>
			<th width="200">Yorum Onayları</th> <th width="250">Tarih</th>
			<th width="200">İşlemler</th>
			</tr>
			</thead>
			<?php
			 if($x){

                foreach($k as $m){
					?>
					<tbody>
					<tr>
					<td><?php echo mb_substr($m["yorum_mesaj"],0,35);?></td> <td><?php echo $m["yorum_ekleyen"];?></td>
					<td>
					<?php

					if($m["yorum_onay"] == 1){

						echo '<span style="color:green">Onaylı</span>';

					}else {

						echo '<span style="color:red">Onaylı Değil</span>';

					}

					?>

					</td>
					<td><?php echo $m["yorum_tarih"];?></td>
					<td><span style="margin-left:20px;">
					<a href="./?do=yorum_duzenle&id=<?php echo $m["yorum_id"];?>">Düzenle</a></span> <span style="margin-left:10px;"><a onclick="return confirm('Yorumu silmek istediğinize emin misiniz..')" href="./?do=yorum_sil&id=<?php echo $m["yorum_id"];?>">Sil</a></span>
					<form style="display:inline;" action="./?do=toplu_onay" method="post">
					<input type="checkbox" name="onayla[]" value="<?php echo $m["yorum_id"];?>"  />
					</td>
					</tr>
					</tbody>
					<?php


				}

			 }else {

				echo '<tr><td colspan="5"><div class="hata">Henuz hiç konu
				eklenmemis...</div></td></tr>';

			 }

			?>
			</table>
			<button type="submit">Seçilen yorumları onayla</button>
			</form>
			</div>

			</div>
