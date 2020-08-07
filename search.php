<?php
include 'header.php';
?>
  <div class="main main-raised"> 
        
        <div class="section">
           <!-- container -->
           <div class="container">
              <!-- row -->
              <div class="row">
                
  
                 <!-- STORE -->
                 <div id="store" class="col-md-9">
                   
                    <!-- store products -->
                    <div class="row" id="product-row">
                    <div class="col-md-12 col-xs-12" id="product_msg">
                 </div>
                       <!-- product -->
                       <div>
                       <?php
$search_q=$_POST['search_q'];
$search_q = trim($search_q);
$search_q = strip_tags($search_q);
$product_query= "SELECT * FROM products, categories WHERE product_cat=cat_id AND product_title LIKE '%$search_q%'";
$run_query=mysqli_query($con, $product_query);
if(mysqli_num_rows($run_query) >= 0){
  while ($row = mysqli_fetch_array($run_query)) {
   $pro_id    = $row['product_id'];
   $pro_cat   = $row['product_cat'];
   $pro_brand = $row['product_brand'];
   $pro_title = $row['product_title'];
   $pro_price = $row['product_price'];
   $pro_image = $row['product_image'];

   $cat_name = $row["cat_title"];

   echo "

   
           <div class='col-md-3 col-xs-6'>
   <a href='product.php?p=$pro_id'><div class='product'>
      <div class='product-img'>
         <img src='product_images/$pro_image' style='max-height: 170px;' alt=''>
         
      </div></a>
      <div class='product-body'>
         <p class='product-category'>$cat_name</p>
         <h3 class='product-name header-cart-item-name'><a href='product.php?p=$pro_id'>$pro_title</a></h3>
         <h4 class='product-price header-cart-item-info'>$pro_price</h4>
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
           </div>

   
";
}
;

}
 
?>

                        </div>
                       
                       <!-- /product -->
                    </div>
                    <!-- /store products -->
  
                    <!-- store bottom filter -->
                    <div class="store-filter clearfix">
                       <span class="store-qty">Показано 20-100 товаров</span>
                      
                    </div>
                    <!-- /store bottom filter -->
                 </div>
                 <!-- /STORE -->
              </div>
              <!-- /row -->
           </div>
           <!-- /container -->
        </div>
  </div>

<?php
include "newslettter.php";
include "footer.php";
?>