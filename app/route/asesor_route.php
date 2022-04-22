<?php
$app->group('/asesor/', function () {

    $this->get('listar', function ($req, $res, $args) {
        $r = $req->getQueryParams();
        return $res->withHeader('Content-type', 'application/json')->write(
            json_encode($this->model->asesor->listar())
        );
    });

    $this->get('listar/{codAsesor}', function ($req, $res, $args) {
        return $res->withHeader('Content-type', 'application/json')->write(
            json_encode($this->model->asesor->listar($args['codAsesor']))
        );
    });

});
