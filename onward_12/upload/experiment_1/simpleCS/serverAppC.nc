#include "simpleCS.h"

configuration serverAppC{
}
implementation{
	components serverC, MainC, LedsC;
	components ActiveMessageC;
	components new AMSenderC(RETURN_ID) as sendReturn;
	components new AMReceiverC(REQUEST_ID) as recRequest;
//	components new DemoSensorC() as TempC;
//	components new DemoSensorC() as PhotoC;
	components new TempC() as TempC;
	components new PhotoC() as PhotoC;
	
	
	serverC.Boot -> MainC;
	serverC.Leds -> LedsC;
	
	serverC.RadioControl -> ActiveMessageC;
	serverC.sendReturn -> sendReturn;
	serverC.recRequest -> recRequest;
	
	serverC.Temp -> TempC;
	serverC.Photo -> PhotoC;
	
}