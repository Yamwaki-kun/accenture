import 'package:accenture/presentation/bloc/datasetate.dart';
import 'package:accenture/presentation/pages/telaoverlay.dart';
import 'package:accenture/presentation/widgets/cardPersonalizado.dart';
import 'package:accenture/presentation/widgets/carouselPersonalizado.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../bloc/data_bloc.dart';
import '../../domain/entities/data_entity.dart';

//Cria a tela principal da aplicação
class PaginaPrincipal extends StatefulWidget {
  @override
  _PaginaPrincipal createState() => _PaginaPrincipal();
}

class _PaginaPrincipal extends State<PaginaPrincipal> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CarouselSliderController _carouselController =
        CarouselSliderController();
    int _currentPage = 0;

    List<String> imagensCarousel = [
      'https://dynamicmedia.accenture.com/is/image/accenture/Group-Of-People-Eating-Burgers-With-Fries-768x432%3Arad-3x2?ts=1720594685361&fit=constrain&dpr=off',
      'https://dynamicmedia.accenture.com/is/image/accenture/Accenture-Prada-Sneaker%3Arad-3x2?ts=1721791451854&fit=constrain&dpr=off',
      'https://dynamicmedia.accenture.com/is/image/accenture/Accenture-Featured-Microsoft-Control-Tower-1920x1080%3Arad-3x2?ts=1721773144029&fit=constrain&dpr=off'
    ];
    final dataCubit = BlocProvider.of<DataCubit>(context);
    dataCubit.fetchData();

    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DrawerTelaCheia(),
              ));
            },
          );
        }),
        title: Center(
          child: SvgPicture.asset('assets/accenture_logo.svg',
              width: 24, height: 24),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Ação ao clicar na lupa
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'REINVENTE',
                  style: TextStyle(
                      fontSize: 55, fontWeight: FontWeight.bold, height: 0),
                )
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'O POTENCIAL',
                  style: TextStyle(
                      fontSize: 55, fontWeight: FontWeight.bold, height: 0.3),
                )
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'DA SUA',
                  style: TextStyle(
                      fontSize: 55, fontWeight: FontWeight.bold, height: 0),
                )
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'EMPRESA',
                  style: TextStyle(
                      fontSize: 55, fontWeight: FontWeight.bold, height: 0.3),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Que venha a mudança  ',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: 20.0,
                  height: 20.0,
                  color: const Color(0xFFA100FF),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: SvgPicture.asset('assets/accenture_logo.svg',
                        width: 20, height: 20, color: Colors.white),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(right: 10))
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
            ),
            SizedBox(
              height: 400,
              child: BlocBuilder<DataCubit, DataState>(
                builder: (context, state) {
                  if (state.data.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      final item = state.data[index];
                      return CardPersonalizado(
                          cardId: item.itemId,
                          titulo: item.title,
                          subTitulo: "Reinvenção na Era da IA Generativa",
                          descricao:
                              "Revelamos cinco imperativos que o C-suite deve abordar para se reinventar na era da IA generativa.",
                          imageUrl: item.imageURL);
                    },
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '360',
                  style: TextStyle(fontSize: 120, fontWeight: FontWeight.bold),
                ),
                SvgPicture.asset('assets/zero.svg', width: 30, height: 30)
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'VALUE',
                  style: TextStyle(
                      fontSize: 80, fontWeight: FontWeight.bold, height: 0.1),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width - 30,
                    child: const Center(
                        child: Text(
                      'Todos os dias, abraçamos a mudança e criamos valor para todos os nossos stakeholders, em todas as partes do mundo.',
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'TimesNewRoman'),
                    )))
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
            ),
            CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                height: 400.0,
                onPageChanged: (index, reason) {
                  dataCubit.setPageIndex(index);
                },
              ),
              items: [0, 1, 2].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return CarouselPersonalizado(
                        titulo: "Prada personaliza um clássico cult",
                        subTitulo:
                            "A Prada alavancou a inovadora tecnologia de gêmeos digitais ao oferecer novas experiências na personalização de produtos de luxo.",
                        imageUrl: imagensCarousel[i]);
                  },
                );
              }).toList(),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                ),
                Container(
                    width: 40,
                    height: 40,
                    color: const Color.fromARGB(255, 65, 65, 65),
                    child: const Center(
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 35,
                      ),
                    )),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    _carouselController.previousPage();
                  },
                  child: Container(
                      width: 40,
                      height: 40,
                      color: const Color.fromARGB(255, 65, 65, 65),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 35,
                        ),
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                ),
                BlocBuilder<DataCubit, DataState>(
                  builder: (context, state) {
                    if (state.data.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Text(
                      '${state.pageIndex + 1}/3',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                ),
                GestureDetector(
                  onTap: () {
                    _carouselController.nextPage();
                  },
                  child: Container(
                      width: 40,
                      height: 40,
                      color: const Color.fromARGB(255, 65, 65, 65),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 35,
                        ),
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 30),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
            ),
          ],
        ),
      ),
    );
  }
}
