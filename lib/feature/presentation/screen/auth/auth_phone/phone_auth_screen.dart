import 'package:auth_mega_lesson/feature/data/repositories/auth_repo/auth_repo_impl.dart';
import 'package:auth_mega_lesson/feature/presentation/bloc/auth/auth_bloc.dart';
import 'package:auth_mega_lesson/feature/presentation/screen/auth/sms/sms_screen.dart';
import 'package:auth_mega_lesson/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreenPhone extends StatefulWidget {
  const AuthScreenPhone({Key? key}) : super(key: key);

  @override
  State<AuthScreenPhone> createState() => _AuthScreenPhoneState();
}

class _AuthScreenPhoneState extends State<AuthScreenPhone> {
  final controller = TextEditingController();
  final isFullFilled = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Укажите номер телефона \nдля авторизации',
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              TextField(
                controller: controller,
                onChanged: (value) {
                  if (value.length == 10) {
                    isFullFilled.value = true;
                  } else {
                    isFullFilled.value = false;
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Введите номер телефона',
                  border: OutlineInputBorder(
                    borderRadius: AppTheme.br,
                    borderSide: const BorderSide(width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              RepositoryProvider(
                create: (context) => AuthRepoImpl(),
                child: BlocProvider(
                  create: (context) => AuthBloc(
                    repo: RepositoryProvider.of<AuthRepoImpl>(context),
                  ),
                  child: BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccess) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SmsScreen(),
                          ),
                        );
                      }
                      if (state is AuthError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('ERRROR'),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ValueListenableBuilder(
                            valueListenable: isFullFilled,
                            builder: (context, _, __) {
                              return ElevatedButton(
                                onPressed: () {
                                  if (state is! AuthLoading &&
                                      isFullFilled.value) {
                                    BlocProvider.of<AuthBloc>(context).add(
                                      AuthSendNumberEvent(
                                        phoneNumber: controller.text,
                                      ),
                                    );
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    isFullFilled.value
                                        ? Colors.blue
                                        : Colors.blue.withOpacity(0.5),
                                  ),
                                ),
                                child: state is AuthLoading
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Text(
                                        'Отправить смс-код'.toUpperCase(),
                                      ),
                              );
                            }),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
