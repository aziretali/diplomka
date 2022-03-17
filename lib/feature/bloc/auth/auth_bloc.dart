import 'package:auth_mega_lesson/feature/data/repositories/auth_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.repo,
  }) : super(AuthInitial()) {
    on<AuthSendNumberEvent>(_sendNumber);
    on<AuthSendSmsEvent>(_sendSms);
  }

  late final AuthRepoImpl repo;

  Future<void> _sendNumber(
    AuthSendNumberEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    await Future.delayed(const Duration(seconds: 2));
    try {
      final result = await repo.sendNumber(phone: event.phoneNumber);
      emit(AuthSuccess(token: result.object ?? ''));
    } catch (e) {
      emit(AuthError());
    }
  }

  Future<void> _sendSms(
    AuthSendSmsEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    await Future.delayed(const Duration(seconds: 2));
    try {
      final result = await repo.sendSms(
        sms: event.sms,
        token: event.token,
      );
      emit(AuthSuccess(token: ''));
    } catch (e) {
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

class AuthSendSmsEvent extends AuthEvent {
  AuthSendSmsEvent({
    required this.sms,
    required this.token,
  });
  final String sms;
  final String token;
}

////
///
///
@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  AuthSuccess({required this.token});
  final String token;
}

class AuthError extends AuthState {}
