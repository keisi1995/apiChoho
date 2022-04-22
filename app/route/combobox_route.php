<?php
$app->group('/combobox/', function () {

    $this->get('listar/{tip}', function ($req, $res, $args) {
        $r = $req->getQueryParams();
        return $res->withHeader('Content-type', 'application/json')->write(
            json_encode($this->model->combobox->listar($args['tip']))
        );
    });

});
