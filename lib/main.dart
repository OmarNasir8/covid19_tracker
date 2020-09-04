import 'package:covid19tracker/app/services/api_services.dart';
import 'package:covid19tracker/repositries/Data_Repositry.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/services/api.dart';
import 'home_screen.dart';

//Author Omar Nasir

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<DataRepository>(
      create: (_) =>
          DataRepository(
              apiService: APIServices(AdminAPI.sandbox())
          ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Covid-19 Tracker',
        theme: ThemeData.dark(),
        home: HomeScreen(),
      ),
    );
  }
}


/*
  String _accessToken = "";
  int _cases;
  int _deaths = 0;
/*
  void _incrementCounter() async {
    final apiService = APIServices(AdminAPI.sandbox());
    final accessToken = await apiService.getAccessToken();
    final cases = await apiService.getEndpointData(accessToken: accessToken, endpoint: Endpoint.cases);
    final deaths = await apiService.getEndpointData(accessToken: accessToken, endpoint: Endpoint.deaths);
    setState(() {
      _accessToken = accessToken;
      _cases = cases;
      _deaths = deaths;
    });
  }
*/*/

