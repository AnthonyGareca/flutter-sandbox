import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 25.0;
  bool _isBlockedCheckbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            // SizedBox(height: 100.0,),
            _createSider(),
            _createCheckbox(),
            _createSwitch(),
            _createImage(),
          ],
        ),
      ),
    );
  }

  Widget _createSider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'ImageSize',
      divisions: 20,
      value: _sliderValue,
      min: 0.0,
      max: 400.0,
      onChanged: _isBlockedCheckbox ? null : ( newValue ) {
        setState(() {
          _sliderValue = newValue;
          print(_sliderValue);
        });
      },
    );
  }

  Widget _createImage() {
    return Expanded(
      child: Image(
        image: NetworkImage('https://gizmostory.com/wp-content/uploads/2020/02/Haikyuu-2-25-4-1000x563-1-696x392.jpg'),
        width: _sliderValue,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _createCheckbox() {
    return CheckboxListTile(
      title: Text('Block slider'),
      value: _isBlockedCheckbox,
      onChanged: (value) {
        setState(() {
          _isBlockedCheckbox = value;
        });
      },
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Block slider'),
      value: _isBlockedCheckbox,
      onChanged: (value) {
        setState(() {
          _isBlockedCheckbox = value;
        });
      },
    );
  }

}