import 'package:chat_app1/app_navigation/app_navigation.dart';
import 'package:chat_app1/bloc/connectivity/connectivity_bloc.dart';
import 'package:chat_app1/bloc/homebloc/home_bloc.dart';
import 'package:chat_app1/bloc/signinpagecbloc/signin_bloc.dart';
import 'package:chat_app1/bloc/signup_bloc/signup_bloc.dart';
import 'package:chat_app1/pages/chatpage/chat_page.dart';
import 'package:chat_app1/pages/signinpage/signin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectivityBloc>(
          create: (context) => ConnectivityBloc(),
        ),
        BlocProvider<SignupBloc>(
          create: (context) => SignupBloc(),
        ),
        BlocProvider<SigninBloc>(
          create: (context) => SigninBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: AppNavigation.buildPage,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: auth.currentUser != null ? HomeScreen() : SigninPage(),
      ),
    );
  }
}
