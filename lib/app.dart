import 'dart:async';

import 'package:checkapp/bloc/grossing/grossing_bloc.dart';
import 'package:checkapp/bloc/top_free/top_free_bloc.dart';
import 'package:checkapp/bloc/top_paid/top_paid_bloc.dart';
import 'package:checkapp/screen/home.screen.dart';
import 'package:checkapp/screen/profile.screen.dart';
import 'package:checkapp/screen/search.screen.dart';
import 'package:checkapp/screen/top.screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

import 'repository/apps.repository.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late StreamSubscription _intentSub;
  final _sharedFiles = <SharedMediaFile>[];
  int _selectedindex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   context.read<GrossingBloc>().add(LoadingGrossing());
   context.read<TopFreeBloc>().add(LoadingTopFree());
   context.read<TopPaidBloc>().add(LoadingTopPaid());

    _intentSub = ReceiveSharingIntent.getMediaStream().listen((value) {
      setState(() {
        _sharedFiles.clear();
        _sharedFiles.addAll(value);

        print(_sharedFiles.map((f) => f.toMap()));
      });
    }, onError: (err) {
      print("getIntentDataStream error: $err");
    });

    // Get the media sharing coming from outside the app while the app is closed.
    ReceiveSharingIntent.getInitialMedia().then((value) {
      setState(() {
        _sharedFiles.clear();
        _sharedFiles.addAll(value);
        print(_sharedFiles.map((f) => f.toMap()));

        // Tell the library that we are done processing the intent.
        ReceiveSharingIntent.reset();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        HomeScreen(),
        TopScreen(),
        SearchScreen(),
        ProfileScreen()
      ][_selectedindex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedindex,
        onDestinationSelected: (value) {
          setState(() {
            _selectedindex = value;
          });
        },
        destinations: [
NavigationDestination(icon: Icon(Icons.home_outlined), label: "Home",
selectedIcon:  Icon(Icons.home)),
          NavigationDestination(icon: Icon(Icons.bar_chart_outlined), label: "Top",
          selectedIcon: Icon(Icons.bar_chart)),
          NavigationDestination(icon: Icon(Icons.search_outlined),
          selectedIcon: Icon(Icons.search), label: "Search"),
          NavigationDestination(icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person), label: "Profile"),
        ],
        
        
      ),
    );
  }
}
