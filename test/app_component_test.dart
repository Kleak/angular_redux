@Tags(const ['aot'])
@TestOn('browser')
import 'dart:html';

import 'package:angular2/angular2.dart';
import 'package:angular_test/angular_test.dart';
import 'package:basic/app_component.dart';
import 'package:test/test.dart';

@AngularEntrypoint()
void main() {
  tearDown(disposeAnyRunningTest);

  test('should render "My first angular dart app"', () async {
    final testBed = new NgTestBed<AppComponent>();
    final testFixture = await testBed.create();
    expect(true, testFixture.text.contains('My first angular dart app'));
  });

  test('should render title in a h1 tag', () async {
    final testBed = new NgTestBed<AppComponent>();
    final testFixture = await testBed.create();
    final compiled = testFixture.rootElement;
    final HeadingElement h1 = compiled.querySelector('h1');
    expect(true, h1.text.contains('My first angular dart app'));
  });
}
