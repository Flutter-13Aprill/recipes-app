abstract class HomeEvent {}

class ToggleLike extends HomeEvent {
  final int cardIndex;
  ToggleLike(this.cardIndex);
}

class NavigateToPage extends HomeEvent {
  final int pageIndex;
  NavigateToPage(this.pageIndex);
}
