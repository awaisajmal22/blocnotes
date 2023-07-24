import 'package:flutter/foundation.dart' show immutable;

import '../models.dart';

@immutable
abstract class NotesApiProtocol {
  const NotesApiProtocol();
  Future<Iterable<Note>?> getNotes({required LoginHandler loginHandler});
}

@immutable
class NotesApi implements NotesApiProtocol {
  // const NotesApi._sharedInstance();
  //  static const NotesApi _shared = NotesApi._sharedInstance();
  // factory NotesApi.instance() => _shared;

  @override
  Future<Iterable<Note>?> getNotes({required LoginHandler loginHandler}) =>
      Future.delayed(
          Duration(seconds: 2),
          () =>
              loginHandler == const LoginHandler.logData() ? mockNotes : null);
}
