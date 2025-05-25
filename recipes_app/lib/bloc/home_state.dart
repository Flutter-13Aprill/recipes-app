class HomeState {
  final List<bool> likedCards;
  final int currentPageIndex;

  HomeState({
    required this.likedCards,
    required this.currentPageIndex,
  });

  HomeState copyWith({
    List<bool>? likedCards,
    int? currentPageIndex,
  }) {
    return HomeState(
      likedCards: likedCards ?? this.likedCards,
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
    );
  }
}
