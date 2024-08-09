part of 'account_bloc.dart';

@immutable
sealed class AccountEvent {}

class AccountLoaded extends AccountEvent {}
class AccountLoading extends AccountEvent {}
class AccountFailed extends AccountEvent {}
