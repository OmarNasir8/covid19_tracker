import 'dart:ui';

import 'package:covid19tracker/app/services/api.dart';
import 'package:covid19tracker/endpoint_card.dart';
import 'package:covid19tracker/repositries/Data_Repositry.dart';
import 'package:covid19tracker/repositries/endpoint_data.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  EndpointsData _endpointData;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    updateData();
  }

  Future<void> updateData() async {
      final dataRepositry = Provider.of<DataRepository>(context, listen: false);
      final endpointData = await dataRepositry.getAllEndpointsData();
      setState(() {
        _endpointData = endpointData;
      });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.red,
        items: <Widget>[
          Icon(Icons.format_list_bulleted, size: 30, color: Colors.white),
          Icon(Icons.home, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: ShowPage(),
    );
  }

  SafeArea ShowPage() {
    if(_page == 0) {
      return SafeArea(
        child: RefreshIndicator(
          onRefresh: updateData,
          child: ListView(
            children: <Widget>[
              Text("updated statistics", textAlign: TextAlign.center, style: TextStyle(color: Colors.black),),
              EndpointCard(
                endpoint: Endpoint.cases,
                value: _endpointData != null ? _endpointData.values[Endpoint.cases] : null,
                color: Colors.deepPurple,
              ),
              EndpointCard(
                endpoint: Endpoint.casesConfirmed,
                value: _endpointData != null ? _endpointData.values[Endpoint.casesConfirmed] : null,
                color: Colors.black,
              ),
              EndpointCard(
                endpoint: Endpoint.deaths,
                value: _endpointData != null ? _endpointData.values[Endpoint.deaths] : null,
                color: Colors.red,
              ),
              EndpointCard(
                endpoint: Endpoint.recovered,
                value: _endpointData != null ? _endpointData.values[Endpoint.recovered] : null,
                color: Colors.green,
              ),
              Image.asset('assets/statimg.png', fit: BoxFit.contain, height: 150, width: 35,)
            ],
          ),
        ),
      );
    } else {
      return SafeArea(
        child: Column(
          children: <Widget>[
           Image.asset('assets/preventcovid.jpg', fit: BoxFit.contain,),
            Center(
              child: FlatButton(
                onPressed: () {

                },
                child: Image.asset('assets/callnow.jpg', fit: BoxFit.contain, height: 150, width: 700,),
              ),
            ),
            SizedBox(height: 50,),
            Image.asset('assets/tests.PNG', fit: BoxFit.contain),
          ],
        ),
      );
    }
  }


}


/*

return Center(
child: Text("1", textScaleFactor: 10.0, style: TextStyle(
color: Colors.black
),),
);
*/
