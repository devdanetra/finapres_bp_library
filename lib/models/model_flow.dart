//
// import 'base/byte_model.dart';
//
// class ModelFlow extends ByteModel{
//   final int calibrationAllowed;
//   final int patient;
//   final int FCF;
//   final int calibrationStatus;
//   final int modelFlowStatus;
//
//
//   ModelFlow(this.calibrationAllowed, this.patient, this.FCF, this.calibrationStatus, this.modelFlowStatus){
//     calculateByteMessage();
//   }
//
//   @override
//   void calculateByteMessage(){
//     super.byte = this.calibrationAllowed + this.patient + this.FCF + this.calibrationStatus + this.modelFlowStatus;
//   }
//
// }
//
// class ModelFlowStatus {
//   final int notActiveMissingData = 0;
//   final int notActiveDataProvided = 1;
//   final int ActiveMeasuring = 2;
//   final int ActivePerforming = 3;
// }
// class CalibrationStatus {
//   final int notApplied = 0;
//   final int appliedByBraCal = 8;
//   final int appliedByStoredValues = 16;
// }
// class FCF {
//   final int notChanged = 0;
//   final int changed = 16;
// }
// class Patient {
//   final int retriesAlreadyPerformed = 0x1e;
//   final int finalRetryAttempt = 0x1f;
// }
// class CalibrationAllowed {
//   final int retriesAlreadyPerformed = 0x1e;
//   final int finalRetryAttempt = 0x1f;
// }