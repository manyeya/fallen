import 'dart:convert';
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
  @override
  Future<List<Activity>> getActivities() async {
    return <Activity>[
      Activity(
        activity: 'Learn Flutter',
        type: 'education',
        participants: 1,
        price: 0,
        key: '3943509',
      )
    ];
  }

  @override
  Future<Activity> getActivity() async {
    // Using package:http, we fetch a random activity from the Bored API.
    final response = await http.get(Uri.https('boredapi.com', '/api/activity'));
    // Using dart:convert, we then decode the JSON payload into a Map data structure.
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    // Finally, we convert the Map into an Activity instance.
    print(json);
    return Activity.fromJson(json);
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
