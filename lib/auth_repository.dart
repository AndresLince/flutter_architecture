abstract class AuthRepository {
  // emits a new value every time the authentication state changes
  Stream<AppUser?> authStateChanges();

  Future<AppUser> signInAnonymously();

  Future<void> signOut();
}
