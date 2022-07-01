# screen_interactive_detector

Flutter Plugin to detect if device is in lock screen.
Useful for determining whether app entered background due to locking screen or leaving app.

## Usage

Import library and call the following method.
> NOTE: this plugin only works on physical device for iOS.

```dart
import 'package:screen_interactive_detector/screen_interactive_detector.dart';
...
bool? isInteractive = await ScreenInteractiveDetector.isInteractive();
}
```

You will probably observe the AppLifecycleState with a WidgetsBindingObserver and call this when app is in background:

```dart
@override
void didChangeAppLifecycleState(AppLifecycleState state) async {
  super.didChangeAppLifecycleState(state);
  switch (state) {
    case AppLifecycleState.resumed:
      debugPrint('app resumed');
      if (mounted) setState(() {});
      break;
    case AppLifecycleState.inactive:
      if (Platform.isAndroid) {
        _isInteractive = await ScreenInteractiveDetector.isInteractive();
        debugPrint('app inactive, is screen interactive: $_isInteractive');
      }
      break;
    case AppLifecycleState.paused:
      if (Platform.isIOS) {
        _isInteractive = await ScreenInteractiveDetector.isInteractive();
        debugPrint('app paused, is screen interactive: $_isInteractive');
      }
      break;
    case AppLifecycleState.detached:
      break;
  }
}
```

[See example app code for details](/example/lib/main.dart)

## Licenses

All source code is licensed under the [MIT License](/LICENSE).

