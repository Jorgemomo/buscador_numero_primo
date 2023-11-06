//Jorge Armando Morales Mora
//cc 1017124603

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Verificador de números primos',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(title: 'VERIFICADOR DE NÚMEROS PRIMOS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _primeNumber = TextEditingController();
  String _message = '';

  void _calculePrimeNumber() {
    setState(() {
      int number = int.parse(_primeNumber.text);
      if (number <= 1) {
        _message = 'El número $number ingresado, no es primo';
      } else {
        bool isPrime = true;
        for (int i = 2; i <= number ~/ 2; i++) {
          if (number % i == 0) {
            isPrime = false;
            break;
          }
        }
        if (isPrime) {
          _message = 'El número $number ingresado, es primo';
        } else {
          _message = 'El número $number ingresado, no es primo';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 104, 127, 158),
          image: DecorationImage(
            image: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRG_Q_XCsEDq5y3PRebmi3hLmnIRs13Z9hmBg&usqp=CAU'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Bienvenid@ al buscador de números primos:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.cyan),
                ),
                const SizedBox(
                  height: 18.0,
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold),
                  controller: _primeNumber,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ingrese número a verificar',
                    labelStyle: TextStyle(color:Colors.cyan, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      onPressed: _calculePrimeNumber,
                      child: const Text(
                        'Verificar número',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  _message,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.cyan),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}