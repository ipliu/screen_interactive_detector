import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'screen_interactive_detector_method_channel.dart';

abstract class ScreenInteractiveDetectorPlatform extends PlatformInterface {
  /// Constructs a ScreenInteractiveDetectorPlatform.
  ScreenInteractiveDetectorPlatform() : super(token: _token);

  static final Object _token = Object();

  static ScreenInteractiveDetectorPlatform _instance = MethodChannelScreenInteractiveDetector();

  /// The default instance of [ScreenInteractiveDetectorPlatform] to use.
  ///
  /// Defaults to [MethodChannelScreenInteractiveDetector].
  static ScreenInteractiveDetectorPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ScreenInteractiveDetectorPlatform] when
  /// they register themselves.
  static set instance(ScreenInteractiveDetectorPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool?> isInteractive() {
    throw UnimplementedError('isInteractive() has not been implemented.');
  }
}
