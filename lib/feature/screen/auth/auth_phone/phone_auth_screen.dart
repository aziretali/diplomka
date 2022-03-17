import 'package:auth_mega_lesson/feature/bloc/auth/auth_bloc.dart';
import 'package:auth_mega_lesson/feature/data/repositories/auth_repo_impl.dart';
import 'package:auth_mega_lesson/feature/screen/auth/auth_phone/provider.dart';
import 'package:auth_mega_lesson/feature/screen/auth/sms/sms_screen.dart';
import 'package:auth_mega_lesson/feature/widgets/fields/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

part 'widgets/body.dart';
part 'widgets/button_widget.dart';

class AuthScreenPhone extends StatelessWidget {
  const AuthScreenPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderAuth(),
      child: const Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: _Body(),
          ),
        ),
      ),
    );
  }
}
