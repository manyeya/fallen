import 'package:dio/dio.dart';
import '../domain/activity_model.dart';

abstract class IActivityRepository {
  Future<Activity> getActivity();
}

class ActivityRepository implements IActivityRepository {
  final dio = Dio();
  @override
  Future<Activity> getActivity() async {
    final Response<dynamic> res =
        await dio.get('https://boredapi.com/api/activity');

    return Activity.fromJson(res.data);
  }

}
