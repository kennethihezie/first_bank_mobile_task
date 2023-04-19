import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/**
 * Created by collins ihezie on 19/04/23
 */

class MobileAssessmentApp extends StatelessWidget {
  final GoRouter router;
  const MobileAssessmentApp({Key? key, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      title: 'Freeda',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
