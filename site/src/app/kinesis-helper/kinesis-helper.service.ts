import { Injectable } from '@angular/core';
import * as AWS from 'aws-sdk';
import { Observable, Subject } from 'rxjs';
import * as uuid from 'uuid';

@Injectable({
  providedIn: 'root'
})
export class KinesisHelperService {

  constructor() { 
    
  }

  public streamData(region: string, secretAccessKey: string, accessKey: string, streamName: string ): Observable<String>{
    const sendResult = new Subject<String>();
    console.log('Calling service to stream data.');
    AWS.config.update({region: region,
      accessKeyId: accessKey,
      secretAccessKey: secretAccessKey});
    const credentials = new AWS.Credentials(AWS.config.credentials);
    const kds = new AWS.Kinesis({ region: region, credentials: credentials });

    const myId = uuid.v4();
      var params = {
        Data: '{"record": "test", "uuid" : "'+ myId + '"}',
        PartitionKey: myId,
        StreamName: streamName,
      };

      kds.putRecord(params, function(err, data) {
        if (err) {
          sendResult.error(err);
        }else {
          sendResult.next(data.SequenceNumber);
        }
      });
      return sendResult.asObservable();
      
  }
}
