import 'package:happy_dog/shared/services/auth/auth_reponse.dart';
import 'package:happy_dog/shared/services/auth/i_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService implements IAuth {
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> deleteCurrentAccount() {
    // TODO: implement deleteCurrentAccount
    throw UnimplementedError();
  }

  @override
  Future<void> forgotPassword() {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<AuthResponse> signup(
      {required String password, required String email}) async {
    try {
      final response = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return AuthResponse.fromSuccess(response);
    } on FirebaseAuthException catch (e) {
      return AuthResponse.fromError(e);
    } on Exception catch (_) {
      return AuthResponse(error: true, message: '');
    }
  }

  @override
  Future<void> sigout() {
    // TODO: implement sigout
    throw UnimplementedError();
  }
}
