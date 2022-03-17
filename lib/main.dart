import 'package:auth_mega_lesson/feature/bloc/auth/auth_bloc.dart';
import 'package:auth_mega_lesson/feature/data/dio_settings/dio_settings.dart';
import 'package:auth_mega_lesson/feature/data/repositories/auth_repo_impl.dart';
import 'package:auth_mega_lesson/feature/widgets/app_unfocuser.dart';
import 'package:auth_mega_lesson/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'feature/screen/auth/auth_phone/phone_auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InitWidget(
      child: MaterialApp(
        title: 'Flutter Demo',
        darkTheme: AppTheme.darkTheme,
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        home: const AppUnfocuser(
          child: AuthScreenPhone(),
        ),
      ),
    );
  }
}

class InitWidget extends StatelessWidget {
  const InitWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) => AuthRepoImpl(
            dio: RepositoryProvider.of<DioSettings>(context).dio,
          ),
        ),
      ],
      child: BlocProvider(
        create: (context) => AuthBloc(
          repo: RepositoryProvider.of<AuthRepoImpl>(context),
        ),
        child: child,
      ),
    );
  }
}
