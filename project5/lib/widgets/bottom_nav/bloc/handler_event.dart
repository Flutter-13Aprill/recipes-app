part of 'handler_bloc.dart';

@immutable
sealed class HandlerEvent {}

final class ClickEvent extends HandlerEvent{


  final int currentIndex;

  ClickEvent({required this.currentIndex});

}