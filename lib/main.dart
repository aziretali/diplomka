import 'package:auth_mega_lesson/theme/theme.dart';
import 'package:flutter/material.dart';

import 'feature/presentation/screen/auth/auth_phone/phone_auth_screen.dart';
import 'feature/presentation/widgets/app_unfocuser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: const AppUnfocuser(child: AuthScreenPhone()),
    );
  }
}
