class NackError {

  final int bootLoaderOutOfOrderPacket = 0x01;
  final int bootLoaderFlashNotStarted = 0x02;
  final int messageNotAllowed = 0x07;
  final int parameterValueIsOutOf = 0x08;
  final int messageDataLengthIncorrect = 0xFC;
  final int notImplemented = 0xFD;
  final int notSupportedMessageID = 0xFE;
  final int unknownMessageID = 0xFF;
}