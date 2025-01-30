import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Meu primeiro app',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello, Word!'),
        ),
        body: const Center(child: Text('Olá, mundo!'),)
      ),
    );
  }
}
