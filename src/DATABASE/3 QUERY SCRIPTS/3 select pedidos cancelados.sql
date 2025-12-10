/**
    Consulta los pedidos cancelados
*/

USE `bocado_infinito`;

SELECT p.idpedido,he.fecha_hora,he.nombre FROM pedido p JOIN historial_estado he ON p.idpedido he.fk_pedido JOIN estado e ON he.fk_estado = e.idestado WHERE e.estado_nombre = 'Cancelado';