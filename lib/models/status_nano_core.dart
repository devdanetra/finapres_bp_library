import 'dart:typed_data';
import 'package:finapres_bp_library/models/cuff_control.dart';
import 'package:finapres_bp_library/models/model_flow.dart';
import 'package:finapres_bp_library/models/physiocal.dart';
import 'base/array_byte_model.dart';
import 'cuff.dart';
import 'errors/error_code.dart';
import 'misc.dart';
import 'mode.dart';

class StatusNanoCore extends ArrayByteModel {
  final Mode mode;
  final ErrorCode error;
  final Uint8List warning;
  final Misc misc;
  final Cuff cuff;
  final Physiocal physiocal;
  final int beatsTillPhysiocal;
  final int physiocalIntervall;
  final CuffControl cuffControl;
  final ModelFlow modelFlow;

  StatusNanoCore(
      this.mode,
      this.error,
      this.warning,
      this.misc,
      this.cuff,
      this.physiocal,
      this.beatsTillPhysiocal,
      this.physiocalIntervall,
      this.cuffControl,
      this.modelFlow) {
    generateBytes();
  }

  @override
  void generateBytes() {
    //super.add(this.error) TODO Finish this
    //super.add(this.warning)
    super.add(this.misc.byte);
    super.add(this.cuff.byte);
    super.add(this.physiocal.byte);
    super.add(this.beatsTillPhysiocal);
    super.add(this.physiocalIntervall);
    super.add(this.cuffControl.byte);
    super.add(this.modelFlow.byte);
  }
}
