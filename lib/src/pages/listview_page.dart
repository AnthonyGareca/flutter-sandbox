import 'dart:async';

import 'package:flutter/material.dart';

class ListviewPage extends StatefulWidget {

  @override
  _ListviewPageState createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {

  ScrollController _scrollController = new ScrollController();
  List<int> _numbersList = new List();
  int _lastItemId = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addItems();
    _scrollController.addListener(() {
      if( _scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _fetchItems();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listview Page'),
      ),
      body: Stack(
        children: <Widget>[
          _createList(),
          _createLoading(),
        ],
      ),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _numbersList.length,
        itemBuilder: (BuildContext context, index) {
          final idImage = _numbersList[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/id/$idImage/500/400'),
            placeholder: AssetImage('assets/original.gif'),
          );
        },
      ),
      onRefresh: _refreshPage,
    );
  }

  void _addItems() {
    for( var i = 0; i < 10; i++ ) {
      _lastItemId++;
      _numbersList.add( _lastItemId );
    }
    setState(() {
      
    });
  }

  _fetchItems() {
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    return new Timer(duration, _responseHTTP);
  }

  void _responseHTTP() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn
    );
    _addItems();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15.0,)
        ],
      );
    } else {
      return Container();
    }
  }

  Future<Null> _refreshPage() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _numbersList.clear();
      _lastItemId++;
      _addItems();
    });
    return Future.delayed(duration);
  }
}