import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    //Método que vai inflar nosso app (executar)
    MaterialApp(
      // um Widget que já vem com bastante coisas d configuração pronta
      home: const HomePage(), //Setando que minaha home será a Home page
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  List<String> imagens = [
    'https://cdn.pixabay.com/photo/2021/04/22/06/40/duck-6198196_960_720.jpg',
    'https://cdn.pixabay.com/photo/2022/06/27/08/37/lotus-7287044_960_720.jpg',
    'https://cdn.pixabay.com/photo/2022/06/02/19/25/giraffes-7238815_960_720.jpg',
    'https://cdn.pixabay.com/photo/2022/06/25/11/20/bee-7283312_960_720.jpg',
  ];
  String imagem =
      'https://cdn.pixabay.com/photo/2021/04/22/06/40/duck-6198196_960_720.jpg';

  void mudaImagem() {
    while (true) {
      int random = Random().nextInt(4);
      if (imagem == imagens[random]) {
        continue;
      } else {
        setState(() {
          imagem = imagens[random];
        });
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mudador de imagem'),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Image.network(imagem),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: (mudaImagem),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              child: const Text('Troca Imagem'),
            ),
          ],
        ),
      ),
    );
  }
}
