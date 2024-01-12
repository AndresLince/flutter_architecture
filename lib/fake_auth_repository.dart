import 'package:flutter_architecture/app_user.dart';
import 'package:flutter_architecture/auth_repository.dart';

class FakeAuthRepository implements AuthRepository{
  @override
  Stream<AppUser?> authStateChanges() {
    // TODO: implement authStateChanges
    throw UnimplementedError();
  }

  @override
  Future<AppUser> signInAnonymously() {
    // TODO: implement signInAnonymously
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

}