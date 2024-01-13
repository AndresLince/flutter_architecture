import 'package:flutter/material.dart';
import 'package:flutter_architecture/features/video/data/video_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/video.dart';

/// We subclassed "ConsumerWidget" instead of "StatelessWidget".
/// This is equivalent to making a "StatelessWidget" and retuning "Consumer".
class VideoList extends ConsumerWidget {
  const VideoList({super.key});

  @override
  // Notice how "build" now receives an extra parameter: "ref"
  Widget build(BuildContext context, WidgetRef ref) {
    // We can use "ref.watch" inside our widget like we did using "Consumer"
    final AsyncValue<List<Video>> videos = ref.watch(videoProvider);

    // The rendering logic stays the same
    return Center(
      /// Since network-requests are asynchronous and can fail, we need to
      /// handle both error and loading states. We can use pattern matching for this.
      /// We could alternatively use `if (activity.isLoading) { ... } else if (...)`
      child: switch (videos) {
        AsyncData(:final value) => ListView.builder(
          itemBuilder: (context, index) {
            Video video = value[index];
            return Material(
              child: ListTile(
                title: Text(video.name),
              ),
            );
          },
          itemCount: value.length,
        ),
        AsyncError() => const Text('Oops, something unexpected happened'),
        _ => const CircularProgressIndicator(),
      },
    );
  }
}