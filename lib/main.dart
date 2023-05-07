import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/constants/app_info.dart';
import 'feature/presentation/page/home/page.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  print(cameras);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppInfo.name,
      theme: ThemeData(
        primarySwatch: AppColors.primary,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0.5,
          titleTextStyle: TextStyle(
            fontSize: AppPixels.titleSize,
            color: AppColors.titleColor,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.statusBarColor,
            statusBarBrightness: AppTheme.statusBrightness,
            statusBarIconBrightness: AppTheme.statusBrightness,
          ),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 24),
          titleMedium: TextStyle(fontSize: 18),
          titleSmall: TextStyle(fontSize: 16),
          bodyLarge: TextStyle(fontSize: 16),
          bodyMedium: TextStyle(fontSize: 14),
          bodySmall: TextStyle(fontSize: 12),
        ),
      ),
      home: const HomePage(),
    );
  }
}
