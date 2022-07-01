import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'screen_interactive_detector_platform_interface.dart';

/// An implementation of [ScreenInteractiveDetectorPlatform] that uses method channels.
class MethodChannelScreenInteractiveDetector extends ScreenInteractiveDetectorPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('screen_interactive_detector');

  @override
  Future<bool?> isInteractive() async {
    return await methodChannel.invokeMethod<bool>('isInteractive');
  }
}
