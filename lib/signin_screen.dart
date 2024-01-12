import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_repository.dart';
import 'fake_auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  // return a concrete implementation of AuthRepository
  return FakeAuthRepository();
});

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  // keep track of the loading state
  bool isLoading = false;

  // call this from the `onPressed` callback
  Future<void> _signInAnonymously() async {
    try {
      // update the state
      setState(() => isLoading = true);
      // sign in using the repository
      await ref
          .read(authRepositoryProvider)
          .signInAnonymously();
    } catch (e) {
      // show a snackbar if something went wrong
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      // check if we're still on this screen (widget is mounted)
      if (mounted) {
        // reset the loading state
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Sign in anonymously'),
          onPressed: () => _signInAnonymously(),
        ),
      ),
    );
  }
}