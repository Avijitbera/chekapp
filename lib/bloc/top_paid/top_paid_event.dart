part of 'top_paid_bloc.dart';

@immutable
sealed class TopPaidEvent {}

class LoadingTopPaid extends TopPaidEvent{}
class LoadedTopPaid extends TopPaidEvent{}
class FailedTopPaid extends TopPaidEvent{}
