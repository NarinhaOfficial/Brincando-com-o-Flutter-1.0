import 'package:flutter/material.dart';

class P_Home extends StatelessWidget {
  const P_Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Nome da loja'),
        ),
        body: SearchBar(
          leading: const Icon(Icons.search),
          hintText: 'Pesquisar',
        ),
      ),
    );
  }
}
