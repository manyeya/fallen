import 'dart:async';

import 'package:fallen/features/activity/data/activity_repository.dart';
import 'package:fallen/features/activity/domain/activity_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActivityController extends AutoDisposeAsyncNotifier<Activity> {
  final repo = ActivityRepository();

  @override
  Future<Activity> build() async {
    return await repo.getActivity();
  }
}

final activityControllerProvider =
    AsyncNotifierProvider.autoDispose<ActivityController, Activity>(
        ActivityController.new);
