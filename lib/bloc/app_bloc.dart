import 'package:bloc/bloc.dart';
import 'package:notesblocapp/Apis/login_api.dart';
import 'package:notesblocapp/Apis/notes_api.dart';
import 'package:notesblocapp/bloc/app_state.dart';
import 'package:notesblocapp/bloc/bloc_actions.dart';

import '../models.dart';

class AppBloc extends Bloc<AppActions, AppState> {
  final LoginApiProtocol loginApi;
  final NotesApiProtocol notesApi;

  AppBloc({
    required this.loginApi,
    required this.notesApi,
  }) : super(const AppState.empty()) {
    on<LoginAction>(
      (event, emit) async {
        emit(
          const AppState(
            isLoading: true,
            loginError: null,
            loginHandler: null,
            fetchNotes: null,
          ),
        );
        final loginHandler =
            await loginApi.login(email: event.email, password: event.password);
        emit(
          AppState(
            isLoading: false,
            loginError: loginHandler == null ? LoginError.invalidHandle : null,
            loginHandler: loginHandler,
            fetchNotes: null,
          ),
        );
      },
    );
    on<LoadNotesAction>(
      (event, emit) async {
        emit(
          AppState(
            isLoading: true,
            loginError: null,
            loginHandler: state.loginHandler,
            fetchNotes: null,
          ),
        );
        //get loginHandler

        final loginHandler = state.loginHandler;
        if (loginHandler != const LoginHandler.logData()) {
          //invalid login handler cant fetch notes.
          emit(
            AppState(
              isLoading: false,
              loginError: LoginError.invalidHandle,
              loginHandler: loginHandler,
              fetchNotes: null,
            ),
          );
          return;
        }

        //valid login handle wants to fetch notes.
        final notes = await notesApi.getNotes(loginHandler: loginHandler!);
        emit(AppState(
          isLoading: false,
          loginError: null,
          loginHandler: loginHandler,
          fetchNotes: notes,
        ),);
      },
    );
  }
}
