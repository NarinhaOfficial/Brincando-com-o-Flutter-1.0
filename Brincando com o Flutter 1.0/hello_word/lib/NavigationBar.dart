import 'package:flutter/material.dart';

void main(){
  runApp(BotaoDeNavegacao());
}

class BotaoDeNavegacao extends StatelessWidget{
  const BotaoDeNavegacao({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Botão de Navegação',
      home: Scaffold(appBar: AppBar(title: const Text('Botão de Navegação do Material 3'),
      ),
      //Fora do home e do body
      bottomNavigationBar: NavigationBar(
        destinations: [
        NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.explore), label: 'Explore'),
        NavigationDestination(icon: Icon(Icons.person), label: 'Perfil'),
        NavigationDestination(icon: Icon(Icons.settings_rounded), label: 'Configurações'),
      ],
      ),
      ),
    );
  }
}