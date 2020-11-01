/*
 * Copyright (c) 2020. Francesco D'anetra
 */

import 'package:flutter_blue/flutter_blue.dart' as Blue;
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothHandler{


  static Future<Blue.BluetoothDevice> findDevice(String id) async{
    Blue.FlutterBlue flutterBlue = Blue.FlutterBlue.instance;
    flutterBlue.startScan(timeout: Duration(seconds: 4));
    Blue.BluetoothDevice device;
    flutterBlue.scanResults.listen((results) {
        for (Blue.ScanResult r in results) {
          if(r.device.id.id == id) device = r.device;
        }
    });
    return await Future.delayed(Duration(seconds: 5),(){
      print("sending results" + device.toString());
      return device;
    });
  }

  static void bondDeviceWithPin(Blue.BluetoothDevice device, String pin) {
    FlutterBluetoothSerial.instance
        .bondDeviceAtAddress(device.id.id, pin: "000000");
  }

  static void connectToDevice(Blue.BluetoothDevice d) {
    d.connect();
  }
}