<?php
#это страница формы входа, если пользователь уже вошел в систему, то мы не позволим пользователю получить доступ к этой странице, выполнив isset($_SESSION["uid"])
#если ниже возвращается true тогда мы отправим пользователя на их profile.php страницу
//в action.php странице если пользователь жмет на "ready to checkout" кнопку тогда мы передаем данные в виде from action.php страницу
if (isset($_POST["login_user_with_product"])) {
	//это массив списка товаров
	$product_list = $_POST["product_id"];
	//здесь мы конвертируем массив в формат json, потому что массив не может быть сохранен в cookie
	$json_e = json_encode($product_list);
	//здесь мы создаем куки и имя куки это product_list
	setcookie("product_list",$json_e,strtotime("+1 day"),"/","","",TRUE);

}
?>

	<div class="wait overlay">
		<div class="loader"></div>
	</div>
	<div class="container-fluid">
				<!-- row -->
				

					<div class="login-marg">
						<!-- Платежные реквезиты -->
						
						
						<!-- /Платежные реквезиты -->
						
						
								<form onsubmit="return false" id="login" class="login100-form ">
									<div class="billing-details jumbotron">
                                    <div class="section-title">
                                        <h2 class="login100-form-title p-b-49" >Авторизация</h2>
                                    </div>
                                   
                                    
                                    <div class="form-group">
                                       <label for="email">Email</label>
                                        <input class="input input-borders" type="email" name="email" placeholder="Email" id="password" required>
                                    </div>
                                    
                                    <div class="form-group">
                                       <label for="email">Пароль</label>
                                        <input class="input input-borders" type="password" name="password" placeholder="Пароль" id="password" required>
                                    </div>
                                    
                                    <div class="text-pad" >
                                       <a href="#">
                                           Забыли пароль? 
                                       </a>
									   <a href="#" data-toggle="modal" data-target="#Modal_register">Регистрация</a>
                                    </div>
                                    
                                        <input class="primary-btn btn-block"   type="submit"  Value="Войти">
                                        
                                        <div class="panel-footer"><div class="alert alert-danger"><h4 id="e_msg"></h4></div></div>
                                    
                                    

                                </div>
                                
								</form>
                           
					</div>

					<!-- Подробности заказа -->
					
					<!-- /Подробности заказа -->
				
				<!-- /row -->
			</div>