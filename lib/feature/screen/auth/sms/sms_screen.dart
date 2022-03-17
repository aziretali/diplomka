import 'package:auth_mega_lesson/feature/bloc/auth/auth_bloc.dart';
import 'package:auth_mega_lesson/feature/data/repositories/auth_repo_impl.dart';
import 'package:auth_mega_lesson/feature/screen/auth/sms/provider.dart';
import 'package:auth_mega_lesson/feature/screen/home/home_screen.dart';
import 'package:auth_mega_lesson/feature/widgets/fields/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

part 'widgets/body.dart';
part 'widgets/button_widget.dart';

class SmsScreen extends StatelessWidget {
  const SmsScreen({
    Key? key,
    required this.token,
  }) : super(key: key);

  final String token;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderSmsAuth(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _Body(token: token),
          ),
        ),
      ),
    );
  }
}
