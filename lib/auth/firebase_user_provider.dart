import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class UFLDemoFirebaseUser {
  UFLDemoFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

UFLDemoFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<UFLDemoFirebaseUser> uFLDemoFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<UFLDemoFirebaseUser>(
        (user) => currentUser = UFLDemoFirebaseUser(user));
