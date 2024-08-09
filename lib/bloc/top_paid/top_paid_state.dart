part of 'top_paid_bloc.dart';

@immutable
sealed class TopPaidState {}

final class TopPaidInitial extends TopPaidState {}

class TopPaidLoading extends TopPaidState {}
class TopPaidFailed extends TopPaidState {
  Failed failed;

  TopPaidFailed(this.failed);
}
class TopPaidLoaded extends TopPaidState {
  List<StoreApplication> apps;
  TopPaidLoaded(this.apps);
}
