part of 'account_bloc.dart';

@immutable
sealed class AccountState {}

final class AccountInitial extends AccountState {}

final class LoadedAccount extends AccountState {
  Account account;
  LoadedAccount(this.account);
}
