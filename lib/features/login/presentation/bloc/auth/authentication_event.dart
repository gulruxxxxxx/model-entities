part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.getAuthenticatedStatus() = _GetAuthenticationStatus;
  const factory AuthenticationEvent.login({
    required String username,required String password
}) = _AuthenticationLoginEvent;
  const factory AuthenticationEvent.logout() = _AuthenticationLogoutEvent;
}
