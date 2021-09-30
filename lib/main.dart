import 'package:flutter/material.dart';
import 'questionario.dart';
import 'resultado.dart';

main() => runApp(PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final _perguntas = const [
    {
      "texto": 'Qual a sua cor favorita?',
      "respostas": [
        {"texto": "Preto", "Pontuação": 10},
        {"texto": "Vermelho", "Pontuação": 5},
        {"texto": "Verde", "Pontuação": 3},
        {"texto": "Branco", "Pontuação": 1},
      ],
    },
    {
      "texto": 'Qual o seu animal favorito?',
      "respostas": [
        {"texto": "Coelho", "Pontuação": 10},
        {"texto": "Cobra", "Pontuação": 5},
        {"texto": "Elefante", "Pontuação": 3},
        {"texto": "Leão", "Pontuação": 1}
      ],
    },
    {
      "texto": 'Qual o seu instrutor favorito?',
      "respostas": [
        {"texto": "Leo", "Pontuação": 10},
        {"texto": "Maria", "Pontuação": 5},
        {"texto": "João", "Pontuação": 3},
        {"texto": "Pedro", "Pontuação": 1}
      ],
    }
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Perguntas'),
              centerTitle: true,
            ),
            body: temPerguntaSelecionada
                ? Questionario(
                    perguntas: _perguntas,
                    perguntaSelecionada: _perguntaSelecionada,
                    quandoResponder: _responder)
                : Resultado()));
  }
}

class PerguntaApp extends StatefulWidget {
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
