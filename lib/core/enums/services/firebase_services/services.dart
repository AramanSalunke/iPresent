import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class Services {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseStorage _storage = FirebaseStorage.instance;
  User _firebaseUser() => _auth.currentUser!;

  FirebaseAuth auth() => _auth;
  FirebaseStorage storage() => _storage;
  User user() => _firebaseUser();
  bool isUserLoggedIn() => _firebaseUser() != null;
}
