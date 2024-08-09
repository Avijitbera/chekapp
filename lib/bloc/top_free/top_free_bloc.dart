import 'package:bloc/bloc.dart';
import 'package:checkapp/model/StoreApplication.dart';
import 'package:checkapp/repository/apps.repository.dart';
import 'package:checkapp/utils/failed.dart';
import 'package:meta/meta.dart';

part 'top_free_event.dart';
part 'top_free_state.dart';

class TopFreeBloc extends Bloc<TopFreeEvent, TopFreeState> {
  AppsRepository _repository;
  TopFreeBloc(this._repository) : super(TopFreeInitial()) {
    on<TopFreeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoadingTopFree>((event, emit)async{
      emit(TopFreeLoading());
      var result = await _repository.getTopFree();
      if(result.isRight()){
        var data = result.match((l) => null, (r) => r);
        emit(TopFreeLoaded(data!));
      }else{
        var data = result.match((l) => l, (r) => null);
        emit(TopFreeFailed(data!));
      }
    });

  }
}
