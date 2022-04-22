<?php
namespace App\Model;

use App\Lib\Response;

class ComboboxModel
{
    private $db;
    private $response;

    public function __CONSTRUCT($db)
    {
        $this->db       = $db;
        $this->response = new Response();
    }

    /**
     * @param  [Integer] id tipo de listado para ejecutar el store combobox
     * @return [array] retorna la data
     */
    public function listar($tip)
    {
        try {
            $query = $this->db->prepare('CALL sp_combobox(?)');
            $query->execute(array($tip));
            $objData = $query->fetchAll();
            $query->closeCursor();

            $this->response->result = array(
                'total' => count($objData),
                'items' => $objData,
            );

            return $this->response->SetResponse(true);
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

}
