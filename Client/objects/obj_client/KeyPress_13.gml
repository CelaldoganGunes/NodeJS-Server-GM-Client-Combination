/// @description Send test message to the server

var test_message = get_string("Write your message: ","");

var _data = {
	eventName : "test_message",
	msg : test_message
}

var _json_string = json_stringify(_data);

var buffer = buffer_create(1, buffer_grow ,1);
buffer_seek(buffer, buffer_seek_start,0);
buffer_write(buffer, buffer_text, _json_string);
		
network_send_raw(global.client_socket, buffer, buffer_tell(buffer));
buffer_delete(buffer);
delete _data;