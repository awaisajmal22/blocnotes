import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesblocapp/strings.dart';
import 'package:notesblocapp/utils/generic_dailog.dart';
import 'package:notesblocapp/views/iterable_list_view.dart';
import 'package:notesblocapp/views/login_view.dart';

import 'Apis/login_api.dart';
import 'Apis/notes_api.dart';
import 'bloc/app_bloc.dart';
import 'bloc/app_state.dart';
import 'bloc/bloc_actions.dart';
import 'models.dart';
import 'utils/loader/loading_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(
        loginApi: LoginApi(),
        notesApi: NotesApi(),
      ),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<AppBloc, AppState>(
            builder: (context, state) {
              final notes = state.fetchNotes;
              if (notes == null) {
                return LoginView(
                  onLoginTap: (email, password) {
                    context
                        .read<AppBloc>()
                        .add(LoginAction(email: email, password: password));
                  },
                );
              } else {
                return notes.toListView();
              }
            },
            listener: (context, state) {
              if (state.isLoading) {
                return LoadingScreen.inatance()
                    .show(context: context, text: pleasWait);
              } else {
                LoadingScreen.inatance().hide();
              }
              final loginError = state.loginError;
              if (loginError != null) {
                showGenericDailog<bool>(
                  context: context,
                  title: loginErrorDailogTitle,
                  content: loginErrorDailogContent,
                  optionBuiler: () => {ok: true},
                );
              }
              if (state.isLoading == false &&
                  state.loginError == null &&
                  state.loginHandler == const LoginHandler.logData() &&
                  state.fetchNotes == null) {
                context.read<AppBloc>().add(const LoadNotesAction());
                print('Notes');
              } else {
                return LoadingScreen.inatance().hide();
              }
            },
          ),
        ),
      ),
    );
  }
}
