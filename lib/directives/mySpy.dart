import 'package:angular2/angular2.dart';
import 'package:basic/config.dart';
import 'package:logging/logging.dart';

@Directive(selector: '[mySpy]')
class SpyDirective implements OnInit, OnDestroy {
  final Logger _logger;

  SpyDirective(AppConfig config) : _logger = config.logger;

  @override
  void ngOnInit() => _logger.info("OnInit");

  @override
  void ngOnDestroy() => _logger.info("OnDestroy");
}
