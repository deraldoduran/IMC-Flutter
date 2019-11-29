import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController weightControler = new TextEditingController();
  TextEditingController heightControler = new TextEditingController();

  String _infoText="informe seus dados";

  void _resetFields(){
    weightControler.text="";
    heightControler.text="";
    _infoText="informe seus dados";
  }

  void _calculate(){
    setState(() {
      double weight = double.parse(weightControler.text);
      double height = double.parse(heightControler.text)/100;
      double imc = weight/(height*height);
      print(imc);
      if(imc<18.6){
        _infoText="Abaixo do Peso (${imc.toStringAsPrecision(3)})";

      }else if(imc>18.7 && imc<24.9){
        _infoText="Peso Ideal (${imc.toStringAsPrecision(3)})";

      }else if(imc>25.0 && imc<29.9) {
        _infoText = "Levemente Acima do Peso (${imc.toStringAsPrecision(3)})";
      }else if(imc>30.0 && imc<34.9) {
        _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(3)})";
      }else if(imc>35.0 && imc<39.9) {
        _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(3)})";
      }else  {
        _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(3)})";
      }

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person_outline, size: 120.0, color: Colors.green),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Peso em Kilograma",
                  labelStyle: TextStyle(color: Colors.green)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25.0),
              controller: weightControler,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Altura em (cm)",
                  labelStyle: TextStyle(color: Colors.green)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25.0),
              controller: heightControler,
            ),
            Padding(
              padding: EdgeInsets.only(top:10.0, bottom: 10.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: _calculate,
                  child: Text("Calcular",style: TextStyle(color: Colors.white,fontSize:25.0),),
                  color: Colors.green,
                ),
              ),
            ),
            Text(_infoText,
              textAlign: TextAlign.center,
              style: TextStyle(color:Colors.green, fontSize: 25.0),
            )
          ],
        ),
      )
    );
  }
}
