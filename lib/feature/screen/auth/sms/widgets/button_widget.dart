part of '../sms_screen.dart';

class _ButtonWidget extends StatelessWidget {
  const _ButtonWidget({
    Key? key,
    required this.token,
  }) : super(key: key);

  final String token;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProviderSmsAuth>();
    return BlocProvider.value(
      value: AuthBloc(
        repo: RepositoryProvider.of<AuthRepoImpl>(context),
      ),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyHomePage(title: ''),
              ),
            );
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Произошла ошибка, повторите'),
              ),
            );
          }
        },
        builder: (context, state) {
          return SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (state is! AuthLoading && vm.isFullFilled.value) {
                  BlocProvider.of<AuthBloc>(context).add(
                    AuthSendSmsEvent(
                      token: token,
                      sms: vm.smsController.text,
                    ),
                  );
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  vm.isFullFilled.value
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
            ),
          );
        },
      ),
    );
  }
}
