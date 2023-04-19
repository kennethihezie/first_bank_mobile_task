import '../model/user.dart';
import '../network/network.dart';

/**
 * Created by collins ihezie on 19/04/23
 */

class RepositoryService{
  final NetworkService _networkService;
  RepositoryService(this._networkService);

  Future<User?> getUserByCustomerId(int customerId) async {
    return _networkService.getUserByCustomerId(customerId);
  }
}