import 'package:check_network_connectivity/ui/app_theme.dart';
import 'package:flutter/material.dart';

import 'core/widgets/network_listener.dart';
import 'features/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.buildTheme(Brightness.light),
      darkTheme: AppTheme.buildTheme(Brightness.dark),
      themeMode: ThemeMode.system,
      home: const NetworkListener(child: HomePage()),
    );
  }
}
