import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/authenticated_user.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationState()) {
    on<AuthenticationEvent>((event, emit) {
      emit(state.copyWith(
        authenticationStatus: AuthenticationStatus.unauthenticated,
      ));
    });
    on<_AuthenticationLoginEvent>((event, emit){

    });
  }

}
