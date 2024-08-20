import 'package:accenture/data/models/app_theme_model.dart';
import 'package:accenture/presentation/bloc/datasetate.dart';
import 'package:accenture/presentation/bloc/theme_bloc.dart';
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
  late CarouselSliderController _carouselController;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselSliderController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int _currentPage = 0;

    List<String> imagensCarousel = [
      'https://dynamicmedia.accenture.com/is/image/accenture/Group-Of-People-Eating-Burgers-With-Fries-768x432%3Arad-3x2?ts=1720594685361&fit=constrain&dpr=off',
      'https://dynamicmedia.accenture.com/is/image/accenture/Accenture-Prada-Sneaker%3Arad-3x2?ts=1721791451854&fit=constrain&dpr=off',
      'https://dynamicmedia.accenture.com/is/image/accenture/Accenture-Featured-Microsoft-Control-Tower-1920x1080%3Arad-3x2?ts=1721773144029&fit=constrain&dpr=off'
    ];
    final dataCubit = BlocProvider.of<DataCubit>(context);
    dataCubit.fetchData();

    return BlocBuilder<ThemeCubit, AppThemeModel>(
      builder: (context, theme) {
        return Scaffold(
          backgroundColor: theme.backgroundColor,
              appBar: AppBar(
                backgroundColor: theme.backgroundColor,
                leading:  IconButton(
                    icon: Icon(Icons.menu, color: theme.primaryColor,),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DrawerTelaCheia(),
                      ));
                    },
                  ),
                title: Center(
                  child: GestureDetector(
                    onTap: (){
                      context.read<ThemeCubit>().changeTheme(
                                AppThemeModel(
                                  primaryColor: Colors.black,
                                  backgroundColor: Colors.white,
                                ),
                              );
                    },
                    child: SvgPicture.asset('assets/accenture_logo.svg',
                      width: 24, height: 24),),
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.search,color: theme.primaryColor),
                    onPressed: () {
                      context.read<ThemeCubit>().changeTheme(
                                AppThemeModel(
                                  primaryColor: Colors.white,
                                  backgroundColor: Colors.black,
                                ),
                              );
                    },
                  ),
                ],
                automaticallyImplyLeading: false,
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'REINVENTE',
                          style: TextStyle(
                              color: theme.primaryColor,
                              fontSize: 55,
                              fontWeight: FontWeight.bold,
                              height: 0),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'O POTENCIAL',
                          style: TextStyle(
                            color: theme.primaryColor,
                              fontSize: 55,
                              fontWeight: FontWeight.bold,
                              height: 0.3),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'DA SUA',
                          style: TextStyle(
                            color: theme.primaryColor,
                              fontSize: 55,
                              fontWeight: FontWeight.bold,
                              height: 0),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'EMPRESA',
                          style: TextStyle(
                            color: theme.primaryColor,
                              fontSize: 55,
                              fontWeight: FontWeight.bold,
                              height: 0.3),
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
                        Text(
                          'Que venha a mudança  ',
                          style: TextStyle(
                            color: theme.primaryColor,
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
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.data.length,
                            itemBuilder: (context, index) {
                              final item = state.data[index];
                              return CardPersonalizado(
                                  cardId: item.itemId,
                                  titulo: item.title,
                                  subTitulo: item.description,
                                  descricao:
                                      "Revelamos cinco imperativos que o C-suite deve abordar para se reinventar na era da IA generativa.",
                                  imageUrl: "https://dynamicmedia.accenture.com/is/image/accenture/Accenture-Total-Enterprise-Reinvention-Glance-Skim-2024-600x848:rad-card-full?ts=1721745969212&fit=constrain&dpr=off");
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
                        Text(
                          '360',
                          style: TextStyle(
                            color: theme.primaryColor,
                              fontSize: 120, fontWeight: FontWeight.bold),
                        ),
                        SvgPicture.asset('assets/zero.svg',
                            width: 30, height: 30, color: theme.primaryColor,)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'VALUE',
                          style: TextStyle(
                            color: theme.primaryColor,
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                              height: 0.1),
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
                            child: Center(
                                child: Text(
                              'Todos os dias, abraçamos a mudança e criamos valor para todos os nossos stakeholders, em todas as partes do mundo.',
                              maxLines: 10,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: theme.primaryColor,
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
                                imageUrl: imagensCarousel[i],
                                theme: theme);
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
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            return Text(
                              '${state.pageIndex + 1}/3',
                              style: TextStyle(
                                color: theme.primaryColor,
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
      );
  
  }
}
