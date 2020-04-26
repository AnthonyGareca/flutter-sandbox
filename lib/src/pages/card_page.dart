import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTypeOne(),
          SizedBox(height: 30.0,),
          _cardTypeTwo(),
          SizedBox(height: 30.0,),
          _cardTypeOne(),
          SizedBox(height: 30.0,),
          _cardTypeTwo(),
          SizedBox(height: 30.0,),
          _cardTypeOne(),
          SizedBox(height: 30.0,),
          _cardTypeTwo(),
          SizedBox(height: 30.0,),
          _cardTypeOne(),
          SizedBox(height: 30.0,),
          _cardTypeTwo(),
          SizedBox(height: 30.0,),
          _cardTypeOne(),
          SizedBox(height: 30.0,),
          _cardTypeTwo(),
          SizedBox(height: 30.0,),
          _cardTypeOne(),
          SizedBox(height: 30.0,),
          _cardTypeTwo(),
          SizedBox(height: 30.0,),
        ],
      )
    );
  }

  Widget _cardTypeOne() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ) ,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon( Icons.photo_album, color: Colors.blue ),
            title: Text('Title of the card widget.'),
            subtitle: Text('Some large text to view who the card acts with its size management also practice a litle bit writing on the keyboard and english skills.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardTypeTwo() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://iso.500px.com/wp-content/uploads/2017/10/PhotographingTwilight_TannerWendellStewart-218136823.jpg'),
            placeholder: AssetImage('assets/original.gif'),
            fadeInDuration: Duration( milliseconds: 100 ),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Demo to look rounded corners'),
          ),
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}