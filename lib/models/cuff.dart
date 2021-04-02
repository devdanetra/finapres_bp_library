
import 'base/byte_model.dart';

class Cuff extends ByteModel{
  final int minutesTillSwitch;
  final int currentCuff;

  Cuff(this.minutesTillSwitch,this.currentCuff){
    calculateByteMessage();
  }

  @override
  void calculateByteMessage(){
    super.byte = this.minutesTillSwitch + this.currentCuff ;
  }

}

class minutesTillSwitch {

  final int automaticCuffControlDisabled = 0;
  final int switchingCuffNow = 0x3e;
}
class currentCuff {
  final int cuff1 = 1;
  final int cuff2 = 2;
}