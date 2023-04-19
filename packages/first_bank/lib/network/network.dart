import '../database/database_helper.dart';
import '../database/db_constants.dart';
import '../model/user.dart';

/**
 * Created by collins ihezie on 19/04/23
 */

class NetworkService {
  Future<User?> getUserByCustomerId(int customerId) async {
    final user = await DatabaseHelper.getById(DBConstants.userTable, DBConstants.customerId, customerId);
    if(user != null){
      return User.fromJson(user);
    }
    return null;
  }
}