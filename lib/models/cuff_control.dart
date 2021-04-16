
import 'base/byte_model.dart';

class CuffControl extends ByteModel{
  final int retryNumber;
  final int status;


  CuffControl(this.retryNumber, this.status){
    calculateByteMessage();
  }

  @override
  void calculateByteMessage(){
    super.byte = this.retryNumber + this.status;
  }

}

class RetryNumber {
  final int retriesAlreadyPerformed = 240;
  final int finalRetryAttempt = 248;
}

class Status {
  final int disabled = 0;
  final int enabled = 2;
  final int suspended = 3;
  final int suspendedWithSwitch = 4;
  final int busySwitchingCuff = 5;
  final int switchingFailedInternalError = 6;
  final int switchingFailedError = 7;
}