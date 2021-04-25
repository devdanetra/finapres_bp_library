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
    //bits.reversed.toList(); return a reversed list.
  };
}

class WarningType{
  static List<WarningInfo> warningTypes = [
    WarningInfo(bit: 1, description: "Unknown warning has occurred" , action: "If the warning is not cleared after sometime please try restarting device. " ),
    WarningInfo(bit: 2, description: "Unknown warning has occurred" , action: "If the warning is not cleared after sometime please try restarting device. " ),
    WarningInfo(bit: 3, description: "Unknown warning has occurred" , action: "If the warning is not cleared after sometime please try restarting device. " ),
    WarningInfo(bit: 4, description: "Unknown warning has occurred" , action: "If the warning is not cleared after sometime please try restarting device. " ),
    WarningInfo(bit: 5, description: "Unknown warning has occurred" , action: "If the warning is not cleared after sometime please try restarting device. " ),
    WarningInfo(bit: 6, description: "Unknown warning has occurred" , action: "If the warning is not cleared after sometime please try restarting device. " ),
    WarningInfo(bit: 7, description: "Unknown warning has occurred" , action: "If the warning is not cleared after sometime please try restarting device. " ),
    WarningInfo(bit: 8, description: "Unknown warning has occurred" , action: "If the warning is not cleared after sometime please try restarting device. " ),
    WarningInfo(bit: 9, description: "Unknown warning has occurred" , action: "If the warning is not cleared after sometime please try restarting device. " ),
    //TODO Finish This...
  ];
}

class WarningInfo{
  final int bit;
  final String description;
  final String action;

  WarningInfo({this.bit, this.description, this.action});
}