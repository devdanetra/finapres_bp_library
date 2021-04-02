
import 'base/byte_model.dart';

class Physiocal extends ByteModel{
  final int physiocalState;
  final int spareStatus;
  final int quality;

  Physiocal(this.physiocalState, this.spareStatus, this.quality){
    calculateByteMessage();
  }

  @override
  void calculateByteMessage(){
    super.byte = this.physiocalState + this.spareStatus + this.quality;
  }

}

class PhysiocalState {
  final int turnedOff = 0;
  final int idle = 64;
  final int scanActive = 128;
  final int adjustActive = 192;
}

class Quality {
  final int off = 0;
  final int uncertain = 2;
  final int ceryInadequate = 3;
  final int inadequate = 4;
  final int sufficient = 5;
  final int useful = 6;
  final int good = 7;
  final int great = 8;
  final int exellent = 9;

}