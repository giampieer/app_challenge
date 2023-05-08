import 'dart:developer';
import 'package:logger/logger.dart';

class ConsoleOutputCustom extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      log(line);
    }
  }
}
