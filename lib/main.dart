import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viewing_nz/core/services/router.dart';
import 'package:viewing_nz/core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const ViewingNZApp());
}

class ViewingNZApp extends StatelessWidget {
  const ViewingNZApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ViewingNZ',
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      routerConfig: router,
    );
  }
}
