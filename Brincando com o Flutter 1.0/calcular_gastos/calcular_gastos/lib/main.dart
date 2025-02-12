import 'package:flutter/material.dart';

void main() {
  runApp(const GastosApp());
}

class GastosApp extends StatelessWidget {
  const GastosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove a faixa de debug
      title: 'Meus Gastos',
      home: const Gastos(),
    );
  }
}

class Gastos extends StatefulWidget {
  const Gastos({super.key});

  @override
  State<Gastos> createState() => _GastosState();
}

class _GastosState extends State<Gastos> {
  final List<Map<String, dynamic>> _gastos = [];

  void _adicionarGasto(String nome, double valor) {
    setState(() {
      _gastos.add({'nome': nome, 'valor': valor});
    });
  }

  void _mostrarDialogo() {
    final TextEditingController nomeController = TextEditingController();
    final TextEditingController valorController = TextEditingController();

    showDialog(
      //O context é como se fosse o endereço da caixa de diálogo do Scaffold
      //Ele informa ao flutter onde exibir o diálogo
      context: context,
      //O builder é do próprio diálogo
      //Serve para os widgets dentro do AlertDialog acessarem a hierarquia corretamente
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Adicionar Gasto'),
          //O content: é uma propriedade do widget AlertDialog que define o conteúdo principal do diálogo.
          //SingleChildScrollView → Para Conteúdos Pequenos e Fixos O ListView para conteúdos grandes
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nomeController,
                  decoration:
                      const InputDecoration(labelText: 'Informe o gasto'),
                ),
                TextField(
                  controller: valorController,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(labelText: 'Informe o valor'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                final String nome = nomeController.text;
                //O ? indica que a variável pode armazenar um valor nulo caso a conversão falhe.
                //Tenta converter (tryParse) o texto digitado no campo (valorController.text) para um número do tipo double.
                final double? valor = double.tryParse(valorController.text);

                if (nome.isNotEmpty && valor != null) {
                  _adicionarGasto(nome, valor);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Gastos'),
        backgroundColor: Colors.greenAccent,
      ),
      //Para listas grandes. O ListView sem o buider para pequenas e médias
      body: ListView.builder(
        itemCount: _gastos.length,
        itemBuilder: (context, index) {
          final gasto = _gastos[index];
          return ListTile(
            title: Text(gasto['nome']),
            subtitle: Text('R\$ ${gasto['valor'].toStringAsFixed(2)}'),
          );
        },
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarDialogo,
        child: const Icon(Icons.add),
        backgroundColor: Colors.greenAccent,
      ),

    );
  }
}
