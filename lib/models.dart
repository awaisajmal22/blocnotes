import 'package:flutter/foundation.dart' show immutable;

@immutable
class LoginHandler {
  final String token;

  const LoginHandler({required this.token});
  const LoginHandler.logData() : token = 'awais@2023';

  @override
  bool operator ==(covariant LoginHandler other) => token == other.token;

  @override
  // TODO: implement hashCode
  int get hashCode => token.hashCode;

  @override
  String toString() => 'LoginHandler token = $token';
}

enum LoginError { invalidHandle }

@immutable
class Note {
  final String title;

  const Note({required this.title});

  @override
  String toString() => 'Note title = $title';
}

final mockNotes = Iterable.generate(
  3,
  (index) => Note(title: 'Note ${index + 1}'),
);
