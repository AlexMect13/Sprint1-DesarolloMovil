import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import 'one_key.dart';

// en este widget mostramos el keypad y los valores de las monedas
class KeyPad extends StatefulWidget {
  const KeyPad(
      {Key? key,
      required this.textCurrency1,
      required this.textCurrency2,
      required this.rate})
      : super(key: key);

  // estos tres valores son recibidos de converter_page
  final String textCurrency1;
  final String textCurrency2;
  final double rate;

  @override
  State<KeyPad> createState() => _KeyPadState();
}

class _KeyPadState extends State<KeyPad> {
  // valor de la moneda convertida
  double _currency2 = 0.0;
  // el valor de la moneda que es introducida en el keypad
  int _currency1 = 0;

  // función que cambia el estado del widget (_currency1, _currency2)
  void _onPressed(int k) {
    setState(() {
      if (k == 10) {
        // TODO
        // cuando k es 10 se debe volver el estado a cero
        _currency1 = 0;
        _currency2 = 0.0;
      } else {
        // TODO
        // _currency1 debe cambiar con el keypad
        _currency1 = int.parse(_currency1.toString() + k.toString());
        // _currency2 debe cambiar de acuerdo con _currency1 y la tasa de cambio
        _currency2 = (_currency1) * widget.rate;
      }
    });
  }

  @override
  void didUpdateWidget(covariant oldWidget) {
    super.didUpdateWidget(oldWidget);
    // aquí garantizamos que cuando el widget refresca el estado va a cero
    _currency2 = 0.0;
    _currency1 = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.5),
                child: Text(
                  widget.textCurrency1,
                  style: TextStyle(fontSize: 23),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                  padding: const EdgeInsets.all(8.5),
                  alignment: Alignment.centerRight,
                  child: Text(
                    _currency1.toString(),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 35),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.textCurrency2,
                  style: TextStyle(fontSize: 23),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.centerRight,
                  child: Text(
                    num.parse(_currency2.toStringAsFixed(4)).toString(),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 35),
                  ))
            ],
          ),
          Expanded(
            flex: 1,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  // TODO
                  // en cada OneKey se manda el número y _onPressed para callback
                  //const Text('OneKey para 7, 8 y 9'),
                  OneKey(number: 7, callback: ((k) => _onPressed(k))),
                  OneKey(number: 8, callback: ((k) => _onPressed(8))),
                  OneKey(
                      number: 9,
                      callback: ((k) {
                        _onPressed(9);
                      })),
                ]),
          ),
          Expanded(
            flex: 1,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  // TODO
                  // en cada OneKey se manda el número y _onPressed para callback
                  //const Text('OneKey para 6, 5 y 4'),
                  OneKey(
                      number: 6,
                      callback: ((k) {
                        _onPressed(6);
                      })),
                  OneKey(
                      number: 5,
                      callback: ((k) {
                        _onPressed(5);
                      })),
                  OneKey(
                      number: 4,
                      callback: ((k) {
                        _onPressed(4);
                      })),
                ]),
          ),
          Expanded(
            flex: 1,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  // TODO
                  // en cada OneKey se manda el número y _onPressed para callback
                  //const Text('OneKey para 1, 2 y 3'),
                  OneKey(
                      number: 1,
                      callback: ((k) {
                        _onPressed(1);
                      })),
                  OneKey(
                      number: 2,
                      callback: ((k) {
                        _onPressed(2);
                      })),
                  OneKey(
                      number: 3,
                      callback: ((k) {
                        _onPressed(3);
                      })),
                ]),
          ),
          Expanded(
            flex: 1,
            child: Row(children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: MaterialButton(
                      key: const Key("reset"),
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      color: Colors
                          .redAccent, //Theme.of(context).colorScheme.secondary,
                      onPressed: () {
                        _onPressed(10);
                      },
                      child: const Text("Reset",
                          style: TextStyle(
                            fontSize: 26.0,
                            color: Colors.white,
                          ))),
                ),
              ),
              // TODO
              // en cada OneKey se manda el número y _onPressed para callback
              //const Text('OneKey para 0')
              OneKey(
                  number: 0,
                  callback: ((p0) {
                    _onPressed(0);
                  })),
            ]),
          )
        ]);
  }
}
