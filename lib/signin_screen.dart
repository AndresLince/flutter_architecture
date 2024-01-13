import 'package:flutter/material.dart';
import 'package:flutter_architecture/async_value_ui.dart';
import 'package:flutter_architecture/signin_screen_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(
      signInScreenControllerProvider,
          (_, state) => state.showSnackbarOnError(context),
    );
    // watch and rebuild when the state changes
    final AsyncValue<void> state = ref.watch(signInScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: ElevatedButton(
          // conditionally show a CircularProgressIndicator if the state is "loading"
          child: state.isLoading
              ? const CircularProgressIndicator()
              : const Text('Sign in anonymously'),
          // disable the button if the state is loading
          onPressed: state.isLoading
              ? null
          // otherwise, get the notifier and sign in
              : () => ref
              .read(signInScreenControllerProvider.notifier)
              .signInAnonymously(),
        ),
      ),
    );
  }
}