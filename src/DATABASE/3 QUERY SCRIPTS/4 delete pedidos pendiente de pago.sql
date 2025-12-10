/**
   Elimina los pedidos pendiente de pago
*/

USE `bocado_infinito`;

DELETE p FROM pedido p 
INNER JOIN historial_estado he ON he.fk_usuario = p.idpedido 
INNER JOIN estado e ON he.fk_estado = e.idestado
WHERE e.estado_nombre = 'Pendiente de pago';