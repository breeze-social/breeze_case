import 'package:breeze_case/core/api/api_response.dart';
import 'package:breeze_case/core/app/app.locator.dart';
import 'package:breeze_case/core/constants/api_routes.dart';
import 'package:breeze_case/core/api/api.dart';
import 'package:breeze_case/core/models/user.dart';

class UserRepository {
  String? get userId => _userId;
  String? _userId;

  /// Retrieves and stores the user id from the [Api]. When unsuccessful, it will return `false`.
  Future<bool> getUserId() async {
    final ApiResponse response = await locator<Api>().get(ApiRoutes.me);
    if (!response.isSuccessful) return false;
    _userId = User.fromJson(response.data).id;
    return true;
  }
}
