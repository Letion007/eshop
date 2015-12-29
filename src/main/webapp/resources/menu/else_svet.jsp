<!-- Это еще светотехника -->
			
<?              $result = mysql_query("SELECT * FROM tovar, else_svet WHERE else_svet.id_tovar_main='$id_tovar_else' AND else_svet.id_tovar_dop=tovar.id_tovar AND tovar.id_url!='$id_url'  AND tovar.stop='1' LIMIT 0,4");
	 			if ($myrow=mysql_fetch_array($result)){
				//выбор фото	  
				$id_tovar=$myrow["id_tovar"];	  
				$result_img = mysql_query("SELECT * FROM img_tovar WHERE  id_tovar='$id_tovar'");
				$myrow_img=mysql_fetch_array($result_img);	
				//формирование блока	товаров  
				$block_tovar2="<div class='row'><h2>Еще светотехника для автомобилей</h2>";
				$block_tovar2.="
				<div class='col-sm-3 col-lg-3 col-md-3'>
					<a href='".$myrow["id_url"].".html'><img class='else_image' src='img/".$myrow_img["img1"]."'></a>
					<span class='else_ccilka'><a href='".$myrow["id_url"].".html'>".$myrow["name_tovar"]."</a></span>
					<span class='else_proizvoditel'>".$myrow["zavod"]."</span>
					<span class='else_zena'><span>".$myrow["price"]."</span> грн</span>
				</div>";
				while ($myrow=mysql_fetch_array($result)){
				//выбор фото	  
				$id_tovar=$myrow["id_tovar"];	  
				$result_img = mysql_query("SELECT * FROM img_tovar WHERE  id_tovar='$id_tovar'");
				$myrow_img=mysql_fetch_array($result_img);	
				//формирование блока	товаров  
				$block_tovar2.="
				<div class='col-sm-3 col-lg-3 col-md-3'>
					<a href='".$myrow["id_url"].".html'><img class='else_image' src='img/".$myrow_img["img1"]."'></a>
					<span class='else_ccilka'><a href='".$myrow["id_url"].".html'>".$myrow["name_tovar"]."</a></span>
					<span class='else_proizvoditel'> ".$myrow["zavod"]."</span>
					<span class='else_zena'><span>".$myrow["price"]."</span> грн</span>
				</div>";
				}
				$block_tovar2.="</div>";
				}
				echo $block_tovar2;
?>			
			