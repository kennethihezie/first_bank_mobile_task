import 'package:first_bank/network/network.dart';
import 'package:first_bank/repository/repository.dart';
import 'package:get_it/get_it.dart';


/**
 * Created by collins ihezie on 19/04/23
 */

class DiContainer {
  static final getIt = GetIt.instance;

  static setUpDi() async {
    getIt.registerLazySingleton<NetworkService>(
            () => NetworkService());

    getIt.registerLazySingleton<RepositoryService>(
            () => RepositoryService(getIt.get()));
  }
}