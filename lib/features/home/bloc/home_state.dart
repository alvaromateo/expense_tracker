part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeLoading extends HomeState {}

final class HomeNotLoggedIn extends HomeState {}

final class HomeLoggedIn extends HomeState {}
