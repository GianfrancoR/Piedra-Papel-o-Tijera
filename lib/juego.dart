import 'package:flutter/material.dart';
import 'dart:math';

class Juego extends StatefulWidget {
  @override
  _JuegoState createState() => _JuegoState();
}

class _JuegoState extends State<Juego> {

  var _imagenApp = AssetImage("images/nulo.png");
  var _mensage = "Opcion del Jugador";

  void _opcaoSelecionada(String eleccionUser){

    var opcoes = ["piedra", "papel", "tijera"];
    var numero = Random().nextInt(3);
    var eleccionAlg = opcoes[numero];

    print("Eleccion del Algoritmo: " + eleccionAlg);
    print("Eleccion del Jugador: " + eleccionUser);


    //Exibição da imagem escolhida pelo App
    switch( eleccionAlg ){
      case "piedra" :
        setState(() {
          this._imagenApp = AssetImage("images/piedra.png");
        });
        break;
      case "papel" :
        setState(() {
          this._imagenApp = AssetImage("images/papel.png");
        });
        break;
      case "tijera" :
        setState(() {
          this._imagenApp = AssetImage("images/tijera.png");
        });
        break;
    }

    //Validacion del ganador
    //User ganador
    if(
    (eleccionUser == "piedra" && eleccionAlg == "tijera") ||
        (eleccionUser == "tijera" && eleccionAlg == "papel") ||
        (eleccionUser == "papel" && eleccionAlg == "piedra")
    ){
      setState(() {
        this._mensage = "Enhorabuena!!! Ganaste :)";
      });
      //App Ganhador
    }else if(
    (eleccionAlg == "piedra" && eleccionUser == "tijera") ||
        (eleccionAlg == "tijera" && eleccionUser == "papel") ||
        (eleccionAlg == "papel" && eleccionUser == "piedra")
    ){
      setState(() {
        this._mensage = "Perdiste :(";
      });
    }else{
      setState(() {
        this._mensage = "Empatamos ;)";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Piedra Papel o Tijera"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //1) text
          //2) imagen
          //3) text resultado
          //4) Linea 3 imagenes
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Eleccion del Algoritmo",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image(image: this._imagenApp,),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensage,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("piedra") ,
                child: Image.asset("images/piedra.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel") ,
                child: Image.asset("images/papel.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tijera") ,
                child: Image.asset("images/tijera.png", height: 100,),
              )
              /*
              Image.asset("imagens/piedra.png", height: 100,),
              Image.asset("imagens/papel.png", height: 100,),
              Image.asset("imagens/tijera.png", height: 100,)
              */
            ],
          )
        ],
      ),
    );
  }
}
