import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/auth/auth_bloc.dart';
import 'package:flutter_application_1/bloc/tweet/tweet_bloc.dart';
import 'package:flutter_application_1/ui/app.dart';
import 'package:flutter_application_1/ui/auth/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

Future <void> main()  async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => AuthBloc()..add(IsHasLogin()),),
        BlocProvider(create: (context) => TweetBloc(),),
      ],
      child: MaterialApp(
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            
            if(state is Authenticated){
              return const App();
            } else if (state is AuthenticatedLoading){
              return  Scaffold(body: Center(child: CircularProgressIndicator(),),);
            }
            
            return LoginPage();
          },
        )
      ),
    );
  }
}
