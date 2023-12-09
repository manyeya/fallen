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
          child: activity.when(
            data: (activity) {
              return ListView.builder(itemCount: 1,itemBuilder: (context, index) {
                return ListTile(
                  title: Text(activity.activity),
                  subtitle: Text(activity.type),
                );
              });
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) {
              return Text('Error: $error');
            },
          )),
    );
  }
}
