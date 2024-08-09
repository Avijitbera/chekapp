part of 'grossing_bloc.dart';

@immutable
sealed class GrossingEvent {}

class LoadingGrossing extends GrossingEvent{}

class FailedGrossing extends GrossingEvent{}

class LoadedGrossing extends GrossingEvent {}