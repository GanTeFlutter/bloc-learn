
class UserProfileState {
  final String userName;
  final int age;
  final String profileImage;

  UserProfileState({
    required this.userName,
    required this.age,
    required this.profileImage,
  });

  UserProfileState copyWith({
    String? userName,
    int? age,
    String? profileImage,
  }) {
    return UserProfileState(
      userName: userName ?? this.userName,
      age: age ?? this.age,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}