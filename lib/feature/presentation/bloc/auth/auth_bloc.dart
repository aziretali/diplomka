import 'package:auth_mega_lesson/feature/domain/repositories/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.repo,
  }) : super(AuthInitial()) {
    on<AuthSendNumberEvent>(_sendNumber);
  }

  late final AuthRepo repo;

  Future<void> _sendNumber(
    AuthSendNumberEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    await Future.delayed(const Duration(seconds: 2));

    final result = await repo.sendNumber(phone: event.phoneNumber);

    if (result) {
      emit(AuthSuccess());
    } else {
      emit(AuthError());
    }
  }
}

////////
///
///
@immutable
abstract class AuthEvent {}

class AuthSendNumberEvent extends AuthEvent {
  AuthSendNumberEvent({required this.phoneNumber});
  final String phoneNumber;
}

////
///
///
@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthError extends AuthState {}
