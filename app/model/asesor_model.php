<?php
namespace App\Model;

use App\Lib\Response;

class AsesorModel
{
    private $db;
    private $response;

    public function __CONSTRUCT($db)
    {
        $this->db       = $db;
        $this->response = new Response();
    }

    public function listar($codAsesor = '')
    {
        // echo $codAsesor;
        try {
            // OBTIENE LA DATA DE LOS ASESORES
            $queryAsesor = $this->db->prepare('CALL sp_asesor(?)');
            $queryAsesor->execute(array($codAsesor));
            $objDataAsesor = $queryAsesor->fetchAll();
            $queryAsesor->closeCursor();

            // RECORRE EL OBJETO ASESOR
            foreach ($objDataAsesor as $k_asesor => $v_asesor) {

                // OBTIENE LA DATA DE LOS CLIENTES ASOCIADOS AL ASESOR
                $queryAsesorCliente = $this->db->prepare('CALL sp_asesor_cliente(?)');
                $queryAsesorCliente->execute(array($v_asesor->id_asesor));
                $objDataAsesorCliente = $queryAsesorCliente->fetchAll();
                $queryAsesorCliente->closeCursor();

                // RECORRE EL OBJETO CLIENTE POR ASESOR
                foreach ($objDataAsesorCliente as $k_asesor_cliente => $v_asesor_cliente) {

                    // OBTIENE LA DATA DEL PEDIDO
                    $queryPedido = $this->db->prepare('CALL sp_pedido(?)');
                    $queryPedido->execute(array($v_asesor_cliente->id_cliente));
                    $objDataPedido = $queryPedido->fetchAll();
                    $queryPedido->closeCursor();

                    // RECORRE EL OBJETO PEDIDO
                    foreach ($objDataPedido as $k_pedido => $v_pedido) {

                        // OBTIENE LA DATA DEL DETALLE DEL PEDIDO
                        $queryPedidoDetalle = $this->db->prepare('CALL sp_pedido_detalle(?)');
                        $queryPedidoDetalle->execute(array($v_pedido->id_pedido));
                        $objDataPedidoDetalle = $queryPedidoDetalle->fetchAll();
                        $queryPedidoDetalle->closeCursor();

                        $v_pedido->productos = $objDataPedidoDetalle;
                    }

                    $v_asesor_cliente->detalle_pedidos = $objDataPedido;
                }

                $v_asesor->clientes = $objDataAsesorCliente;
            }

            return $objDataAsesor;
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

}
