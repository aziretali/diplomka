part of '../phone_auth_screen.dart';

class _ButtonWidget extends StatelessWidget {
  const _ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProviderAuth>();
    return BlocProvider(
      create: (context) => AuthBloc(
        repo: RepositoryProvider.of<AuthRepoImpl>(context),
      ),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SmsScreen(token: state.token),
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
                    AuthSendNumberEvent(
                      phoneNumber: vm.phoneController.text,
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
