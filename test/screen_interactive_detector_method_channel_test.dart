import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:screen_interactive_detector/screen_interactive_detector_method_channel.dart';

void main() {
  MethodChannelScreenInteractiveDetector platform = MethodChannelScreenInteractiveDetector();
  const MethodChannel channel = MethodChannel('screen_interactive_detector');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return true;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('isInteractive', () async {
    expect(await platform.isInteractive(), true);
  });
}
