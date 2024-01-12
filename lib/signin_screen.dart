import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_repository.dart';
import 'fake_auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  // return a concrete implementation of AuthRepository
  return FakeAuthRepository();
});

class SignInScreen extends ConsumerWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Sign in anonymously'),
          onPressed: () => ref.read(authRepositoryProvider).signInAnonymously(),
        ),
      ),
    );
  }
}