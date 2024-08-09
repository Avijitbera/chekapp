import 'package:checkapp/widgets/home/grossings.dart';
import 'package:checkapp/widgets/home/top_free.dart';
import 'package:checkapp/widgets/home/top_paid.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:3 ,
      child: Scaffold(
        body: NestedScrollView(headerSliverBuilder: (context,_){
          return [
            SliverAppBar(
              pinned: false,
              floating: true,
              snap: true,
              title: Text('Sliver TabBar'),
              // backgroundColor: Colors.black87,
              bottom: TabBar(tabs: [
                Tab(text: 'Grossing',),
                Tab(text: 'Top Free',),
                Tab(text: 'Top Paid',),
                
              ]),
            )
          ];
        },
        
         body: TabBarView(children: [
           GrossingsWidget(),
           TopFree(),
           TopPaid(),
          
          
         ]),
      
      ),
      ),
    );
  }
}