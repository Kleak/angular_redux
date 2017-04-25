import 'package:build_runner/build_runner.dart';
import 'package:sass_builder/phase.dart';

void main() {
  watch(new PhaseGroup()..addPhase(sassPhase), deleteFilesByDefault: true);
}
