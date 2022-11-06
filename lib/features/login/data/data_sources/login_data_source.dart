
import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../models/login_data_model.dart';

abstract class BaseLoginDataSource {
  Future<LoginDataModel> postLoginData(String email,String password);
}
class LoginDataSource extends BaseLoginDataSource{
  final BaseApiConsumer apiConsumer;

  LoginDataSource({required this.apiConsumer});

  @override
  Future<LoginDataModel> postLoginData(String email, String password) async {
    final response = await apiConsumer.post(EndPoints.loginUrl,body: {
      "email":"$email",
      "password":"$password"
    });
    return LoginDataModel.fromJson(response);
  }
}

