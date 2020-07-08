<?php

$data = file_get_contents("php://input");

$result = array(
    "status" => "SUCCESS",
    "message" => "Bug reported successfully",
    "data" => null
);

$json_request = json_decode($data,true);
$request_id = $json_request["id"];

$bug = $json_request['params']['args']['bug_description'];

$handle = fopen("./bugs.log","a");
fwrite($handle,$bug . "\n");
fclose($handle);

$json_response['jsonrpc'] = "2.0";
$json_response['result'] = $result;
$json_response['id'] = $request_id;

header('Content-Type: application/json');
echo json_encode($json_response);

die();