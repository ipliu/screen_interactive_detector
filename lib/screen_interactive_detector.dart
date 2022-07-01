
import 'screen_interactive_detector_platform_interface.dart';

class ScreenInteractiveDetector {
  static Future<bool?> isInteractive() {
    return ScreenInteractiveDetectorPlatform.instance.isInteractive();
  }
}
