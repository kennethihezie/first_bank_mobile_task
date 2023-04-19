import 'package:first_bank/data/data.dart';
import 'package:first_bank/database/database_helper.dart';
import 'package:first_bank/database/db_constants.dart';
import 'package:flutter/cupertino.dart';
import 'app/app.dart';
import 'app/router.dart';
import 'di/di.dart';

/**
 * Created by collins ihezie on 19/04/23
 */

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DiContainer.setUpDi();

  await DatabaseHelper.openDataBase();

  if((await DatabaseHelper.getAllModel(DBConstants.userTable))?.isEmpty == true){
    //Populate database
    await DatabaseHelper.insertModelBatch(DBConstants.userTable, Api.successResponse["data"]);
  }

  runApp(MobileAssessmentApp(router: MobileAssessmentRouter.router));
}


