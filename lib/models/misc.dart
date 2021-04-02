
import 'base/byte_model.dart';

class Misc extends ByteModel{
  final int HCU;
  final int HCUSettings;
  final int SpareBits;

  Misc(this.HCU, this.HCUSettings, this.SpareBits){
    calculateByteMessage();
  }

  @override
  void calculateByteMessage(){
    super.byte = this.HCU + this.HCUSettings + this.SpareBits;
  }

}

class HCU {

  final int notConnected = 0;
  final int notZeroed = 32;
  final int zeroedUncertain = 64;
  final int reconnected = 96;
  final int zeroingAtTheMoment = 128;
}


