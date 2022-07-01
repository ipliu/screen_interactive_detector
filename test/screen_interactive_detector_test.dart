import 'package:flutter_test/flutter_test.dart';
import 'package:screen_interactive_detector/screen_interactive_detector.dart';
import 'package:screen_interactive_detector/screen_interactive_detector_platform_interface.dart';
import 'package:screen_interactive_detector/screen_interactive_detector_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockScreenInteractiveDetectorPlatform 
    with MockPlatformInterfaceMixin
    implements ScreenInteractiveDetectorPlatform {

  @override
  Future<bool?> isInteractive() => Future.value(true);
}

void main() {
  final ScreenInteractiveDetectorPlatform initialPlatform = ScreenInteractiveDetectorPlatform.instance;

  test('$MethodChannelScreenInteractiveDetector is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelScreenInteractiveDetector>());
  });

  test('isInteractive', () async {
    MockScreenInteractiveDetectorPlatform fakePlatform = MockScreenInteractiveDetectorPlatform();
    ScreenInteractiveDetectorPlatform.instance = fakePlatform;
  
    expect(await ScreenInteractiveDetector.isInteractive(), true);
  });
}
