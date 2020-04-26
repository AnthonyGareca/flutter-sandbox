import 'package:flutter/material.dart';

import 'dart:math';

class AnimatedContainerPage extends StatefulWidget {

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  final Random _random = Random();

  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.play_arrow ),
        onPressed: _changeState,
      ),
    );
  }

  void _changeState() {
    print('object');
    setState(() {
      _width = _random.nextInt(350).toDouble();
      _height =  _random.nextInt(350).toDouble();
      _borderRadius = BorderRadius.circular( _random.nextInt(200).toDouble() );
      _color = Color.fromRGBO(
        _random.nextInt(255),
        _random.nextInt(255),
        _random.nextInt(255),
        _random.nextInt(255).toDouble()
      );
    });
    

  }
}