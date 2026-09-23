import 'package:flutter/material.dart';

import 'core/widgets/network_listener.dart';
import 'features/home/home_page.dart';
import 'ui/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netzwerkstatus',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.buildTheme(Brightness.light),
      darkTheme: AppTheme.buildTheme(Brightness.dark),
      themeMode: ThemeMode.dark,
      home: const NetworkListener(child: HomePage()),
    );
  }
}
