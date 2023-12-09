import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/activity_controller.dart';

class ActivityScreen extends ConsumerWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activity = ref.watch(activityControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.refresh(activityControllerProvider.notifier).build();
        },
        child: ListView(
          children: [
            activity.when(
              data: (activity) {
                return SelectableText(
                  activity.activity.toString(),
                  style: const TextStyle(fontSize: 18),
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) {
                return Text('Error: $error');
              },
            )
          ],
        )
      ),
    );
  }
}
