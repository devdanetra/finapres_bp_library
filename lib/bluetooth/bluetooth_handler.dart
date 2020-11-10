/*
 * Copyright (c) 2020. Francesco D'anetra
 */

import 'dart:async';

import 'package:finapres_bp_library/device/command_handler.dart';
import 'package:finapres_bp_library/device/mode_handler.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart'
    as SERIAL;

import '../device/connection_handler.dart';

class DeviceNotFound implements Exception {}
class CommunicationServiceNotFound implements Exception{}
class CharacteristicsNotFound implements Exception{}

class BluetoothHandler implements ConnectionHandler {
  String _address;
  String _pin;
  FlutterBlue instance = FlutterBlue.instance;
  BluetoothDevice targetDevice;
  BluetoothService communicationService;
  BluetoothCharacteristic notificationCharacteristic;
  BluetoothCharacteristic rxDataCharacteristic;
  @override
  int rate;
  @override
  CommandHandler commandHandler;
  @override
  ModeHandler modeHandler;

  BluetoothHandler(this._address,this._pin,this.rate);

  String get address => _address;
  String get pin => _pin;


  @override
  navigateToMode(Mode mode) {
    // TODO: implement navigateToMode
    throw UnimplementedError();
  }

  @override
  sendCommand(Command command) {
    // TODO: implement sendCommand
    throw UnimplementedError();
  }


  Future<void> refreshCommunicationService() async{
    if(targetDevice == null) syncDevice();
    communicationService = null;
    notificationCharacteristic = null;
    rxDataCharacteristic = null;
    List<BluetoothService> services = await this.targetDevice.discoverServices();
    services.forEach((service) {
      if (service.uuid.toString().contains("131")) {
        communicationService = service;
        print("MAIN COMMUNICATION SERVICE FOUND ");
      }
      print(service.uuid.toString() + " | " + service.deviceId.toString());
    });
    if(communicationService == null) throw CommunicationServiceNotFound();
      communicationService.characteristics.forEach((char) {
        if(char.uuid.toString().contains("131")) //todo set exact id
          rxDataCharacteristic = char;
        if(char.uuid.toString().contains("132")) //todo set exact id
          notificationCharacteristic = char;
      print("INCLUDED SERVICE " + char.uuid.toString());
    });
      if(notificationCharacteristic == null || rxDataCharacteristic == null) throw new CharacteristicsNotFound();
  }

  Future<void> findDevice(int timeout) async {
    instance.stopScan();
    BluetoothDevice tempDevice;
    instance.startScan(timeout: Duration(seconds: 4));
    instance.scanResults.listen((results) {
      for (ScanResult r in results) {
        if (r.device.id.id == address) tempDevice = r.device;
      }
    });
    await new Future.delayed(Duration(seconds: timeout));
    if (tempDevice != null) {
      targetDevice = tempDevice;
    } else
      throw new DeviceNotFound();
  }

  /*
      SYNC DEVICE EXCEPTIONS

     5 = DEVICE FOUND & ALREADY BONDED
     1 = DEVICE FOUND & SUCCESSFULLY BONDED
     0 = ALREADY CONNECTED TO DEVICE
    -1 = DEVICE FOUND NOT SUCCESSFULLY BONDED
    -5 = DEVICE NOT FOUND}
  */

  Future<int> syncDevice() async {
    try {
      await findDevice(5);
      SERIAL.BluetoothBondState state = await SERIAL
          .FlutterBluetoothSerial.instance
          .getBondStateForAddress(address);
      if (!state.isBonded) {
        //DEVICE NOT BONDED
        await SERIAL.FlutterBluetoothSerial.instance
            .bondDeviceAtAddress(address, pin: pin);
        await targetDevice.connect(timeout: Duration(seconds: 10));
        return 1;
      }
      await targetDevice.connect(timeout: Duration(seconds: 10));
      return 5;
    } catch (e) {
      if (e is DeviceNotFound)
        return -5;
      else
        return -1;
    }
  }

  void disconnectDevice() async {
    return targetDevice.disconnect();
  }

}
