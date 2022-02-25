import 'package:get/get.dart';
import 'package:latihanapicli/app/data/models/user_model.dart';
import 'package:latihanapicli/app/data/providers/user_provider.dart';
import '../../../app/data/providers/user_provider.dart';

class HomeController extends GetxController {
  UserProvider userProv = UserProvider();

  Future<User?> getSingleUser(int id) async {
    return await userProv.getUser(id);
  }

  Future<List<User>> getAllUsers() async {
    return await userProv.getAllUsers();
  }
}
