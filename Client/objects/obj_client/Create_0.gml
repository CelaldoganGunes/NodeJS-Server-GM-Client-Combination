/// @description Connect to Server with WebSocket

/*
Connecting to the server... //Right here.
Connection completed.
Connection failed.
*/

connection_status = "Connecting to the server...";
network_set_config(network_config_connect_timeout, 4000);

global.client_socket = network_create_socket(network_socket_ws);
network_connect_raw_async(global.client_socket , "127.0.0.1", 3000);
