import 'package:chat_app1/bloc/signinpagecbloc/signin_bloc.dart';
import 'package:chat_app1/pages/chatpage/chat_page.dart';
import 'package:chat_app1/pages/signinpage/signin_widgets/signin_form.dart';
import 'package:chat_app1/widgets/check_connectivity.dart';
import 'package:chat_app1/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninPage extends StatelessWidget {
  static const String PAGE_NAME = 'signinpage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: CheckConnectivity(child: ScaffoldPage()));
  }
}

class ScaffoldPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormFieldState> emailGlobalKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> passwordGlobalKey =
      GlobalKey<FormFieldState>();
  ScaffoldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SigninForm(
            emailController: emailController,
            passwordController: passwordController,
            emailGlobalKey: emailGlobalKey,
            passwordGlobalKey: passwordGlobalKey,
          ),
          BlocBuilder<SigninBloc, SigninState>(
            builder: (context, state) {
              if (state is SigninInitial) {
                return SizedBox();
              } else if (state is SigninLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SigninLoadedState) {
                SchedulerBinding.instance.addPostFrameCallback((Duration dur) {
                  Navigator.pushReplacementNamed(context, HomeScreen.PAGE_NAME,
                      arguments: null);
                });
                return SizedBox();
              } else if (state is SigninErrorState) {
                SchedulerBinding.instance.addPostFrameCallback((Duration dur) {
                  showDialog(
                      context: context,
                      builder: (context) =>
                          CustomDialog(masg: '${state.errorMsg}'));
                });
                return SizedBox();
              } else {
                return SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
