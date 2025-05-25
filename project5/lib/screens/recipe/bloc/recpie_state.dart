part of 'recpie_bloc.dart';

@immutable
sealed class RecpieState {}

final class RecpieInitial extends RecpieState {}
final class SuccessState extends RecpieState {}
final class NewRecpie extends RecpieState {

  final List<Widget> recpies;

  NewRecpie({required this.recpies});

}

final class IsLikedState extends RecpieState {

  final List<RecpiesModel> liked;

  IsLikedState({required this.liked});

}
