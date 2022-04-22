<?php
namespace App\Lib;

class Response{
	public $result  = array();
	public $success  = true;
	public $message = '';
    // public $errors  = [];
	
	public function SetResponse($success, $m = ''){
		$this->success = $success;
		$this->message = $m;
		// if(!$succes && $m = '') $this->message = 'Ocurrio un error inesperado';        
        return $this;
	}
}