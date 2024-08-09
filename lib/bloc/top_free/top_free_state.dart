part of 'top_free_bloc.dart';

@immutable
sealed class TopFreeState {}

final class TopFreeInitial extends TopFreeState {}


class TopFreeLoading extends TopFreeState{}

class TopFreeFailed extends TopFreeState {
  Failed failed;

  TopFreeFailed(this.failed);
}
class TopFreeLoaded extends TopFreeState {
  List<StoreApplication> apps;

  TopFreeLoaded(this.apps);
}