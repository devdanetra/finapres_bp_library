import 'package:finapres_bp_library/models/base/byte_model.dart';

class ErrorCode extends ByteModel {
  int errorCode;

  ErrorCode(this.errorCode) {
    calculateByteMessage();
  }

  @override
  void calculateByteMessage() {
    super.byte(errorCode);
  }

  List<ErrorInfo> getErrorsAsInfo() {
    List<bool> bits = [];
    List<ErrorInfo> currentWarning = [];

    bits = _byteToBits(super.byte);
    currentWarning = _searchWarning(bits);
    return currentWarning;
  }

  List<bool> _byteToBits(int byte) {
    List<bool> bits = [];

    while (byte > 0) {
      bits.add((byte % 2) as bool);
      byte = (byte / 2) as int;
    }

    return bits;
  }

  List<ErrorInfo> _searchWarning(List<bool> bits) {
    List<ErrorInfo> listOfActiveError = [];

    for (int index = 0; index < bits.length; index++) {
      if (bits.elementAt(index) == true) {
        listOfActiveError.add(ErrorType.errorType.elementAt(index));
      }
    }

    return listOfActiveError;
  }
}

class ErrorType {
  static List<ErrorInfo> errorType = [
    ErrorInfo(
        bit: 1,
        description: "Unknown error has occurred",
        action:
            "o Restart the system  If the error persists, have the device checked by Finapres Medical Systems B.V."),
    ErrorInfo(
        bit: 2,
        description: "The cuff cable is not connected to the Frontend Unit",
        action:
            "o Insert the connector and try again.\no Check if you are using the correct finger site (C1 or C2).\nA wire in the cuff cable may be broken. Try another finger cuff."),
    ErrorInfo(
        bit: 3,
        description:
            "A finger cuff hardware error. Unable to set correct LED current",
        action:
            "o Try another finger cuff.\nIf the error persists, contact Finapres Medical Systems B.V."),
    ErrorInfo(
        bit: 4,
        description:
            "A finger cuff hardware error. Unable to set correct LED current",
        action:
            "o Try another finger cuff.\nIf the error persists, contact Finapres Medical Systems B.V."),
    ErrorInfo(
        bit: 5,
        description:
            "A finger cuff hardware error. Unable to set correct LED current",
        action:
            "o Try another finger cuff. If the error persists, contact Finapres Medical Systems B.V."),
    ErrorInfo(
        bit: 6,
        description:
            "A finger cuff hardware error. LED current has drifted too much",
        action:
            "o Try another finger cuff. If the error persists, contact Finapres Medical Systems B.V."),
    ErrorInfo(
        bit: 7,
        description:
            "A finger cuff hardware error. LED current has drifted too much",
        action:
            "o Try another finger cuff. If the error persists, contact Finapres Medical Systems B.V."),
    ErrorInfo(
        bit: 8,
        description:
            "A finger cuff hardware error. LED voltage has drifted too much",
        action:
            "o Try another finger cuff. If the error persists, contact Finapres Medical Systems B.V."),
    ErrorInfo(
        bit: 9,
        description:
            "A finger cuff hardware error. LED voltage has drifted too much",
        action:
            "o Try another finger cuff. If the error persists, contact Finapres Medical Systems B.V."),
    ErrorInfo(
        bit: 10,
        description:
            "The infrared level transmitted through the finger is too high.\nThis may occur on very thin, nearly bloodless fingers.",
        action:
            "o Retry.\no Try a smaller finger cuff.If this fails wrap some thin cloth around the finger and replace the cuff. Use darker cloth when necessary."),
    ErrorInfo(
        bit: 11,
        description:
            "Odd plethysmogram detected, probably due to pressing the cuff or finger-tip.",
        action: "o Retry.\nMinimize finger movement."),
    ErrorInfo(
        bit: 12,
        description:
            "No plethysmogram can be detected during startup; probably the arteries are fully contracted or the cuff is rotated",
        action:
            "o Retry.\nTry another finger.\nWarm the hand.\nCheck proper application of the finger cuff."),
    ErrorInfo(
        bit: 13,
        description:
            "No plethysmogram can be detected after pressure staircase; probably the arteries are fully contracted or the cuff is rotated",
        action:
            "o Retry.\no Try another finger.\no Warm the hand.\nCheck proper application of the finger cuff"),
    ErrorInfo(
        bit: 14,
        description:
            "During the pressure staircase procedure at start-up or during a Physiocal, constant pressure levels were stable but level is incorrect",
        action:
            "o Check if the finger cuff air hose is inserted in the Frontend Unit.\no Check if you are using the correct finger site (C1 or C2).\noCheck for leaks or kinks.\nIf the error persists, have the device checked by Finapres Medical Systems B.V.."),
    ErrorInfo(
        bit: 15,
        description:
            "During the pressure staircase procedure at start-up or during a Physiocal, constant pressure levels were not stable enough",
        action:
            "o Retry.\no Check if the finger cuff air hose is inserted in the Frontend Unit.\nIf the error persists, have the device checked by Finapres Medical Systems B.V."),
    ErrorInfo(
        bit: 16,
        description: "Mean pressure too low when trying to perform a Physiocal",
        action:
            "o Retry.\nIf the error persists, have the device checked by Finapres Medical Systems B.V."),
    ErrorInfo(
        bit: 17,
        description: "Mean pressure has been below 10 mmHg for 2.5s",
        action:
            "o Retry.\nIf the error persists, have the device checked by Finapres Medical Systems B.V."),
    ErrorInfo(
        bit: 18,
        description:
            "The plethysmogram values moved out of range. This may be a movement artifact.",
        action: "o Retry."),
    ErrorInfo(
        bit: 19,
        description: "Mean pressure has been above 250 mmHg for 2.5s.",
        action:
            "o Retry.\nIf the error persists, have the device checked by Finapres Medical Systems B.V."),
    ErrorInfo(
        bit: 20,
        description: "Cuff pressure sensor out of range",
        action:
            "o Retry.\no Check if the finger cuff is wrapped tight enough around the finger.\nSee 'check air supply' and' connect cuff cable errors."),
    ErrorInfo(
        bit: 21,
        description: "Volume pressure sensor out of range",
        action:
            "o Retry.\no Check if the finger cuff is wrapped tight enough around the finger.\nSee 'check air supply' and' connect cuff cable errors."),
    ErrorInfo(
        bit: 22,
        description:
            "The system detected a pressure on the finger which is too high, automatically deflating for safety reasons",
        action:
            "o Warm the hand\no Check proper application of the finger cuff.\nIf the error persists, have the device checked by Finapres Medical Systems B.V.."),
    ErrorInfo(
        bit: 23,
        description: "Mean pressure has been above 250 mmHg for 2.5s.",
        action:
            "o Retry.\nIf the error persists, have the device checked by Finapres Medical Systems B.V."),
    ErrorInfo(
        bit: 24,
        description:
            "The system detected a pressure on the finger which is too high, automatically deflating for safety reasons",
        action:
            "o Warm the hand\no Check proper application of the finger cuff.\nIf the error persists, have the device checked by Finapres Medical Systems B.V.."),
    //ErrorInfo(bit: 25, description: "", action: ""),
    ErrorInfo(
        bit: 26,
        description: "Monitoring one of the internal voltages has failed",
        action:
            "o Please restart the Frontend Unit by reconnecting.\nIf the error persists, have the device checked by Finapres Medical Systems B.V.."),
    ErrorInfo(
        bit: 27,
        description: "Monitoring the reference voltage of the HCU has failed.",
        action:
            "o Please restart the Frontend Unit by reconnecting.\nIf the error persists, have the device checked by Finapres Medical Systems B.V.."),
    ErrorInfo(
        bit: 28,
        description:
            "Monitoring the reference voltage of the Plethysmograph has failed",
        action:
            "o Please restart the Frontend Unit by reconnecting.\nIf the error persists, have the device checked by Finapres Medical Systems B.V.."),
    ErrorInfo(
        bit: 29,
        description:
            "There has been a problem with sensing the temperature of the housing",
        action:
            "o Please restart the Frontend Unit by reconnecting.\nIf the error persists, have the device checked by Finapres Medical Systems B.V.."),
    ErrorInfo(
        bit: 30,
        description:
            "There has been a problem with sensing the temperature of the housing",
        action:
            "o Please restart the Frontend Unit by reconnecting.\nIf the error persists, have the device checked by Finapres Medical Systems B.V.."),
    ErrorInfo(
        bit: 31,
        description:
            "There has been a problem with sensing the temperature of the housing",
        action:
            "o Please restart the Frontend Unit by reconnecting.\nIf the error persists, have the device checked by Finapres Medical Systems B.V.."),
    ErrorInfo(
        bit: 32,
        description:
            "It has been detected that one of the supply voltages is out of range",
        action:
            "o Please restart the Frontend Unit by reconnecting.\nIf the error persists, have the device checked by Finapres Medical Systems B.V.."),
    ErrorInfo(
        bit: 33,
        description:
            "It has been detected that the HCU reference voltage is out of range",
        action:
            "o Please restart the Frontend Unit by reconnecting.\nIf the error persists, have the device checked by Finapres Medical Systems B.V.."),
    ErrorInfo(
        bit: 34,
        description:
            "It has been detected that the Plethysmograph reference voltage is out of range",
        action:
            "o Please restart the Frontend Unit by reconnecting.\nIf the error persists, have the device checked by Finapres Medical Systems B.V.."),
    ErrorInfo(
        bit: 35,
        description: "The offset of the cuff pressure sensor is too large",
        action:
            "o Please keep the Frontend Unit stable during its start-up.\nIf the error persists, have the device checked by Finapres Medical Systems B.V.."),
    ErrorInfo(
        bit: 36,
        description: "The offset of the volume pressure sensor is too large",
        action:
            "o Please keep the Frontend Unit stable during its start-up.\nIf the error persists, have the device checked by Finapres Medical Systems B.V.."),
    ErrorInfo(
        bit: 37,
        description:
            "Internal communication with one of the pressure sensor has problems",
        action:
            "o Please restart the Frontend Unit by reconnecting.\nIf the error persists, have the device checked by Finapres Medical Systems B.V.."),
    ErrorInfo(
        bit: 39,
        description:
            "The system detected a pressure on the finger which is too high, automatically deflating for safety reasons",
        action:
            "o Warm the hand.\no Check proper application of the finger cuff.\nIf the error persists, have the device checked by Finapres Medical Systems B.V.."),
    ErrorInfo(
        bit: 40,
        description: "The housing of the Frontend Unit is too hot",
        action:
            "o Please check convection possibilities around the device.\no Please check ambient temperature.\nIf the error persists, have the device checked by Finapres Medical Systems B.V.."),
    ErrorInfo(
        bit: 41,
        description: "The processor of the Frontend Unit is too hot",
        action:
            "o Please check convection possibilities around the device.\no Please check ambient temperature\nIf the error persists, have the device checked by Finapres Medical Systems B.V.."),
    ErrorInfo(
        bit: 42,
        description:
            "The maximum time of 4 hours for measuring on a single cuff has exceeded",
        action: "Please switch to another cuff."),
    ErrorInfo(
        bit: 43,
        description: "HCU offset is larger than 15 mmHg",
        action:
            "o Please retry zeroing.\nIf the error persists, have the device checked by Finapres Medical Systems B.V.."),
    ErrorInfo(
        bit: 44,
        description: "HCU can only be zeroed in idle mode",
        action: "Please stop the measurement if HCU zeroing is needed."),
    ErrorInfo(
        bit: 45,
        description: "The Keep Alive package has not been received in time",
        action:
            "Please check that the main connector is placed correctly in its socket"),
    ErrorInfo(
        bit: 46,
        description:
            "Internal I²C driver detected a communication problem. The driver will try to correct this problem itself",
        action:
            "o Please restart the measurement\nIf the error persists, have the device checked by Finapres Medical Systems B.V."),
  ];
}

class ErrorInfo {
  final int bit;
  final String description;
  final String action;

  ErrorInfo({this.bit, this.description, this.action});
}
