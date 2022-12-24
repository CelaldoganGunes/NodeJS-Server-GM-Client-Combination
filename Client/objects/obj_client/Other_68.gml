/// @description Handle Connection and Data

switch(ds_map_find_value(async_load,"type")){

	case network_type_non_blocking_connect:
	
		var success = async_load[? "succeeded"];
		
		if (success == 1)
		{
			connection_status = "Connected to the server.";
		}
		else if (success == 0)
		{
			connection_status = "Connection failed.";
		}
		
	break;
	
    case network_type_data:

		var buffer = async_load[? "buffer"];
		var jsonString = buffer_read(buffer,buffer_text);
		var jsonData = json_parse(jsonString);
		var eventName = jsonData.eventName;
		
		if (eventName == "pong")
		{
			var msg = jsonData.msg;
			show_debug_message(msg);
		}
		

    break;
}