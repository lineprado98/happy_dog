import 'package:flutter/material.dart';
import 'package:happy_dog/shared/routes/app_routes.dart';
import 'package:happy_dog/shared/theme/app_text_theme.dart';
import 'package:happy_dog/shared/theme/color_schemes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
        textTheme: TextThemeApp.theme(lightColorScheme),
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        textTheme: TextThemeApp.theme(darkColorScheme),
        colorScheme: darkColorScheme,
        appBarTheme: const AppBarTheme(color: Colors.black),
        useMaterial3: true,
      ),
      routerConfig: AppRouter.routes,
    );
  }
}
