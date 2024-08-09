part of 'top_free_bloc.dart';

@immutable
sealed class TopFreeEvent {}


class LoadingTopFree extends TopFreeEvent {}
class LoadedTopFree extends TopFreeEvent {}
class FailedTopFree extends TopFreeEvent {}
