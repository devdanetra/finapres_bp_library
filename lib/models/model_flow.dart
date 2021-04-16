
import 'base/byte_model.dart';

class ModelFlow extends ByteModel{
  final int calibrationAllowed;
  final int patient;
  final int FCF;
  final int calibrationStatus;
  final int modelFlowStatus;


  ModelFlow(this.calibrationAllowed, this.patient, this.FCF, this.calibrationStatus, this.modelFlowStatus){
    calculateByteMessage();
  }

  @override
  void calculateByteMessage(){
    super.byte = this.calibrationAllowed + this.patient + this.FCF + this.calibrationStatus + this.modelFlowStatus;
  }

}

class ModelFlowStatus {
  final int notActiveMissingData = 0;
  final int notActiveDataProvided = 1;
  final int activeMeasuring = 2;
  final int activePerforming = 3;
}
class CalibrationStatus {
  final int notApplied = 0;
  final int appliedByBraCal = 8;
  final int appliedByStoredValues = 16;
}
class FCF {
  final int notChanged = 0;
  final int changed = 32;
}
class Patient {
  final int dataNotSent = 0;
  final int dataSent = 64;
}
class CalibrationAllowed {
  final int braCalNotPossible = 0;
  final int braCalAllowed = 128;
}