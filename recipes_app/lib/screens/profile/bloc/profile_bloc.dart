import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

// Bloc to manage the profile screen tabs.
// Emits the currently selected tab index when changed.
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<TabChangedEvent>((event, emit) => emit(SuccessState(event.index)));
  }
}
