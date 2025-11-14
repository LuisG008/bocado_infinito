$(function () {
    /**
     * Click en el menu lateral
     */
    $('.nav-link').on('click', function (e) {
         e.preventDefault();
        $('.nav-link').removeClass('active'); 
        $('.nav-link').addClass('text-black');
        $(this).addClass('active');
        $(this).removeClass('text-black');

        
        switch ($(this).data('id')) {
            case 'pedido':
                $('#pantalla').attr("src", "pedidos.html");
                break;
            case 'menu':
                $('#pantalla').attr("src", "menu.html");
                break;
            case 'usuario':
                $('#pantalla').attr("src", "usuario.html");
                break;
            case 'cocina':
                $('#pantalla').attr("src", "cocina.html");
                break;
            case 'entrega':
                $('#pantalla').attr("src", "entrega.html");
                break;
            case 'caja':
                $('#pantalla').attr("src", "caja.html");
                break;
            case 'cliente':
                $('#pantalla').attr("src", "cliente.html");
                break;
        }
    });
});