<?php
namespace App\Lib;

class Response
{
    public $result  = array();
    public $success = true;
    public $message = '';

    public function SetResponse($success, $m = '')
    {
        $this->success = $success;
        $this->message = $m;
        return $this;
    }
    
}
