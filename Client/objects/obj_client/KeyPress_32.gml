/// @description Restart Client

network_destroy(global.client_socket);
instance_destroy();
instance_create_layer(x,y,layer,obj_client);
