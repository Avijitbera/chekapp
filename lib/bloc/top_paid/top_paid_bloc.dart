import 'package:bloc/bloc.dart';
import 'package:checkapp/repository/apps.repository.dart';
import 'package:checkapp/utils/failed.dart';
import 'package:meta/meta.dart';

import '../../model/StoreApplication.dart';

part 'top_paid_event.dart';
part 'top_paid_state.dart';

class TopPaidBloc extends Bloc<TopPaidEvent, TopPaidState> {
  AppsRepository _repository;
  TopPaidBloc(this._repository) : super(TopPaidInitial()) {
    on<TopPaidEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoadingTopPaid>((event, emit) async{
      emit(TopPaidLoading());
      var result = await _repository.getTopPaid();
      if(result.isRight()){
        var data = result.match((l) => null, (r) => r);
        emit(TopPaidLoaded(data!));
      }else{
        var data = result.match((l) => l, (r) => null);
        emit(TopPaidFailed(data!));
      }
    });


  }
}
