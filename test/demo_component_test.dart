@Tags(const ['aot'])
@TestOn('browser')

import 'package:angular2/angular2.dart';
import 'package:angular_test/angular_test.dart';
import 'package:basic/components/demo/demo.dart';
import 'package:basic/components/demo/demo_page_object.dart';
import 'package:basic/store.dart';
import 'package:redux/redux.dart';
import 'package:test/test.dart';

@AngularEntrypoint()
void main() {
  tearDown(disposeAnyRunningTest);


  test('counter value should be "0"', () async {
    final store = createStore();

    final testBed = new NgTestBed<DemoComponent>()
        .addProviders([provide(Store, useValue: store)]);
    final testFixture = await testBed.create();
    final page = await testFixture.resolvePageObject<DemoComponentPO>(DemoComponentPO);

    expect(await page.counterValue.innerText, "0");
  });

  test('test increment and should be "1"', () async {
    final store = createStore();

    final testBed = new NgTestBed<DemoComponent>()
        .addProviders([provide(Store, useValue: store)]);
    final testFixture = await testBed.create();
    final page = await testFixture.resolvePageObject<DemoComponentPO>(DemoComponentPO);
    await page.increment();

    expect(await page.counterValue.innerText, "1");
  });

  test('test decrement and shoul be "0"', () async {
    final store = createStore();

    final testBed = new NgTestBed<DemoComponent>()
        .addProviders([provide(Store, useValue: store)]);
    final testFixture = await testBed.create();
    final page = await testFixture.resolvePageObject<DemoComponentPO>(DemoComponentPO);
    await page.decrement();

    expect(await page.counterValue.innerText, "-1");
  });
}
