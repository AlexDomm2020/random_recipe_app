// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:lyrics_app/authentication/data/authorization_repository_impl.dart';

part 'authorization_bloc_event.dart';
part 'authorization_bloc_state.dart';

class AuthorizationBlocBloc
    extends Bloc<AuthorizationBlocEvent, AuthorizationBlocState> {
  final AuthorizationRepositoryImpl authorizationRepositoryImpl;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLogin = true;
  AuthorizationBlocBloc({required this.authorizationRepositoryImpl})
      : super(AuthorizationBlocInitial()) {
    on<CreateAccountEvent>((event, emit) async {
      emit(AuthorizationBlocLoadingState());
      try {
        await authorizationRepositoryImpl.createUserWithEmailAndPassword(
            emailController.text, passwordController.text);
        emit(AuthorizationBlocSuccessState());
      } catch (e) {
        emit(AuthorizationBlocErrorState(e.toString()));
      }
    });

    on<SignInAccountEvent>((event, emit) async {
      emit(AuthorizationBlocLoadingState());
      try {
        await authorizationRepositoryImpl.signInWithEmailAndPassword(
            emailController.text, passwordController.text);
        emit(AuthorizationBlocSuccessState());
      } catch (e) {
        emit(AuthorizationBlocErrorState(e.toString()));
      }
    });

    on<SignOutEvent>((event, emit) async {
      emit(AuthorizationBlocLoadingState());
      try {
        await authorizationRepositoryImpl.signOut();
        emit(AuthorizationBlocSuccessState());
      } catch (e) {
        emit(AuthorizationBlocErrorState(e.toString()));
      }
    });

    on<ChangeLoginTypeEvent>((event, emit) => {
          if (isLogin)
            {
              emit(AuthorizationBlocChangeLoginTypeState(false)),
              isLogin = false
            }
          else
            {emit(AuthorizationBlocChangeLoginTypeState(true)), isLogin = true}
        });
  }
}
