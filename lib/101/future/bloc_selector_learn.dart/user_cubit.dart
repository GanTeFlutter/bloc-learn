import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_learn/101/future/bloc_selector_learn.dart/user_model.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit()
      : super(UserProfileState(
          userName: 'John Doe',
          age: 30,
          profileImage: 'assets/doc3.jpg',
        ));

  void updateUserName(String newName) {
    emit(state.copyWith(userName: newName));
  }

  void updateAge(int newAge) {
    emit(state.copyWith(age: newAge));
  }

  void updateProfileImage(String newImage) {
    emit(state.copyWith(profileImage: newImage));
  }
}
