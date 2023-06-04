import 'package:centralips/Noticias/noticia_list.dart';
import 'package:centralips/Noticias/noticia_list_empty.dart';
import 'package:centralips/Noticias/noticias_item.dart';
import 'package:centralips/Sidebar/NavBar.dart';
import 'package:centralips/footer_menu/footer_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoticiasUI extends StatefulWidget {
  NoticiasUI({Key? key});

  @override
  State<NoticiasUI> createState() => _NoticiasUIState();
}

class _NoticiasUIState extends State<NoticiasUI> {
/*
  List<NoticiaItem> title = [
    "To Kill a Mockingbird",
    "1984",
    "The Great Gatsby"
  ];

  List<NoticiaItem> txt = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor orci risus, at pharetra nibh ultrices sit amet. Maecenas eu tincidunt orci. Aliquam id dui eget urna lobortis commodo at eget quam. Integer posuere enim nisl, a faucibus erat maximus eu. Praesent et mi lectus. Suspendisse potenti. Quisque vel lorem sed nunc pharetra facilisis. Sed varius urna nec velit consequat, ac tincidunt ipsum consequat. In hac habitasse platea dictumst. Fusce ac ipsum vel justo congue convallis. Aenean eu enim velit. Donec eget ultricies nibh, in interdum turpis. Vivamus malesuada pharetra metus, non bibendum nulla tristique vel. Sed eu sapien vestibulum, imperdiet nulla ac, dapibus lorem.',
    'Vivamus vitae eros quis arcu pharetra maximus. Donec mollis nisl sed dolor suscipit, eu sollicitudin tellus aliquet. Integer venenatis libero sit amet lectus volutpat, at suscipit nisi dictum. Quisque pellentesque felis sit amet augue commodo elementum. Etiam eget augue a nibh ultrices faucibus vel in sapien. Curabitur lacinia ante quis massa dictum, eu tristique neque tristique. Duis vel bibendum arcu. Proin iaculis ex mauris, vel convallis eros congue vitae. Donec ultricies nulla sed augue consequat aliquam. Fusce eget luctus eros, sit amet pulvinar urna. Aliquam erat volutpat. Suspendisse maximus sed enim sit amet posuere. Nam euismod ipsum vel ante pulvinar, et lobortis quam dignissim.',
    'Pellentesque eget fringilla nulla, in consequat velit. Suspendisse rutrum lectus a nibh sollicitudin, id hendrerit nulla dictum. Sed pharetra a mi in bibendum. Vestibulum quis neque id odio aliquet blandit. Integer vitae nulla eget magna pretium vehicula. Pellentesque in enim eget nisi malesuada varius sit amet euismod nibh. Sed rhoncus imperdiet ipsum, vel pulvinar eros hendrerit nec. Suspendisse at dolor sagittis, finibus nisi et, faucibus dolor. Suspendisse convallis nec dolor eget commodo. Maecenas euismod neque sed lacus posuere, vel varius quam semper. Vivamus eget mauris congue, luctus ex non, maximus ante. Suspendisse vitae quam fermentum, gravida massa sed, fringilla arcu.'
  ];*/
  List<NoticiaItem> noticiaItemArr = [];
  /*List<NoticiaItem> noticiaItemArr = [
    NoticiaItem(
      titulo: "Noticia 1",
      subtitulo: "Subtitulo 1",
      imagem: 'assets/images/noticia1.png',
      texto:
          "Nos últimos anos, o campo da inteligência artificial (IA) tem experimentado avanços significativos e se tornou uma parte fundamental de várias indústrias. IA se refere ao desenvolvimento de sistemas computacionais capazes de realizar tarefas que normalmente exigem inteligência humana. Uma das áreas-chave em que a IA tem apresentado progresso notável é o processamento de linguagem natural (PLN). O PLN tem como foco capacitar os computadores a entender e processar a linguagem humana.Aplicações de PLN são amplamente utilizadas em várias áreas, como assistentes virtuais, tradução automática, análise de sentimentos em mídias sociais e chatbots. Essas aplicações dependem de algoritmos sofisticados que são treinados em grandes conjuntos de dados textuais para reconhecer padrões e aprender a tomar decisões com base nas informações fornecidas. Além disso, técnicas avançadas, como processamento de linguagem natural baseado em aprendizado de máquina e redes neurais, têm impulsionado ainda mais o campo do PLN.No entanto, apesar dos avanços, o processamento de linguagem natural ainda enfrenta desafios. A compreensão e interpretação precisas de nuances e ambiguidades da linguagem humana continuam sendo áreas de pesquisa em aberto. Além disso, a privacidade e a ética no processamento de grandes volumes de dados também são preocupações importantes.À medida que a inteligência artificial e o processamento de linguagem natural continuam a evoluir, espera-se que tenhamos sistemas ainda mais sofisticados capazes de entender e interagir com os seres humanos de forma cada vez mais natural e eficaz.",
    ),
    NoticiaItem(
      titulo: "Noticia 2",
      subtitulo: "Subtitulo 2",
      imagem: 'assets/images/noticia1.png',
      texto:
          "A tecnologia de blockchain tem sido um dos avanços mais disruptivos e promissores dos últimos anos. Originalmente desenvolvida para suportar criptomoedas como o Bitcoin, a tecnologia de blockchain é um sistema descentralizado que permite o registro seguro e imutável de transações.A principal característica do blockchain é a sua natureza distribuída, onde múltiplos participantes da rede mantêm cópias do registro de transações. Isso torna o blockchain altamente seguro e transparente, pois qualquer alteração no registro requer o consenso da maioria dos participantes.Além das criptomoedas, o blockchain tem o potencial de impactar várias indústrias. Por exemplo, na área de cadeia de suprimentos, o blockchain pode rastrear o histórico completo de um produto, desde a fabricação até a entrega ao consumidor, garantindo a autenticidade e a qualidade dos produtos.Outra aplicação promissora do blockchain é no setor financeiro, onde pode facilitar transferências de dinheiro rápidas e seguras, eliminando intermediários e reduzindo custos.No entanto, apesar de suas vantagens, o blockchain ainda enfrenta desafios, como a escalabilidade e a interoperabilidade entre diferentes redes. Além disso, questões regulatórias e de privacidade também precisam ser abordadas para a adoção em larga escala do blockchain.",
    ),
    NoticiaItem(
      titulo: "Noticia 3",
      subtitulo: "Subtitulo 3",
      imagem: 'assets/images/noticia1.png',
      texto: "Texto da noticia 3",
    ),
  ];*/

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final user = FirebaseAuth.instance.currentUser;
    DatabaseReference databaseRef =
        FirebaseDatabase.instance.ref().child('noticias');
    databaseRef.onValue.listen((event) {
      DataSnapshot snapshot = event.snapshot;
      var noticiasData = snapshot.value;

      if (noticiasData != null) {
        List<NoticiaItem> updatedNoticiaItems = [];

        if (noticiasData is List) {
          noticiasData.forEach((noticiaData) {
            if (noticiaData is Map) {
              NoticiaItem noticiaItem = NoticiaItem(
                titulo: noticiaData['titulo'] ?? 'Titulo da noticia',
                subtitulo: noticiaData['subtitulo'] ?? 'Subtitulo da noticia',
                imagem: noticiaData['imagem'] ?? 'assets/images/noticia3.png',
                texto: noticiaData['texto'] ?? 'O texto da noticia',
                author: noticiaData['autor'] ?? 'Autor desconhecido',
                date: noticiaData['date'] ?? '01/01/2021',
                type: noticiaData['type'] ?? true,
              );
              updatedNoticiaItems.add(noticiaItem);
            }
          });
        }

        setState(() {
          noticiaItemArr = updatedNoticiaItems;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    /* if (noticiaItemArr.isEmpty) {
      return NoticiasListEmpty(); 
    }*/
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/chairsips.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            margin: const EdgeInsets.only(top: 100),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Noticias",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 0, 0),
                                elevation: 0,
                                minimumSize: const Size(45, 35),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Filtros",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const SizedBox(
                    width: 355,
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: Color.fromARGB(255, 183, 183, 183),
                    ),
                  ),
                  Expanded(
                    child: Column(children: [
                      NoticiasList(noticiaItemArr: noticiaItemArr),
                    ]),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              left: 0, bottom: 0, right: 0, child: BottomNavigationExample()),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Builder(builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                );
              }),
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      drawer: const NavBar(),
      backgroundColor: Colors.transparent,
    );
  }
}
