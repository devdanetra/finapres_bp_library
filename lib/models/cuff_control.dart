
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
  final int retriesAlreadyPerformed = 0x1e;
  final int finalRetryAttempt = 0x1f;
}

class Status {
  final int cuffControlDisabled = 0;
  final int cuffControlEnabled = 2;
  final int cuffControlSuspended = 3;
  final int cuffControlSuspendedWithSwitch = 4;
  final int busySwitchingCuff = 5;
  final int switchingFailedInternalError = 6;
  final int switchingFailedError = 7;
}