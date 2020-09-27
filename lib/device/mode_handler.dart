/*
 * Copyright (c) 2020. Francesco D'anetra
 */

import 'dart:async';

import 'command_handler.dart';

enum Mode{
  Unavailable,
  BootSelfTest,
  Idle,
  Measure,
  Error,
  Service
}

class ModeHandler{
  Mode _currentMode;
  bool _inTransition;
  Command _onGoingCommand;
  List<Command> _fullyAvailableCommands;
  List<Command> _onlyReadAvailableCommands;
  StreamController _modeController;

  ModeHandler(this._modeController){
    this._currentMode = Mode.Unavailable;
    this._inTransition = false;
    this._onGoingCommand = Command.Unavailable;
    this._fullyAvailableCommands = new List<Command>();
    this._onlyReadAvailableCommands = new List<Command>();
  }

  StreamController get modeController => _modeController;

  List<Command> get onlyReadAvailableCommands => _onlyReadAvailableCommands;

  List<Command> get fullyAvailableCommands => _fullyAvailableCommands;

  Command get onGoingCommand => _onGoingCommand;

  bool get inTransition => _inTransition;

  Mode get currentMode => _currentMode;


  void terminateHandler(){
  }


}

