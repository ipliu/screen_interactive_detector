import 'dart:io';

import 'package:flutter/material.dart';
import 'package:screen_interactive_detector/screen_interactive_detector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  bool? _isInteractive;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Screen Interactive Detector'),
        ),
        body: Center(
          child: Text('Is screen interactive: $_isInteractive\n'),
        ),
      ),
    );
  }
}
