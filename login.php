<?php
include "db.php";

session_start();

#Сценарий входа начинается здесь
#Если предоставленные пользователем учетные данные успешно совпадают с данными, имеющимися в базе данных, мы будем отображать строку login_success
#Строка login_success вернется к вызову анонимной функции $ ("# login"). click ()

if(isset($_POST["email"]) && isset($_POST["password"])){
	$email = mysqli_real_escape_string($con,$_POST["email"]);
	$password = $_POST["password"];
	$sql = "SELECT * FROM user_info WHERE email = '$email' AND password = '$password'";
	$run_query = mysqli_query($con,$sql);
	$count = mysqli_num_rows($run_query);
    $row = mysqli_fetch_array($run_query);
		$_SESSION["uid"] = $row["user_id"];
		$_SESSION["name"] = $row["first_name"];
		$ip_add = getenv("REMOTE_ADDR");
		//был создан файл cookie на странице login_form.php, поэтому, если этот файл cookie доступен, это означает, что пользователь не авторизован
        
	//если пользовательская запись доступна в базе данных, то $ count будет равно 1
	if($count == 1){
		   	
			if (isset($_COOKIE["product_list"])) {
				$p_list = stripcslashes($_COOKIE["product_list"]);
				//здесь мы декодируем сохраненный JSON список продуктов cookie в обычный массив
				$product_list = json_decode($p_list,true);
				for ($i=0; $i < count($product_list); $i++) { 
					//После получения идентификатора пользователя из базы данных мы проверяем элемент корзины пользователя, если продукт уже указан в списке или нет
					$verify_cart = "SELECT id FROM cart WHERE user_id = $_SESSION[uid] AND p_id = ".$product_list[$i];
					$result  = mysqli_query($con,$verify_cart);
					if(mysqli_num_rows($result) < 1){
						//если пользователь впервые добавляет продукт в корзину, мы обновим user_id в таблице базы данных с действительным идентификатором
						$update_cart = "UPDATE cart SET user_id = '$_SESSION[uid]' WHERE ip_add = '$ip_add' AND user_id = -1";
						mysqli_query($con,$update_cart);
					}else{
						//если этот продукт уже доступен в таблице базы данных, мы удалим эту запись
						$delete_existing_product = "DELETE FROM cart WHERE user_id = -1 AND ip_add = '$ip_add' AND p_id = ".$product_list[$i];
						mysqli_query($con,$delete_existing_product);
					}
				}
				//здесь мы уничтожаем куки пользователя
				setcookie("product_list","",strtotime("-1 day"),"/");
				//если пользователь входит в систему после страницы корзины, мы вышлем cart_login
				echo "cart_login";
				
				
				exit();
				
			}
			//если пользователь залогинен со страницы, мы вышлем login_success
			echo "login_success";
			$BackToMyPage = $_SERVER['HTTP_REFERER'];
				if(!isset($BackToMyPage)) {
					header('Location: '.$BackToMyPage);
					echo"<script type='text/javascript'>
					
					</script>";
				} else {
					// header('Location: index.php'); // страница по умолчанию
				} 
				
			
            exit;

		}else{
                $email = mysqli_real_escape_string($con,$_POST["email"]);
                $password =md5($_POST["password"]) ;
                $sql = "SELECT * FROM admin_info WHERE admin_email = '$email' AND admin_password = '$password'";
                $run_query = mysqli_query($con,$sql);
                $count = mysqli_num_rows($run_query);

            //если пользовательская запись доступна в базе данных, то $ count будет равно 1
            if($count == 1){
                $row = mysqli_fetch_array($run_query);
                $_SESSION["uid"] = $row["admin_id"];
                $_SESSION["name"] = $row["admin_name"];
                $ip_add = getenv("REMOTE_ADDR");
                //был создан файл cookie на странице login_form.php, поэтому, если этот файл cookie доступен, это означает, что пользователь не авторизован


                    //если пользователь залогинен со страницы, мы вышлем login_success
                    echo "login_success";

                    echo "<script> location.href='admin/index.php'; </script>";
                    exit;

                }else{
                    echo "<span style='color:red;'>Пожалуйста, зарегистрируйтесь перед входом..!</span>";
                    exit();
                }
    
	
}
    
	
}

?>