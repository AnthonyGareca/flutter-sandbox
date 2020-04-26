import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  InputsPage({Key key}) : super(key: key);

  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  String _nameValue = '';
  String _emailValue = '';
  String _passwordValue = '';
  String _dateValue = '';
  String _selectedOption = 'fly';

  List<String> _powers = ['fly', 'X rays', 'super blow', 'super strong'];

  TextEditingController _inputFieldDateController = new TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs page'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0,
        ),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropdown(),
          Divider(),
          _createPerson(),
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Characters: ${ _nameValue.length }'),
        hintText: 'Name of the person',
        labelText: 'Name',
        helperText: 'Only the name',
        suffixIcon: Icon( Icons.accessibility ),
        icon: Icon( Icons.account_circle ),
      ),
      onChanged: (currentValue) {
        setState(() => _nameValue = currentValue);
      },
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Characters: ${ _emailValue.length }'),
        hintText: 'Email of the person',
        labelText: 'Email',
        helperText: 'Only the email',
        suffixIcon: Icon( Icons.alternate_email ),
        icon: Icon( Icons.email ),
      ),
      onChanged: (currentValue) {
        setState(() => _emailValue = currentValue);
      },
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Characters: ${ _passwordValue.length }'),
        hintText: 'Passwor of the account',
        labelText: 'Password',
        helperText: 'Only the password',
        suffixIcon: Icon( Icons.lock_open ),
        icon: Icon( Icons.lock ),
      ),
      onChanged: (currentValue) {
        setState(() => _passwordValue = currentValue);
      },
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Characters: ${ _passwordValue.length }'),
        hintText: 'Birth date',
        labelText: 'Birth date',
        helperText: 'Only the birth date',
        suffixIcon: Icon( Icons.perm_contact_calendar ),
        icon: Icon( Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate( context );
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2000),
      lastDate: new DateTime(2030),
      locale: Locale('es', 'ES'),
    );

    if( picked != null ) {
      setState(() {
        _dateValue = picked.toString();
        _inputFieldDateController.text = _dateValue;
      });
    }
  }

  List<DropdownMenuItem<String>> _getDropdownOptions() {
    List<DropdownMenuItem<String>> list = new List();

    _powers.forEach( (power) {
      list.add( DropdownMenuItem(
        child: Text(power),
        value: power,
      ));
    });
    return list;
  }

  Widget _createDropdown() {
    return Row(
      children: <Widget>[
        Icon( Icons.select_all ),
        SizedBox(width: 30.0,),
        Expanded(
          child: DropdownButton(
            value: _selectedOption,
            items: _getDropdownOptions(),
            onChanged: (currentValue) {
              setState(() {
                _selectedOption = currentValue;
              });
            },
          ),
        ),
      ],
    );
    
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Name is: $_nameValue...'),
      subtitle: Text('Email: $_emailValue'),
      trailing: Text(_selectedOption),
    );
  }

}