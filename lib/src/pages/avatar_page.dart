import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  static final pageName = 'avatar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Avatar Page' ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://gfx.antyradio.pl/var/antyradio/storage/images/film/duperele/jak-miala-wygladac-walkiria-w-filmie-thor-ragnarok-19547/1350241-1-pol-PL/Jak-miala-wygladac-Walkiria-w-filmie-Thor-Ragnarok_article.jpg'),
              // radius: 20.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundColor: Colors.purple,
              child: Text('WC'),
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://depor.com/resizer/uEVrkwrvm7g2AEdRAO_vBqnHy4c=/980x528/smart/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/SQQLYTWMUNBOXMVHGJJ4MPHNYM.jpg'),
          placeholder: AssetImage('assets/original.gif'),
          fadeInDuration: Duration( milliseconds: 100 ),
        ),
      )
    );
  }
}