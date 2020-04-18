import 'package:diariomicfec/view/select_screen.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:diariomicfec/src/input_mask.dart';
import 'package:diariomicfec/src/input_validate.dart';

class UsuScreen extends StatefulWidget {
  @override
  _UsuScreenState createState() => _UsuScreenState();
}

class _UsuScreenState extends State<UsuScreen> {
  String sexoSelect;

  ImputValidate _imputsValidate = ImputValidate();

  @override
  void initState() {
    super.initState();
    sexoSelect = '';
  }

  @override
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.green,
                Colors.blue,
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Icon(
                  Icons.person,
                  size: 100,
                  color: Colors.blue,
                ),
              ),
              nomeImput(),
              emailInput(),
              telefoneInput(),
              Row(
                children: <Widget>[
                  idadeImput(),
                  sexoInput(),
                ],
              ),
              button(),
            ],
          ),
        ),
      ),
    );
  }

  Widget nomeImput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
      child: new TextFormField(
        style: TextStyle(
          color: Colors.green,
          fontSize: 18,
        ),
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
          labelText: 'Nome Completo',
          hintText: 'Ex: Ana Lívia',
          labelStyle: TextStyle(
            color: Colors.green,
          ),
          icon: new Icon(
            Icons.person,
            color: Colors.grey,
          ),
        ),
        validator: _imputsValidate.validateName,
      ),
    );
  }

  Widget telefoneInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        style: TextStyle(
          color: Colors.green,
          fontSize: 18,
        ),
        inputFormatters: [phoneMask],
        maxLines: 1,
        keyboardType: TextInputType.phone,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: '(00) 000-000-000 ',
            labelText: 'Contato',
            labelStyle: TextStyle(
              color: Colors.green,
            ),
            icon: new Icon(
              Icons.phone,
              color: Colors.grey,
            )),
        validator: _imputsValidate.validateMobile,
      ),
    );
  }

  Widget emailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        style: TextStyle(
          color: Colors.green,
          fontSize: 18,
        ),
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Ex: exemplo@micfec.com',
          labelText: 'Email',
          labelStyle: TextStyle(
            color: Colors.green,
          ),
          icon: new Icon(
            Icons.email,
            color: Colors.grey,
          ),
        ),
        validator: _imputsValidate.validateEmail,
      ),
    );
  }

  Widget idadeImput() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: new TextFormField(
          style: TextStyle(
            color: Colors.green,
            fontSize: 18,
          ),
          maxLines: 1,
          keyboardType: TextInputType.number,
          autofocus: false,
          decoration: new InputDecoration(
            hintText: 'Ex: 18',
            labelText: 'Idade',
            labelStyle: TextStyle(
              color: Colors.green,
            ),
            icon: new Icon(
              Icons.sentiment_satisfied,
              color: Colors.grey,
            ),
          ),
          validator: _imputsValidate.validateEge,
        ),
      ),
    );
  }

  Widget sexoInput() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
        child: DropDownFormField(
          titleText: 'Sexo',
          hintText: sexoSelect.isEmpty ? 'Seu sexo' : sexoSelect,
          value: sexoSelect,
          validator: (value) {
            if (sexoSelect.isEmpty || sexoSelect == null) {
              return 'Selecione o Sexo';
            }
          },
          onChanged: (value) {
            setState(() {
              sexoSelect = value;
            });
          },
          dataSource: [
            {
              "display": "Masculino",
              "value": "Masculino",
            },
            {
              "display": "Feminino",
              "value": "Feminino",
            },
            {
              "display": "Outro",
              "value": "Outro",
            },
          ],
          textField: 'display',
          valueField: 'value',
        ),
      ),
    );
  }

  Widget button() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: GestureDetector(
        onTap: () {
          if (_formKey.currentState.validate()) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SelectScreen()),
            );
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 30),
          height: 50,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                offset: Offset(0.0, 2.0),
                blurRadius: 6.0,
              ),
            ],
            gradient: LinearGradient(
              colors: [
                Colors.green,
                Colors.blue,
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          child: Center(
            child: Text(
              'confirmar'.toUpperCase(),
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
