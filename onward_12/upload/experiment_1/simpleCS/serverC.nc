#include "simpleCS.h"

module serverC{
	uses interface Boot;
	uses interface Leds;
	uses {
		interface SplitControl as RadioControl;
		interface AMSend as sendReturn;
		interface Receive as recRequest;
		}
	uses {
		interface Read<uint16_t> as Temp;
		interface Read<uint16_t> as Photo;
	}
	
}
implementation{
	
	bool busy = FALSE;
	message_t sendBuff;
	requestMsg_t reqData;
	returnMsg_t  retData;
	nx_uint16_t clientId;
	uint16_t reqCount=0;
	

	event void Boot.booted(){
		call RadioControl.start();
	}

	event void RadioControl.stopDone(error_t error){}
	event void RadioControl.startDone(error_t error){
	}

	task void sendData(){
		// Build a msg buffer
		memcpy(call sendReturn.getPayload(&sendBuff,call sendReturn.maxPayloadLength()), &retData, sizeof(returnMsg_t));
		// Try do send via radio
		call sendReturn.send(retData.ClientID, &sendBuff, sizeof(returnMsg_t));		
	}

	event message_t * recRequest.receive(message_t *msg, void *payload, uint8_t len){
		requestMsg_t reqDataTemp;
		memcpy(&reqDataTemp,payload,sizeof(requestMsg_t));
		reqCount++;
		call Leds.set((uint8_t)(reqCount & 0x07));
		
		if (~busy){
			busy = TRUE;
			memcpy(&reqData,payload,sizeof(requestMsg_t));
			switch (reqData.SensorType){
				case TEMP : call Temp.read(); 
				case PHOTO: call Photo.read(); 
				}			
		}
		return msg;
	}

	event void sendReturn.sendDone(message_t *msg, error_t error){
	}

	void fill () {
			retData.ClientID = reqData.ClientID;
			retData.ServerID = TOS_NODE_ID;
			retData.MsgType = reqData.MsgType;
			retData.Seq = reqData.Seq; 
	}

	event void Temp.readDone(error_t result, uint16_t val){
			fill();
			retData.Status=(nx_uint8_t)result;
			retData.Value=val;
			busy = FALSE; 
			post sendData();	
	}

	event void Photo.readDone(error_t result, uint16_t val){
			fill();
			retData.Status=(nx_uint8_t)result;
			retData.Value=val; 
			busy = FALSE; 
			post sendData();	
	}

}
