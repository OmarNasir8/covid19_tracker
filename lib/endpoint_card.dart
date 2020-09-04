import 'package:covid19tracker/app/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EndpointCardData{
  EndpointCardData(this.title, this.assetName);
  final String title;
  final String assetName;
}

class EndpointCard extends StatelessWidget {

  const EndpointCard({Key key, this.endpoint, this.value, this.color});
  final Endpoint endpoint;
  final int value;
  final Color color;

  static Map<Endpoint, EndpointCardData> _cardData = {
    Endpoint.cases:
    EndpointCardData('Cases', 'assets/count.png'),
    Endpoint.casesSuspected: EndpointCardData(
        'Suspected cases', 'assets/suspect.png'),
    Endpoint.casesConfirmed: EndpointCardData(
        'Confirmed cases', 'assets/fever.png'),
    Endpoint.deaths:
    EndpointCardData('Deaths', 'assets/death.png'),
    Endpoint.recovered:
    EndpointCardData('Recovered', 'assets/patient.png'),
  };

  @override
  Widget build(BuildContext context) {
    final cardData = _cardData[endpoint];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        color: this.color,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  cardData.title,
                  style: Theme.of(context).textTheme.headline
              ),
              SizedBox(height:5),
              SizedBox(
                height: 52,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(cardData.assetName),
                    Text(
                      value != null ? value.toString() : "",
                        style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white)
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
