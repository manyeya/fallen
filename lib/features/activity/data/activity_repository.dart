import 'dart:convert';
import 'package:dio/dio.dart';

import '../domain/activity_model.dart';
import 'package:http/http.dart' as http;

abstract class IActivityRepository {
  Future<List<Activity>> getActivities();
  Future<Activity> getActivity();
  Future<void> addActivity(Activity activity);
  Future<void> updateActivity(Activity activity);
  Future<void> deleteActivity(Activity activity);
}

class ActivityRepository implements IActivityRepository {
  final dio = Dio();

  @override
  Future<List<Activity>> getActivities() async {
    return <Activity>[
      Activity(
        activity: 'Learn Flutter',
        type: 'education',
        participants: 1,
        price: 0,
        key: '3943509',
        link: 'https://www.youtube.com/watch?v=GLSG_Wh_YWc',
      )
    ];
  }

  @override
  Future<Activity> getActivity() async {
    final Response<dynamic> res =
        await dio.get('https://boredapi.com/api/activity');

    return Activity.fromJson(res.data);
  }

  @override
  Future<void> addActivity(Activity activity) async {
    return;
  }

  @override
  Future<void> updateActivity(Activity activity) async {
    return;
  }

  @override
  Future<void> deleteActivity(Activity activity) async {
    return;
  }
}
