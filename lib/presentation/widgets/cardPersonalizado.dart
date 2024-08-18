import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui'; // Para BackdropFilter
import '../bloc/card_bloc.dart'; // Importe o CardBloc

//Cria um card personalizado que escurece quando clica
class CardPersonalizado extends StatelessWidget {
  final int cardId;
  final String titulo;
  final String subTitulo;
  final String descricao;
  final String imageUrl;
  final Color overlayColor;

  const CardPersonalizado({
    Key? key,
    required this.cardId,
    required this.titulo,
    required this.subTitulo,
    required this.descricao,
    required this.imageUrl,
    this.overlayColor = Colors.black54,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardBloc, CardState>(
      builder: (context, state) {
        bool isBlurred = state is CardBlurred && state.cardId == cardId;

        return GestureDetector(
          onTap: () {
            BlocProvider.of<CardBloc>(context).add(ToggleCardEvent(cardId));
          },
          child: Container(
            width: 300,
            height: 200,
            child: Card(
              elevation: 5.0,
              margin: const EdgeInsets.all(8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Imagem de fundo
                  Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                  // Animação de blur
                  AnimatedOpacity(
                    opacity: isBlurred ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 300),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: isBlurred ? 10.0 : 0.0,
                        sigmaY: isBlurred ? 10.0 : 0.0,
                      ),
                      child: Container(
                        color:
                            Colors.black.withOpacity(0.2), // Ajuste a opacidade
                      ),
                    ),
                  ),
                  // Sobreposição de cor e textos
                  Container(
                    color: overlayColor.withOpacity(isBlurred ? 0.5 : 0.2),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          titulo,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          subTitulo,
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              // Descrição que aparece com o blur
                              AnimatedPositioned(
                                duration: Duration(milliseconds: 300),
                                bottom: isBlurred ? 50 : -50,
                                left: 0,
                                right: 0,
                                child: AnimatedOpacity(
                                  opacity: isBlurred ? 1.0 : 0.0,
                                  duration: Duration(milliseconds: 300),
                                  child: Text(
                                    descricao,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              // Texto "Expandir" que aparece com o blur
                              AnimatedPositioned(
                                duration: Duration(milliseconds: 300),
                                bottom: isBlurred ? 10 : -50,
                                left: 0,
                                right: 0,
                                child: AnimatedOpacity(
                                  opacity: isBlurred ? 1.0 : 0.0,
                                  duration: Duration(milliseconds: 300),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Expandir  >  ',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
