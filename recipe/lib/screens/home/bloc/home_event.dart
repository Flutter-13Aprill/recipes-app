abstract class HomeEvent {}

class LoadRecipes extends HomeEvent {}

class ChangeCategory extends HomeEvent {
  final String category;
  ChangeCategory(this.category);
}

class ChangeTab extends HomeEvent {
  final String tab;
  ChangeTab(this.tab);
}
