import { data } from '@Controllers/data.controller';
import {SerialPort} from 'serialport';
import {ReadlineParser} from '@serialport/parser-readline'
import {handleArduinoInput} from './handleData'




export function setListener(){


  const delay = (ms:number) => new Promise(resolve => setTimeout(resolve, ms))

  const port = new SerialPort({
    path:"dev/ttyACM0",
    baudRate: 9600,
    autoOpen: false,
  })

  const parser = new ReadlineParser();
  port.pipe(parser);

  port.open(async function (err){
    if(err) return console.log('Error opening port: ',err.message)
    await delay(2000)
    port.write('test');
  })


  parser.on("data", handleArduinoInput)

}