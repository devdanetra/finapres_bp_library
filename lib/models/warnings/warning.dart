import 'dart:typed_data';

import 'package:finapres_bp_library/models/base/array_byte_model.dart';
import 'package:finapres_bp_library/models/mode.dart';

class Warning extends ArrayByteModel{

  final int byte1;
  final int byte2;
  final int byte3;
  final int byte4;


  Warning(this.byte1, this.byte2, this.byte3, this.byte4){

    generateBytes();

  }

  @override
  void generateBytes() {
    super.add(byte1);
    super.add(byte2);
    super.add(byte3);
    super.add(byte4);
  }

  List<WarningInfo> getWarningsAsInfo(){
    List<bool> bits = [];
    List<WarningInfo> currentWarning = [];

    bits = _bytesToBits(super.bytes);
    currentWarning = _searchWarning(bits);
    return currentWarning;


  }

  List<bool> _bytesToBits(Uint8List bytes) { // scorre la lista di Byte inseriti, li converte in bit, e li ritorna al contrario.
    List<bool> binary = [];
    int thisByte;
    for (int i = 0; i < bytes.length; i++) {
        thisByte = bytes.elementAt(i);

        while ( thisByte> 0) {
          binary.add((thisByte % 2) as bool);
          thisByte = (thisByte / 2) as int;
        }
    }
    return binary.reversed.toList();
  }

  List<WarningInfo> _searchWarning(List<bool> bits){

    List<WarningInfo> warningList = [];

    for(int i = 0 ; i < bits.length ; i++)
      if(bits.elementAt(i) == true)
        warningList.add(WarningType.warningTypes.elementAt(i));

    return warningList;
  }
}

class WarningType{  // la classe non deve essere statica ?
  static List<WarningInfo> warningTypes = [
    WarningInfo(
        bit: 1,
        description: "Unknown warning has occurred" ,
        action: "If the warning is not cleared after sometime please try restarting device. "
    ),

    WarningInfo(
        bit: 2,
        description: "Low pulse measured during initial phase. Retrying using artificial heart beat" ,
        action: "No actions required."
    ),

    WarningInfo(
        bit: 3,
        description: "During Physiocal, an error was detected, probably due to movement artifact" ,
        action: "Minimize finger movement and movement artifacts."
    ),

    WarningInfo(
        bit: 4,
        description: "During Physiocal, an error was detected, probably due to movement artifact" ,
        action: "Minimize finger movement and movement artifacts."
    ),

    WarningInfo(
        bit: 5,
        description: "Switch to artificial physiocal" ,
        action: "No actions required."
    ),

    WarningInfo(
        bit: 6,
        description: "No pulse detected. This may occur when up-stream circulation is blocked (e.g. by inflation of upper-arm cuff)" ,
        action: "Ensure the up-stream circulation is not blocked.\nCheck proper application of the finger cuff."
    ),

    WarningInfo(
        bit: 7,
        description: "Measurement set-point changed to recover from large disturbance.Like squeezing the finger-tip of the measure finger" ,
        action: "No actions required"
    ),

    WarningInfo(
        bit: 8,
        description: "Measurement set-point changed to remove continues oscillations" ,
        action: "No actions required"
    ),

    WarningInfo(
        bit: 9,
        description: "Pressure set-point changed to quickly after starting pressure controller. First seconds of the measurement can be unstable" ,
        action: "No actions required"
    ),

    WarningInfo(
        bit: 10,
        description: "Current through actuator was limited. Pressure measurement could be inaccurate" ,
        action: "No actions required"
    ),

    WarningInfo(
        bit: 11,
        description: "Pressure set-point changed to quickly after starting pressure controller. First seconds of the measurement can be unstable" ,
        action: "No actions required"
    ),

    WarningInfo(
        bit: 12,
        description: "The pressure controller indicates that the bellow is close to one of its end stop. Pressure measurement could be inaccurate" ,
        action: "No actions required"
    ),

    WarningInfo(
        bit: 13,
        description: "The pressure controller has problem tracking the set-point.Pressure measurement inaccurate" ,
        action: "No actions required"
    ),

    WarningInfo(
        bit: 14,
        description: "Reserved for Nova" ,
        action: "No actions required"
    ),

    WarningInfo(
        bit: 15,
        description: "Reserved" ,
        action: "No actions required"
    ),

    WarningInfo(
        bit: 16,
        description: "The advised time of 1.5 hours for measuring on a single cuff has exceeded." ,
        action: "Please switch to another cuff"
    ),

    WarningInfo(
        bit: 17,
        description: "BraCal is taking longer than 7 minutes" ,
        action: "Please finish the BraCal procedure"
    ),

    WarningInfo(
        bit: 18,
        description: "BraCal has been aborted as it took longer than 10 minutes" ,
        action: "Reperform the BraCal procedure and try keeping it short"
    ),
  ];



}

class WarningInfo{
  final int bit;
  final String description;
  final String action;

  WarningInfo({this.bit, this.description, this.action});
}