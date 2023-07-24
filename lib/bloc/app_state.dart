import 'package:flutter/foundation.dart' show immutable;
import 'package:notesblocapp/models.dart';

@immutable
class AppState {
  final bool isLoading;
  final LoginError? loginError;
  final LoginHandler? loginHandler;
  final Iterable<Note>? fetchNotes;
  const AppState.empty()
      : isLoading = false,
        loginError = null,
        loginHandler = null,
        fetchNotes = null;
  const AppState({
    required this.isLoading,
    required this.loginError,
    required this.loginHandler,
    required this.fetchNotes,
  });

  @override
  String toString() => {
        'isLoading': isLoading,
        'LoginError': loginError,
        'LoginHandler': loginHandler,
        'FetchNotes': fetchNotes
      }.toString();
}
