import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const CurrencyConvertor());
}

class CurrencyConvertor extends StatelessWidget {
  const CurrencyConvertor({Key? key}) : super(key: key);
  final _imagePath = 'lib/assets/ron.jpg';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Convert(),
    );
  }
}

class Convert extends StatefulWidget {
  const Convert({Key? key}) : super(key: key);

  @override
  State<Convert> createState() => _ConvertState();
}

class _ConvertState extends State<Convert> {
  bool _is_ron = true;
  double _input_ammount = 0;
  double _output_ammout = 0;
  double _eurron = 4.5;
  String _output = "0.00EURO";
  String _input_name = "RON";

  final TextEditingController input_val = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Currency Convertor"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Image(
                image: ResizeImage(AssetImage('ron.jpg'),
                    width: 400, height: 250)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 150,
                        child: TextField(
                          controller: input_val,
                          decoration: InputDecoration(
                            labelText: _input_name,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_is_ron == false) {
                            _input_name = "RON";
                            _output = "EURO";
                            _is_ron = true;
                          } else {
                            _input_name = "EURO";
                            _output = "RON";
                            _is_ron = false;
                          }
                          setState(() {});
                        },
                        child: const Icon(Icons.arrow_circle_right_outlined),
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          _output,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ]),
                const SizedBox(height: 35),
                GestureDetector(
                  onTap: () {
                    try {
                      _input_ammount = double.parse(input_val.text);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Please enter a valid number")));
                    }
                    if (_is_ron == true) {
                      _output_ammout = _input_ammount / _eurron;
                      _output = ("${_output_ammout.toStringAsFixed(2)}EURO");
                    } else {
                      _output_ammout = _input_ammount * _eurron;
                      _output = ("${_output_ammout.toStringAsFixed(2)}RON");
                    }

                    setState(() {});
                  },
                  child: const Text(
                    "CONVERT",
                    style: TextStyle(
                        fontSize: 30,
                        //height: 4,
                        color: Colors.blue,
                        backgroundColor: Colors.yellow),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 0),
          ],
        ),
      ),
    );
  }
}
