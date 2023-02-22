import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/repository/auth_repository.dart';

import '../../repository/cahce_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final authRepository = Authrepository();
  AuthBloc() : super(AuthInitial()) {
   on<IsHasLogin>(
      (event, emit) async {
        try {
          var response = await Cache.getData('token_user');
        

          response != null ? emit(Authenticated()) : emit(AuthenticatedEror(eror: "IshasLogin Fail [auth_bloc]"));

          print("IsHasLogin Event has finish [auth_bloc]");
        } catch (eror) {
          emit(AuthenticatedEror(eror: eror.toString() ));
        }
      },
    );
    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        var response = await authRepository.registerRespository(
            event.email, event.password);

        response
            ? emit(AuthSuccess())
            : emit(AuthEror("Register Event Failed"));

        print("Register Event has finish [auth_bloc]");
      } catch (e) {
        emit(AuthEror(e.toString()));
      }
    });

    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        var response =
            await authRepository.loginRepositiory(event.email, event.password);

        response ? emit(AuthSuccess()) : emit(AuthEror("Login Event Failed"));

        print("Login Event has finish [auth_bloc]");
      } catch (e) {
        emit(AuthEror(e.toString()));
      }
    });

    on<LogoutEvent>((event, emit) async {
      emit(AuthenticatedLoading());
      try {
        var response = await Cache.deleteData('token_user');
        emit(Unauthenticated());
      } catch (e) {
        print("eror at logout event [auth_bloc] : ${e.toString()}");
        
      }
    });
  }
}
