<?php
namespace App\Validation;

use App\Lib\Response;

class EmpleadoValidation {
    public static function validate($data, $update = false) {
        $response = new Response();
        
        $key = 'EsAdmin';
        if(!isset($data[$key])) {
            $response->errors[$key][] = 'Este campo es obligatorio';
        } else {
            $value = $data[$key];
            
            if($value != '1' && $value != '0') {
                $response->errors[$key][] = 'Valor ingresado no válido';
            }
        }
        
        $key = 'Nombre';
        if(empty($data[$key])) {
            $response->errors[$key][] = 'Este campo es obligatorio';
        } else {
            $value = $data[$key];
            
            if(strlen($value) < 4) {
                $response->errors[$key][] = 'Debe contener como mínimo 4 caracteres';
            }
        }
        
        $key = 'Correo';
        if(empty($data[$key])) {
            $response->errors[$key][] = 'Este campo es obligatorio';
        } else {
            $value = $data[$key];
            
            if( !filter_var($value, FILTER_VALIDATE_EMAIL) ) {
                $response->errors[$key][] = 'Valor ingresado no es un correo válido';
            }
        }
        
        $key = 'Password';
        if( !$update ){
            if(empty($data[$key])){
                $response->errors[$key][] = 'Este campo es obligatorio';
            } else {
                $value = $data[$key];

                if(strlen($value) < 4) {
                    $response->errors[$key][] = 'Debe contener como mínimo 4 caracteres';
                }
            }            
        } else {
            if(!empty($data[$key])){
                $value = $data[$key];

                if(strlen($value) < 4) {
                    $response->errors[$key][] = 'Debe contener como mínimo 4 caracteres';
                }
            }
        }

        $response->setResponse(count($response->errors) === 0);

        return $response;
    }
}