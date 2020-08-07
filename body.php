
   <div class="main main-raised">
        <div class="container mainn-raised" style="width:100%;">
  
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
   
   

    <!-- Обертка для слайдов -->
    <div class="carousel-inner">

      <div class="item active">
        <img src="img/banner1.jpg" alt="Баннер1" style="width:100%;">
        
      </div>

      <div class="item">
        <img src="img/banner2.jpg" alt="Баннер2" style="width:100%;">
        
      </div>
    
      <div class="item">
        <img src="img/banner3.jpg" alt="Баннер3" style="width:100%;">
        
      </div>
  
    </div>

    <!-- Стрелки  -->
    <a class="left carousel-control _26sdfg" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only" >Предыдущие</span>
    </a>
    <a class="right carousel-control _26sdfg" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Следующие</span>
    </a>
  </div>
</div>
     


		<!-- SECTION -->
		<div class="section mainn mainn-raised">
		
		
			<!-- container -->
			<div class="container">
			
				<!-- row -->
				<div class="row">
					<!-- коллекция -->
					<div class="col-md-4 col-xs-6">
						<a href="product.php?p=35"><div class="shop">
							<div class="shop-img">
								<img src="./img/shop01.png" alt="">
							</div>
							<div class="shop-body">
								<h3>Коллекция<br>Ноутбуков</h3>
								<a href="product.php?p=35" class="cta-btn">Начать покупки <i class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div></a>
					</div>
					<!-- /коллекция -->

					<!-- коллекция -->
					<div class="col-md-4 col-xs-6">
						<a href="product.php?p=12"><div class="shop">
							<div class="shop-img">
								<img src="./img/shop03.jpg" alt="">
							</div>
							<div class="shop-body">
								<h3>Коллекция<br>Телефонов</h3>
								<a href="product.php?p=12" class="cta-btn">Начать покупки <i class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div></a>
					</div>
					<!-- /коллекция -->

					<!-- коллекция -->
					<div class="col-md-4 col-xs-6">
						<a href="product.php?p=65"><div class="shop">
							<div class="shop-img">
								<img src="./img/shop02.png" alt="">
							</div>
							<div class="shop-body">
								<h3>Коллекция<br>Камер</h3>
								<a href="product.php?p=65" class="cta-btn">Начать покупки <i class="fa fa-arrow-circle-right"></i></a>
							</div>
                            </div></a>
					</div>
					<!-- /коллекция -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->
		  
		

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<!-- section title -->
					<div class="col-md-12">
						<div class="section-title">
							<h3 class="title">Новые товары</h3>
							
						</div>
					</div>
					<!-- /section title -->

					<!--Табы -->
					<div class="col-md-12 mainn mainn-raised">
						<div class="row">
							<div class="products-tabs">
								<!-- tab -->
								<div id="tab1" class="tab-pane active">
									<div class="products-slick" data-nav="#slick-nav-1" >
									
									<?php
                    include 'db.php';
								
                    
					$product_query = "SELECT * FROM products,categories WHERE product_cat=cat_id AND product_id BETWEEN 60 AND 80";
                $run_query = mysqli_query($con,$product_query);
                if(mysqli_num_rows($run_query) > 0){

                    while($row = mysqli_fetch_array($run_query)){
                        $pro_id    = $row['product_id'];
                        $pro_cat   = $row['product_cat'];
                        $pro_brand = $row['product_brand'];
                        $pro_title = $row['product_title'];
                        $pro_price = $row['product_price'];
                        $pro_image = $row['product_image'];

                        $cat_name = $row["cat_title"];

                        echo "
				
                        
                                
								<div class='product'>
									<a href='product.php?p=$pro_id'><div class='product-img'>
										<img src='product_images/$pro_image' style='max-height: 170px;' alt=''>
									
									</div></a>
									<div class='product-body'>
										<p class='product-category'>$cat_name</p>
										<h3 class='product-name header-cart-item-name'><a href='product.php?p=$pro_id'>$pro_title</a></h3>
										<h4 class='product-price header-cart-item-info'>$pro_price ₽</h4>
										<div class='product-rating'>
											<i class='fa fa-star'></i>
											<i class='fa fa-star'></i>
											<i class='fa fa-star'></i>
											<i class='fa fa-star'></i>
											
										</div>
										
									</div>
									<div class='add-to-cart'>
										<button pid='$pro_id' id='product' class='add-to-cart-btn block2-btn-towishlist' href='#'><i class='fa fa-shopping-cart'></i> Добавить в корзину</button>
									</div>
								</div>
                               
							
                        
			";
		}
        ;
}
?>

									</div>
									<div id="slick-nav-1" class="products-slick-nav"></div>
								</div>
								<!-- /tab -->
							</div>
						</div>
					</div>
					<!-- Табы -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

		<!-- Секция скидок -->
		<div id="hot-deal" class="section mainn mainn-raised">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<div class="hot-deal">
							<ul class="hot-deal-countdown">
								<li>
									<div>
										<h3>02</h3>
										<span>Дня</span>
									</div>
								</li>
								<li>
									<div>
										<h3>10</h3>
										<span>Часов</span>
									</div>
								</li>
								<li>
									<div>
										<h3>34</h3>
										<span>Минуты</span>
									</div>
								</li>
								<li>
									<div>
										<h3>60</h3>
										<span>Секунд</span>
									</div>
								</li>
							</ul>
							<h2 class="text-uppercase">Скидки на этой неделе</h2>
							<p>На новую коллекцию скидка 20% </p>
							<a class="primary-btn cta-btn" href="store.php">Начать покупки</a>
						</div>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /Секция скидок -->
		

		

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				

			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->
</div>
		