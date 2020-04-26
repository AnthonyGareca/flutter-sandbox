import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final options = ['one', 'two', 'three', 'four', 'five'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temp Components'),
      ),
      body: ListView(
        children: _createItemsShort(),
      ),
    );
  }

  List<Widget> _createItemsShort() {
    return options.map( ( option ) => Column(
      children: <Widget>[
        ListTile(
          title: Text( option + '!'),
          subtitle: Text('subtitle'),
          leading: Icon( Icons.ac_unit ),
          trailing: Icon( Icons.arrow_forward_ios ),
          onTap: () {},
        ),
        Divider(),
      ],
    )).toList();
  }
}