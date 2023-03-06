abstract class GetProfileEvent {}

class GetUserProfileEvent extends GetProfileEvent {
  bool isUserLogout;

  GetUserProfileEvent({this.isUserLogout = false});
}
