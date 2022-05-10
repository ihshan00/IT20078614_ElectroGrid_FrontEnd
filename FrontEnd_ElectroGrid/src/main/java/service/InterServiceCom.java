package service;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.google.gson.JsonParser;
import com.google.gson.JsonObject;

public class InterServiceCom {
		//Declaration of variables
		private static final String PROTOCOL = "http://";
		private static final String HOST = "127.0.0.1";
		private static final String PORT = "8082";
		private static final String POWER_SOURCE_URI = PROTOCOL + HOST + ":" + PORT + "/PowerSource/ElectroGrid/PowerSource";
		private static final String SERVICE_TOKEN="Basic dXNlcjpwYXNzd29yZA==";
	
	
	public JsonObject PowerSource(String path) {
		 
		
		
			//Client connection is created
			Client client = Client.create();
			
			//Client connection is established by the relevant path provided from the Employee Service
			WebResource webResource = client.resource(POWER_SOURCE_URI+path);
			
			//Authorization token for the Power Source Service is sent and the service requst is stored
			String output=webResource.header("Authorization", SERVICE_TOKEN).get(String.class);
			
			//Request then sent as JSON Object
			JsonObject JSONoutput = new JsonParser().parse(output).getAsJsonObject();
			return JSONoutput;

		  
	}

}
