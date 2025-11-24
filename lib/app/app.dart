import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'router/app_router.dart';
import 'theme/app_theme.dart';
import 'theme/theme_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProv = Provider.of<ThemeProvider>(context);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeProv.themeMode,
      routerConfig: AppRouter.router,
    );
  }
}
