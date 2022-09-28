part of 'authorization_bloc_bloc.dart';

abstract class AuthorizationBlocState extends Equatable {}

class AuthorizationBlocInitial extends AuthorizationBlocState {
  @override
  List<Object?> get props => [];
}

class AuthorizationBlocLoadingState extends AuthorizationBlocState {
  @override
  List<Object?> get props => [];
}

class AuthorizationBlocSuccessState extends AuthorizationBlocState {
  @override
  List<Object?> get props => [];
}

class AuthorizationBlocChangeLoginTypeState extends AuthorizationBlocState {
  AuthorizationBlocChangeLoginTypeState(this.isLogin);

  final bool isLogin;

  @override
  List<Object?> get props => [isLogin];
}

class AuthorizationBlocErrorState extends AuthorizationBlocState {
  AuthorizationBlocErrorState(this.error);

  final String error;

  @override
  List<Object?> get props => [error];
}
