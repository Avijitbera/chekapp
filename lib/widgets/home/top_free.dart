import 'package:checkapp/bloc/top_free/top_free_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../AppWidget.dart';

class TopFree extends StatelessWidget {
  const TopFree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<TopFreeBloc, TopFreeState>(
       
        builder: (context, state) {
          if(state is TopFreeLoading){
            return Center(
              child: CircularProgressIndicator(strokeWidth: 3),
            );
          }else if(state is TopFreeFailed){
            return Center(
              child: Text("Failed"),
            );
          }else if (state is TopFreeLoaded){
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
