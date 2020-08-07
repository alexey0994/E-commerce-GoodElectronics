$(document).ready(function(){
	cat();
    cathome();
	brand();
	product();
    
    producthome();
    
    
	//cat () - функция, извлекающая запись категории из базы данных всякий раз, когда страница загружается
	function cat(){
		$.ajax({
			url	:	"action.php",
			method:	"POST",
			data	:	{category:1},
			success	:	function(data){
				$("#get_category").html(data);
				
			}
		})
	}
    function cathome(){
		$.ajax({
			url	:	"homeaction.php",
			method:	"POST",
			data	:	{categoryhome:1},
			success	:	function(data){
				$("#get_category_home").html(data);
				
			}
		})
	}
	//brand () - это функция, извлекающая запись бренда из базы данных при загрузке страницы
	function brand(){
		$.ajax({
			url	:	"action.php",
			method:	"POST",
			data	:	{brand:1},
			success	:	function(data){
				$("#get_brand").html(data);
			}
		})
	}
	//product () - функция, извлекающая запись продукта из базы данных при загрузке страницы
		function product(){
		$.ajax({
			url	:	"action.php",
			method:	"POST",
			data	:	{getProduct:1},
			success	:	function(data){
				$("#get_product").html(data);
			}
		})
	}
    gethomeproduts();
    function gethomeproduts(){
		$.ajax({
			url	:	"homeaction.php",
			method:	"POST",
			data	:	{gethomeProduct:1},
			success	:	function(data){
				$("#get_home_product").html(data);
			}
		})
	}
    function producthome(){
		$.ajax({
			url	:	"homeaction.php",
			method:	"POST",
			data	:	{getProducthome:1},
			success	:	function(data){
				$("#get_product_home").html(data);
			}
		})
	}
   
    
	/*	Когда страница загружается успешно, появляется список категорий, когда пользователь нажимает на категорию, мы получаем id категории и
в соответствии с id мы покажем продукты
	*/
	$("body").delegate(".category","click",function(event){
		$("#get_product").html("<h3>Загрузка...</h3>");
		event.preventDefault();
		var cid = $(this).attr('cid');
		
			$.ajax({
			url		:	"action.php",
			method	:	"POST",
			data	:	{get_seleted_Category:1,cat_id:cid},
			success	:	function(data){
				$("#get_product").html(data);
				if($("body").width() < 480){
					$("body").scrollTop(683);
				}
			}
		})
	
	})
    $("body").delegate(".categoryhome","click",function(event){
		$("#get_product").html("<h3>Загрузка...</h3>");
		event.preventDefault();
		var cid = $(this).attr('cid');
		
			$.ajax({
			url		:	"homeaction.php",
			method	:	"POST",
			data	:	{get_seleted_Category:1,cat_id:cid},
			success	:	function(data){
				$("#get_product").html(data);
				if($("body").width() < 480){
					$("body").scrollTop(683);
				}
			}
		})
	
	})

	/*	при успешной загрузке страницы появляется список брендов, когда пользователь нажимает на бренд, мы получаем идентификатор бренда и
в соответствии с id бренда мы покажем продукты
	*/
	$("body").delegate(".selectBrand","click",function(event){
		event.preventDefault();
		$("#get_product").html("<h3>Загрузка...</h3>");
		var bid = $(this).attr('bid');
		
			$.ajax({
			url		:	"action.php",
			method	:	"POST",
			data	:	{selectBrand:1,brand_id:bid},
			success	:	function(data){
				$("#get_product").html(data);
				if($("body").width() < 480){
					$("body").scrollTop(683);
				}
			}
		})
	
	})
	/*
В верхней части страницы есть окно поиска с кнопкой поиска, когда пользователь вводит название продукта,
 тогда мы возьмем заданную пользователем строку и с помощью запроса sql сопоставим заданную пользователем строку
  с колонкой ключевых слов нашей базы данных, после чего сопоставим продукт, который мы будем показывать
	*/
	// $("#search_btn").click(function(){
	// 	$("#get_product").html("<h3>Загрузка...</h3>");
	// 	var keyword = $("#search").val();
	// 	if(keyword != ""){
	// 		$.ajax({
	// 		url		:	"action.php",
	// 		method	:	"POST",
	// 		data	:	{search:1,keyword:keyword},
	// 		success	:	function(data){ 
	// 			$("#get_product").html(data);
	// 			if($("body").width() < 480){
	// 				$("body").scrollTop(683);
	// 			}
	// 		}
	// 	})
	// 	}
	// })
	//конец 


	/*
		Здесь #login - идентификатор формы входа, и эта форма доступна на странице index.php.
отсюда исходные данные отправляются на страницу login.php
если вы получили строку login_success со страницы login.php, значит, пользователь успешно вошел в систему, а window.location
используется для перенаправления пользователя на домашнюю страницу
	*/
	$("#login").on("submit",function(event){
		event.preventDefault();
		$(".overlay").show();
		$.ajax({
			url	:	"login.php",
			method:	"POST",
			data	:$("#login").serialize(),
			success	:function(data){
				if(data == "login_success"){
					window.location.href = "index.php";
				}else if(data == "cart_login"){
					window.location.href = "cart.php";
				}else{
					$("#e_msg").html(data);
					$(".overlay").hide();
				}
			}
		})
	})
	//конец 

	//Получение информации о пользователе перед оформлением заказа
	$("#signup_form").on("submit",function(event){
		event.preventDefault();
		$(".overlay").show();
		$.ajax({
			url : "register.php",
			method : "POST",
			data : $("#signup_form").serialize(),
			success : function(data){
				$(".overlay").hide();
				if (data == "register_success") {
					window.location.href = "cart.php";
				}else{
					$("#signup_msg").html(data);
				}
				
			}
		})
	})
	
	
    $("#offer_form").on("submit",function(event){
		event.preventDefault();
		$(".overlay").show();
		$.ajax({
			url : "offersmail.php",
			method : "POST",
			data : $("#offer_form").serialize(),
			success : function(data){
				$(".overlay").hide();
				$("#offer_msg").html(data);
				
			}
		})
	})
    
    
    
	//Получиение информации о пользователе перед оформлением заказа здесь

	//Добавить товар в корзину
	$("body").delegate("#product","click",function(event){
		var pid = $(this).attr("pid");
		
		event.preventDefault();
		$(".overlay").show();
		$.ajax({
			url : "action.php",
			method : "POST",
			data : {addToCart:1,proId:pid,},
			success : function(data){
				count_item();
				getCartItem();
				$('#product_msg').html(data);
				$('.overlay').hide();
			}
		})
	})
	//Добавить товар в корзину конец
	//Функция подсчета элементов корзины пользователя
	count_item();
	function count_item(){
		$.ajax({
			url : "action.php",
			method : "POST",
			data : {count_item:1},
			success : function(data){
				$(".badge").html(data);
			}
		})
	}
	//Функция подсчета элементов корзины пользователя конец

	//Извлечь элемент корзины из базы данных в выпадающее меню
	getCartItem();
	function getCartItem(){
		$.ajax({
			url : "action.php",
			method : "POST",
			data : {Common:1,getCartItem:1},
			success : function(data){
				$("#cart_product").html(data);
                net_total();
                
			}
		})
	}

	//Извлечь элемент корзины из базы данных в выпадающее меню

	/*
	Всякий раз, когда пользователь меняет количество, мы немедленно обновляем его общую сумму, используя функцию keyup
    но всякий раз, когда пользователь помещает что-то (например,? '' "",. () '' и т. д.), отличное от number, мы будем делать qty = 1
    если пользователь поставил qty 0 или меньше 0, то мы снова сделаем 1 qty = 1
    ('.total'). each () это повтор функции цикла для класса .total, и в каждом повторении мы будем выполнять операцию суммирования значения класса .total.
    а затем показать результат в класс .net_total
	*/
	$("body").delegate(".qty","keyup",function(event){
		event.preventDefault();
		var row = $(this).parent().parent();
		var price = row.find('.price').val();
		var qty = row.find('.qty').val();
		if (isNaN(qty)) {
			qty = 1;
		};
		if (qty < 1) {
			qty = 1;
		};
		var total = price * qty;
		row.find('.total').val(total);
		var net_total=0;
		$('.total').each(function(){
			net_total += ($(this).val()-0);
		})
		$('.net_total').html("Итого : " +net_total +"₽");

	})
	//Изменение количества заканчивается здесь

	/*
		всякий раз, когда пользователь нажимает на класс .remove, мы берем идентификатор продукта этой строки
        и отправьте его в action.php для выполнения операции удаления продукта
	*/
    
	   
    $("body").delegate(".remove","click",function(event){
        var remove = $(this).parent().parent().parent();
        var remove_id = remove.find(".remove").attr("remove_id");
        $.ajax({
            url	:	"action.php",
            method	:	"POST",
            data	:	{removeItemFromCart:1,rid:remove_id},
            success	:	function(data){
                $("#cart_msg").html(data);
                checkOutDetails();
                }
            })
    })
    
    
	/*
		всякий раз, когда пользователь нажимает на класс .update, мы берем идентификатор продукта этой строки
        и отправьте его в action.php для выполнения операции обновления кол-ва продукта
	*/
	$("body").delegate(".update","click",function(event){
		var update = $(this).parent().parent().parent();
		var update_id = update.find(".update").attr("update_id");
		var qty = update.find(".qty").val();
		$.ajax({
			url	:	"action.php",
			method	:	"POST",
			data	:	{updateCartItem:1,update_id:update_id,qty:qty},
			success	:	function(data){
				$("#cart_msg").html(data);
				checkOutDetails();
			}
		})


	})
	checkOutDetails();
	net_total();
	/*
		Функция checkOutDetails () работает для двух целей
Сначала он включит php isset ($ _ POST ["Common"]) на странице action.php и внутри нее.
есть две функции isset, которые isset ($ _ POST ["getCartItem"]) и другая isset ($ _ POST ["checkOutDetials"])
getCartItem используется для отображения элемента корзины в выпадающем меню
checkOutDetails используется для отображения элемента корзины на странице Cart.php
	*/
	function checkOutDetails(){
	 $('.overlay').show();
		$.ajax({
			url : "action.php",
			method : "POST",
			data : {Common:1,checkOutDetails:1},
			success : function(data){
				$('.overlay').hide();
				$("#cart_checkout").html(data);
					net_total();
			}
		})
	}
	/*
		Функция net total используется для расчета общего количества товара в корзине
	*/
	function net_total(){
		var net_total = 0;
		$('.qty').each(function(){
			var row = $(this).parent().parent();
			var price  = row.find('.price').val();
			var total = price * $(this).val()-0;
			row.find('.total').val(total);
		})
		$('.total').each(function(){
			net_total += ($(this).val()-0);
		})
		$('.net_total').html("Итого : " +net_total+"₽");
	}

	//удаление товара из корзины

	page();
	function page(){
		$.ajax({
			url	:	"action.php",
			method	:	"POST",
			data	:	{page:1},
			success	:	function(data){
				$("#pageno").html(data);
			}
		})
	}
	$("body").delegate("#page","click",function(){
		var pn = $(this).attr("page");
		$.ajax({
			url	:	"action.php",
			method	:	"POST",
			data	:	{getProduct:1,setPage:1,pageNumber:pn},
			success	:	function(data){
				$("#get_product").html(data);
			}
		})
	})
})






















