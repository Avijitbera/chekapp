part of 'grossing_bloc.dart';

@immutable
sealed class GrossingState {}

final class GrossingInitial extends GrossingState {}

final class GrossingFailed extends GrossingState{
  Failed failed;

  GrossingFailed(this.failed);
}


final class GrossingLoaded extends GrossingState {
  List<StoreApplication> apps;

  GrossingLoaded(this.apps);
}