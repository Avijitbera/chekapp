import 'package:checkapp/bloc/top_paid/top_paid_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../AppWidget.dart';

class TopPaid extends StatelessWidget {
  const TopPaid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<TopPaidBloc, TopPaidState>(
       
        builder: (context, state) {
          if(state is TopPaidLoading){
            return Center(
              child: CircularProgressIndicator(strokeWidth: 3),
            );
          }else if(state is TopPaidFailed){
            return Center(
              child: Text("Failed"),
            );
          }else if (state is TopPaidLoaded){
            return ListView.separated(itemBuilder: (context, index) {
              return AppsWidget(app: state.apps[index],);
            }, separatorBuilder: (context, index) {
              return Divider(
                height: 0,
              );
            }, itemCount: state.apps.length);
          }else{
            return SizedBox(
              child: Text("Unknowen"),
            );
          }
        },
      ),
    );
  }
}