import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/provider.dart';
import '../domain/activity.dart';

/// We subclassed "ConsumerWidget" instead of "StatelessWidget".
/// This is equivalent to making a "StatelessWidget" and retuning "Consumer".
class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  // Notice how "build" now receives an extra parameter: "ref"
  Widget build(BuildContext context, WidgetRef ref) {
    // We can use "ref.watch" inside our widget like we did using "Consumer"
    final AsyncValue<Activity> activity = ref.watch(activityProvider);

    // The rendering logic stays the same
    return Center(
      /// Since network-requests are asynchronous and can fail, we need to
      /// handle both error and loading states. We can use pattern matching for this.
      /// We could alternatively use `if (activity.isLoading) { ... } else if (...)`
      child: switch (activity) {
        AsyncData(:final value) => Text('Activity: ${value.activity}', style: TextStyle(
          fontSize: 12,
        ),),
        AsyncError() => const Text('Oops, something unexpected happened'),
        _ => const CircularProgressIndicator(),
      },
    );
  }
}