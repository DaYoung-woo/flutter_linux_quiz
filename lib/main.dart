import 'package:flutter/material.dart';
import 'package:flutter_plandly/screen/home_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Future.delayed(const Duration(seconds: 3), () {
    // 딜레이 후에 네이티브 스플래시 화면을 해제하고 앱을 실행
    FlutterNativeSplash.remove();
    runApp(
      MaterialApp(
        home: HomeScreen(),
      ),
    );
  });
}
