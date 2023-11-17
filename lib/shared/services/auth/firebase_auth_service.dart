import 'package:happy_dog/shared/services/auth/auth_reponse.dart';
import 'package:happy_dog/shared/services/auth/i_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService implements IAuthService {
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Future<AuthResponse> deleteCurrentAccount() async {
    try {
      final currentUser = firebaseAuth.currentUser;
      if (currentUser != null) {
        currentUser.delete();
      }
      return AuthResponse(success: true);
    } on FirebaseAuthException catch (e) {
      return AuthResponse(success: false, message: e.message);
    } on Exception catch (_) {
      return AuthResponse(success: false, message: '');
    }
  }

  @override
  Future<AuthResponse> forgotPassword({required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return AuthResponse(success: true);
    } on FirebaseAuthException catch (e) {
      return AuthResponse(success: false, message: e.message);
    } on Exception catch (_) {
      return AuthResponse(success: false, message: '');
    }
  }

  @override
  Future<AuthResponse> signup({required String password, required String email}) async {
    try {
      final response = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return AuthResponse.fromSuccess(response);
    } on FirebaseAuthException catch (e) {
      return AuthResponse.fromError(e);
    } on Exception catch (_) {
      return AuthResponse(success: false, message: '');
    }
  }

  @override
  Future<AuthResponse> signout() async {
    try {
      await firebaseAuth.signOut();
      return AuthResponse(success: true);
    } on FirebaseAuthException catch (e) {
      return AuthResponse.fromError(e);
    } on Exception catch (_) {
      return AuthResponse(success: false, message: '');
    }
  }

  @override
  Future<AuthResponse> signin({required String password, required String email}) async {
    try {
      final response = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      return AuthResponse.fromSuccess(response);
    } on FirebaseAuthException catch (e) {
      return AuthResponse.fromError(e);
    } on Exception catch (_) {
      return AuthResponse(success: false, message: '');
    }
  }

  @override
  Future<AuthResponse> userlogged() async {
    try {
      final response = firebaseAuth.currentUser;
      return AuthResponse.froUser(response);
    } on FirebaseAuthException catch (e) {
      return AuthResponse.fromError(e);
    } on Exception catch (_) {
      return AuthResponse(success: false, message: '');
    }
  }
}
