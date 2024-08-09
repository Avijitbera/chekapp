import 'package:checkapp/bloc/top_free/top_free_bloc.dart';
import 'package:checkapp/bloc/top_paid/top_paid_bloc.dart';
import 'package:checkapp/repository/apps.repository.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'app.dart';
import 'bloc/grossing/grossing_bloc.dart';
import 'repository/review.repository.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  static const platform = MethodChannel('app_service');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    try {
      platform.invokeMethod<int>('start_service');
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, _, type) {
        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider<AppsRepository>(
              create: (context) => AppsRepository(Dio()),
            ),
            RepositoryProvider<ReviewRepository>(
              create: (context) => ReviewRepository(Dio()),
            ),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider<GrossingBloc>(create: (context) => GrossingBloc(context.read<AppsRepository>()),),
              BlocProvider<TopPaidBloc>(create: (context) => TopPaidBloc(context.read<AppsRepository>()),),
              BlocProvider<TopFreeBloc>(create: (context) => TopFreeBloc(context.read<AppsRepository>()),),
            ],
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const App(),
            ),
          ),
        );
      }
    );
  }
}
