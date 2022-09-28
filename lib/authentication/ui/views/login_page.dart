import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyrics_app/authentication/data/authorization_repository_impl.dart';
import 'package:lyrics_app/authentication/ui/bloc/bloc/authorization_bloc_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  String? errorMessage = "";

  Widget entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: title),
    );
  }

  Widget submitButton(BuildContext context, bool isLogin) {
    return ElevatedButton(
      onPressed: () {
        isLogin
            ? BlocProvider.of<AuthorizationBlocBloc>(context)
                .add(SignInAccountEvent())
            : BlocProvider.of<AuthorizationBlocBloc>(context)
                .add(CreateAccountEvent());
      },
      child: Text(isLogin ? "Login" : "Register"),
    );
  }

  Widget loginOrRegisterButton(BuildContext context, bool isLogin) {
    return TextButton(
        onPressed: () {
          BlocProvider.of<AuthorizationBlocBloc>(context)
              .add(ChangeLoginTypeEvent());
        },
        child: Text(
          isLogin ? "Register instead" : "Login instead",
        ));
  }

  Widget _errorMessage(String errorMessage) {
    return Center(
      child: SizedBox(
        width: 200,
        child: Text(errorMessage == "" ? "" : "Humm? $errorMessage."),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthorizationBlocBloc(
        authorizationRepositoryImpl:
            RepositoryProvider.of<AuthorizationRepositoryImpl>(context),
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("LOGIN PAGE"),
          centerTitle: true,
        ),
        body: BlocBuilder<AuthorizationBlocBloc, AuthorizationBlocState>(
          builder: (context, state) {
            if (state is AuthorizationBlocInitial) {
              return Column(
                children: [
                  entryField("Username",
                      context.read<AuthorizationBlocBloc>().emailController),
                  entryField("Password",
                      context.read<AuthorizationBlocBloc>().passwordController),
                  submitButton(context, true),
                  loginOrRegisterButton(context, true)
                ],
              );
            } else if (state is AuthorizationBlocChangeLoginTypeState) {
              return Column(
                children: [
                  entryField("Username",
                      context.read<AuthorizationBlocBloc>().emailController),
                  entryField("Password",
                      context.read<AuthorizationBlocBloc>().passwordController),
                  submitButton(context, state.isLogin),
                  loginOrRegisterButton(context, state.isLogin),
                ],
              );
            } else if (state is AuthorizationBlocErrorState) {
              return _errorMessage(state.error);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
