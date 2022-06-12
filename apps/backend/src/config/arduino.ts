import { ReadlineParser } from '@serialport/parser-readline';
import { SerialPort } from 'serialport';

export const port = new SerialPort({
  path: 'dev/ttyACM0',
  baudRate: 9600,
  autoOpen: false,
});

export const parser = new ReadlineParser();
port.pipe(parser);

port.open(async function (err) {
  if (err) return console.log('Error opening port: ', err.message);
});
