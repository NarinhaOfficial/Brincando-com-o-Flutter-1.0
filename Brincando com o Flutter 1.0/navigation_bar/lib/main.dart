import 'package:flutter/material.dart';
import 'package:navigation_bar/home.dart';
import 'package:navigation_bar/explorar.dart';
import 'package:navigation_bar/perfil.dart';
import 'package:navigation_bar/configuracao.dart';
void main(){
    runApp(Debaixo());
}

class Debaixo extends StatefulWidget{
    const Debaixo({super.key});
    
    @override
    State<Debaixo>createState()=>_Debaixo();
}
class _Debaixo extends State<Debaixo>{
    //A página atual(P_Home por ser a primeira da lista) é 0
    int atual = 0;
    //Tem que estar na mesma sequência dos botões
    final List<Widget> _paginas = [
        P_Home(),
        P_Explorar(),
        P_Perfil(),
        P_Configuracao(),
    ];
    @override
    Widget build(BuildContext context){
        return MaterialApp(
          home: Scaffold(
            //Aqui entra a lista de paginas (_paginas) onde vai mostrar a página atual
            body: Center(
                child: _paginas[atual],
            ),
            bottomNavigationBar: NavigationBar(onDestinationSelected: (int mudarPagina){
                setState(() {
                  atual = mudarPagina;
                });
            },
            selectedIndex: atual,
            destinations: [
                NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                NavigationDestination(icon: Icon(Icons.explore), label: 'Explorar'),
                NavigationDestination(icon: Icon(Icons.person), label: 'Perfil'),
                NavigationDestination(icon: Icon(Icons.settings_rounded), label: 'Configuracao'),
            ],),
          ),  
        );
    }
}
