
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

class  MinutesTillSwitch {

  final int automaticCuffControlDisabled = 0;
  final int switchingCuffNow = 248;
}
class CurrentCuff {
  final int cuff1 = 1;
  final int cuff2 = 2;
}