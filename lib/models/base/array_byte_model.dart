
import 'dart:typed_data';

abstract class ArrayByteModel {

  Uint8List _bytes;

  get bytes => _bytes;

  void add(int value) => _bytes.add(value);

  void generateBytes();

}