import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  double precoAlcool;
  double precoGasolina;
  double quilometroTotal;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Icon(Icons.directions_car, size: 204, color: Color(0xff62ffdb),),
          ),
          Expanded(
            flex:3,
            child: Form(
              key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextFormField(
                          validator: (text) {
                            if (text.isEmpty) {
                              return 'Campo vazio';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Preço Gasolina',
                            fillColor: Colors.white54,
                            filled: true,
                          ),
                          onFieldSubmitted: (text) {
                            setState(() {
                              widget.precoGasolina = double.parse(text);
                            });
                          },
                          keyboardType: TextInputType.number),
                      TextFormField(
                          validator: (text) {
                            if (text.isEmpty) {
                              return 'Campo vazio';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Preco Alcool',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            fillColor: Colors.white54,
                            filled: true,
                          ),
                          onFieldSubmitted: (text) {
                            setState(() {
                              widget.precoAlcool = double.parse(text);
                            });
                          },
                          keyboardType: TextInputType.number),
                      TextFormField(
                          validator: (text) {
                            if (text.isEmpty) {
                              return 'Campo vazio';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Quilometragem',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            fillColor: Colors.white54,
                            filled: true,
                          ),
                          onFieldSubmitted: (text) {
                            setState(() {
                              widget.quilometroTotal = double.parse(text);
                            });
                          },
                          keyboardType: TextInputType.number),
                       InkWell(
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                            resCont(widget.precoGasolina, widget.precoAlcool,
                                widget.quilometroTotal);
                          }
                        },
                        child: new Container(
                          //width: 100.0,
                          height: 50.0,
                          decoration: new BoxDecoration(
                            color: Color(0xff62ffdb),
                            border: new Border.all(color: Colors.white, width: 2.0),
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                          child: new Center(child: new Text('Calcular', style: new TextStyle(fontSize: 18.0, color: Colors.black),),),
                        ),
                      ),
                    ],
                  ),
                ),
            ),
          )
        ],
      ),
    );
  }

  void resCont(double gasolina, double alcool, double quilometragem) {
    double gastoGasolina =  (quilometragem / 11) * gasolina;
    double gastoAlcool = (quilometragem / 9) * alcool;

    if (gastoAlcool > gastoGasolina) {

      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Resultado"),
            content: new Text("Gasolina compensa mais para a quilometragem descrita: R\$ ${gastoGasolina.toStringAsFixed(2)}" ),
            actions: <Widget>[
              FlatButton(
                child:  Text("Fechar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (gastoGasolina > gastoAlcool) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Resultado"),
            content: new Text("Alcool compensa mais para a quilometragem descrita: R\$ ${gastoAlcool.toStringAsFixed(2)}"),
            actions: <Widget>[
               FlatButton(
                child:  Text("Fechar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Resultado"),
            content: new Text("Tanto gasolina quanto alcool darão o mesmo valor quilometragem descrita: R\$ ${gastoGasolina.toStringAsFixed(2)}"),
            actions: <Widget>[
              FlatButton(
                child:  Text("Fechar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
