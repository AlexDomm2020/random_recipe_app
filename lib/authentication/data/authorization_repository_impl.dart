import 'package:firebase_core/firebase_core.dart';
import 'package:lyrics_app/authentication/domain/authorization_repository.dart';
import 'package:lyrics_app/service/auth_service.dart';

class AuthorizationRepositoryImpl extends AuthorizationRepository {
  @override
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await AuthService()
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (e) {
      throw (e);
    }
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await AuthService()
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (e) {
      throw (e);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await AuthService().signOut();
    } on FirebaseException catch (e) {
      throw (e);
    }
  }
}
