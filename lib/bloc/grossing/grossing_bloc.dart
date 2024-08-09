import 'package:bloc/bloc.dart';
import 'package:checkapp/model/StoreApplication.dart';
import 'package:checkapp/repository/apps.repository.dart';
import 'package:checkapp/utils/failed.dart';
import 'package:meta/meta.dart';

part 'grossing_event.dart';
part 'grossing_state.dart';

class GrossingBloc extends Bloc<GrossingEvent, GrossingState> {
  AppsRepository _repository;
  GrossingBloc(this._repository) : super(GrossingInitial()) {
    on<GrossingEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoadingGrossing>((event, emit) async{
      emit(GrossingInitial());
      var result = await _repository.getGrossing();
      if(result.isRight()){
        var data = result.match((l) => null, (r) => r);
        emit(GrossingLoaded(data!));
      }else{
        var data = result.match((l) => l, (r) => null);
        emit(GrossingFailed(data!));
      }
    });
  }
}
