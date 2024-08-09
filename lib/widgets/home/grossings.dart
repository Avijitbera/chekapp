import 'package:cached_network_image/cached_network_image.dart';
import 'package:checkapp/bloc/grossing/grossing_bloc.dart';
import 'package:checkapp/model/StoreApplication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../AppWidget.dart';

class GrossingsWidget extends StatelessWidget {
  const GrossingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<GrossingBloc, GrossingState>(
       
        builder: (context, state) {
          if(state is GrossingInitial){
            return Center(
              child: CircularProgressIndicator(strokeWidth: 3),
            );
          }else if(state is GrossingFailed){
            return Center(
              child: Text("Failed"),
            );
          }else if (state is GrossingLoaded){
            return ListView.separated(itemBuilder: (context, index) {
              return AppsWidget(app: state.apps[index],);
            }, separatorBuilder: (context, index) {
              return Divider(
                height: 0,
              );
            }, itemCount: state.apps.length);
          }else{
            return SizedBox();
          }
        },
      ),
    );
  }
}
