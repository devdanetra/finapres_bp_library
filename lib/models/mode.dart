
import 'base/byte_model.dart';

class Mode extends ByteModel{
  final int mainMode;
  final int subMode;
  final int transition;

  Mode(this.mainMode, this.subMode, this.transition){
    calculateByteMessage();
  }

  @override
  void calculateByteMessage(){
    super.byte = this.mainMode + this.subMode + this.transition;
  }

}

class MainMode {

  final int startingUp = 0;
  final int idle = 16;
  final int measure = 48;
  final int service = 64;
  final int bootLoader = 112;
  final int error = 240;
}


class SubMode {
  static final int idle = 0;
  static final int flashErased = 2;
  static final int boardErased = 4;
}

class Transition {
  static final int on = 1;
  static final int off = 0;
}