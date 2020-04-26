import 'package:flutter/material.dart';

import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page')
      ),
      body: _buildList()
    );
  }

  Widget _buildList() {

    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: ( BuildContext context, AsyncSnapshot<List<dynamic>> snapshot ) {
        return ListView(
          children: _buildItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _buildItems( List<dynamic> data, BuildContext context ) {
    final List<Widget> response = [];

    data.forEach( (current) {
      final tempWidget = ListTile(
        title: Text( current['texto'] ),
        leading: getIconByName(current['icon']),
        trailing: Icon( Icons.keyboard_arrow_right, color: Colors.blue ),
        onTap: () {
          // final route = MaterialPageRoute(
          //   builder: (context) => AlertPage()
          // );
          // Navigator.push(context, route);
          Navigator.pushNamed(context, current['ruta']);
        },
      );
      response
        ..add( tempWidget )
        ..add( Divider() );
    });

    return response;

  }
}