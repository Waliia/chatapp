import 'package:chat_app1/bloc/homebloc/home_bloc.dart';
import 'package:chat_app1/webapis/firebase/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';
import '../signinpage/signin_page.dart';

class HomeScreen extends StatelessWidget {
  static const String PAGE_NAME = 'chatpage';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeBloc>(context, listen: false).add(FetchUserEvent());
    return Scaffold(
        appBar: AppBar(
          title: Text('kdsaajkd'),
          actions: [
            IconButton(
                onPressed: () async {
                  await signout();
                  Navigator.pushReplacementNamed(context, SigninPage.PAGE_NAME);
                },
                icon: Icon(Icons.add)),
          ],
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomeLoadedState) {
              return HomeScreenBody(users: state.users);
            } else if (state is HomeErrorState) {
              SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('${state.errorMsg}')));
              });
              return Center(
                child: Text('No Users'),
              );
            } else if (state is EmptyState) {
              return Center(
                child: Text('No Users'),
              );
            } else {
              return SizedBox();
            }
          },
        ));
  }
}

class HomeScreenBody extends StatelessWidget {
  final List<UserModel> users;
  const HomeScreenBody({required this.users, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        UserModel model = users[index];
        return userView(model);
      },
      itemCount: users.length,
    );
  }

  Widget userView(UserModel model) {
    return Container(
      height: 50,
      child: ListTile(
        onTap: () {},
        leading: Icon(Icons.person),
        title: Text('${model.name}'),
        subtitle: Text('${model.email}'),
      ),
    );
  }
}
