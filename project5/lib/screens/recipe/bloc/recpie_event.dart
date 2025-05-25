part of 'recpie_bloc.dart';

@immutable
sealed class RecpieEvent {}

final class SliderEvnt extends RecpieEvent{

  final double index;

  SliderEvnt({required this.index});

}
final class AddEvent extends RecpieEvent{

  final Widget recpie;

  AddEvent({required this.recpie});

}

