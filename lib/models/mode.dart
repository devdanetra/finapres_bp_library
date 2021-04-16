
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

  static final int startingUp = 0;
  static final int idle = 16;
  static final int measure = 48;
  static final int service = 64;
  static final int bootLoader = 112;
  static final int error = 240;
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