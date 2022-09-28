abstract class HomeStates {
  const HomeStates();
}

class HomeInitialState extends HomeStates {
  const HomeInitialState();
}

class HomeCompletedState extends HomeStates {
  List data;
  HomeCompletedState({required this.data});
}

class HomeErrorState extends HomeStates {
  const HomeErrorState();
}
