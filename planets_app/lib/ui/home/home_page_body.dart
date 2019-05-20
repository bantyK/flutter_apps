import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:planets_app/model/planets.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemBuilder: (context, index) => PlanetRow(planets[index]),
          itemCount: planets.length,
          padding: new EdgeInsets.symmetric(vertical: 16.0)),
    );
  }
}

class PlanetRow extends StatelessWidget {
  final Planet _planet;

  PlanetRow(this._planet);

  @override
  Widget build(BuildContext context) {
    final baseTextStyle = TextStyle(fontFamily: "Poppins");

    final headerTextStyle = baseTextStyle.copyWith(
        color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w800);

    final regularTextStyle = baseTextStyle.copyWith(
        color: const Color(0xffb6b2df),
        fontSize: 9.0,
        fontWeight: FontWeight.w400);

    final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 12.0);

    final planetThumbnail = Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.centerLeft,
      child: Image(
        image: AssetImage(_planet.image),
        height: 92.0,
        width: 92.0,
      ),
    );

    final planetCardContent = new Container(
      margin: EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(
            _planet.name,
            style: headerTextStyle,
          ),
          new Container(height: 10.0),
          new Text(_planet.location, style: subHeaderTextStyle),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: new Color(0xff00c6ff)),
          new Row(
            children: <Widget>[
              Expanded(
                child: _planetValue(
                    value: _planet.distance,
                    image: "assets/images/ic_distance.png",
                    style: regularTextStyle),
              ),
              Expanded(
                child: _planetValue(
                    value: _planet.gravity,
                    image: "assets/images/ic_gravity.png",
                    style: regularTextStyle),
              )
            ],
          ),
        ],
      ),
    );

    final planetCard = Container(
      child: planetCardContent,
      height: 124.0,
      margin: EdgeInsets.only(left: 46.0),
      decoration: BoxDecoration(
          color: Color(0xFF333366),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0))
          ]),
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Stack(
        children: <Widget>[planetCard, planetThumbnail],
      ),
    );
  }

  Row _planetValue({String value, String image, TextStyle style}) {
    return Row(
      children: <Widget>[
        new Image.asset(image, height: 12.0),
        new Container(width: 8.0),
        new Text(
          value,
          style: style,
        ),
      ],
    );
  }
}
