part of 'authorization_bloc_bloc.dart';

abstract class AuthorizationBlocEvent extends Equatable {
  const AuthorizationBlocEvent();
}

class CreateAccountEvent extends AuthorizationBlocEvent {
  @override
  List<Object?> get props => [];
}

class SignInAccountEvent extends AuthorizationBlocEvent {
  @override
  List<Object?> get props => [];
}

class SignOutEvent extends AuthorizationBlocEvent {
  @override
  List<Object?> get props => [];
}

class ChangeLoginTypeEvent extends AuthorizationBlocEvent {
  @override
  List<Object?> get props => [];
}
