import 'package:flutter/material.dart';

void main() {
  runApp(const GastosApp());
}

class GastosApp extends StatelessWidget {
  const GastosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meus Gastos',
      home: const Gastos(),
    );
  }
}

class Gastos extends StatefulWidget {
  const Gastos({super.key});

  @override
  State<Gastos> createState() => _Gastos();
}

class _Gastos extends State<Gastos> {
  final List<Map<String, dynamic>> _gastos = [];

  void _adicionar(String nome, double valor){
    setState(() {
      _gastos.add({'nome': nome, 'valor': valor},);
    });
  }

  void _mostrar(){
    final TextEditingController nomeController = TextEditingController();
    final TextEditingController valorController = TextEditingController();

    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text('Adicionar gasto:'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nomeController,
                  decoration: const InputDecoration(labelText: 'Informe seu gasto'),
                ),
                TextField(
                  controller: valorController,
                  decoration: const InputDecoration(labelText: 'Informe o valor:'),
                  keyboardType: TextInputType.number,
                )
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), 
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: (){
                final String nome = nomeController.text;
                final double? valor = double.tryParse(valorController.text);

                if(nome.isNotEmpty && valor != null){
                  _adicionar(nome, valor);
                  Navigator.of(context).pop();
                }
              }, 
              child: const Text('Adicionar'),
            ),
          ],
        );
      }
      );
  }

  void _apagar(int index){
    setState(() {
      _gastos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Gastos:'),
        backgroundColor: Colors.greenAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _mostrar,
          )
        ],
      ),
      body: ListView.builder(
        //itemCount - Define a quantidade total de itens que a lista terá.
        //_gastos.length retorna o número total de elementos armazenados na lista _gastos.
        itemCount: _gastos.length,
        itemBuilder: (context, index){
          final gasto = _gastos[index];
          return ListTile(
            title: Text(gasto['nome']),
            //toStringAsFixed(2): Garante que o número tenha duas casas decimais.
            subtitle: Text('R\$ ${gasto['valor'].toStringAsFixed(2)}'),
            trailing: IconButton(
              onPressed: () => _apagar(index), 
              icon: const Icon(Icons.delete, color: Colors.red,)
            ),
          );
        },
      ),
    );
  }
}
