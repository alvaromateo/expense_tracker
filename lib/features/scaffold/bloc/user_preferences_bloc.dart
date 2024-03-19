import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_preferences_event.dart';
part 'user_preferences_state.dart';

class UserPreferencesBloc extends Bloc<UserPreferencesEvent, UserPreferencesState> {
  UserPreferencesBloc() : super(UserPreferencesInitial()) {
    on<UserPreferencesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
