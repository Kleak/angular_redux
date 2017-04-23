import 'dart:html';
import 'package:logging/logging.dart';

class AppConfig {
  final Logger logger;

  AppConfig({Level level: Level.ALL}) : logger = Logger.root {
    logger.level = level;
    logger.onRecord.listen(_onRecord);
  }

  void _onRecord(LogRecord record) {
    if (record.level <= Level.CONFIG) {
      window.console.info(record.toString());
    } else if (record.level >= Level.CONFIG && record.level < Level.WARNING) {
      window.console.log(record.toString());
    } else if (record.level == Level.WARNING) {
      window.console.warn(record.toString());
    } else if (record.level >= Level.SEVERE) {
      window.console.error(record.toString());
    }
  }
}
