abstract class FoodLikeEvent {}

class ToggleLikeEvent extends FoodLikeEvent {
  final int index;
  ToggleLikeEvent(this.index);
}
class ChangeTabEvent extends FoodLikeEvent {
  final int tabIndex;

  ChangeTabEvent(this.tabIndex);
}
