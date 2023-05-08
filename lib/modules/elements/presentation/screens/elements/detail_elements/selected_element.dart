import 'package:app_challenge/core/provider/state_provider.dart';
import 'package:app_challenge/modules/elements/presentation/screens/elements/detail_elements/widgets/text.dart';
import 'package:app_challenge/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedElement extends StatelessWidget {
  const SelectedElement({super.key});

  @override
  Widget build(BuildContext context) {
    final stateProvider = context.watch<StateProvider>();
    var size = MediaQuery.of(context).size / 10;

    return Scaffold(
        backgroundColor: backgroundWhite,
        body: stateProvider.loadingSelectedElement
            ? const Center(
                child: CircularProgressIndicator(color: primaryColor))
            : stateProvider.idSelectedElement != 0
                ? Container(
                    width: size.width * 10,
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextCustom(
                            title: 'Id: ${stateProvider.elementSelected.id}'),
                        TextCustom(
                            title:
                                'Nombre: ${stateProvider.elementSelected.name}'),
                        TextCustom(
                            title:
                                'Estado: ${stateProvider.elementSelected.status}'),
                        TextCustom(
                            title:
                                'Especie: ${stateProvider.elementSelected.species}'),
                        TextCustom(
                            title:
                                'Tipo: ${stateProvider.elementSelected.type}'),
                        TextCustom(
                            title:
                                'Genero: ${stateProvider.elementSelected.gender}'),
                        TextCustom(
                            title:
                                'Locación: ${stateProvider.elementSelected.location?.name ?? ''}'),
                        const SizedBox(height: 20),
                        Center(
                          child: Image.network(
                            stateProvider.elementSelected.image ?? '',
                            errorBuilder: (context, error, stackTrace) {
                              return SizedBox(
                                width: 300,
                                height: 200,
                                child: Image.asset(
                                  'assets/rectangle-no-image.png',
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
                : SizedBox(
                    width: size.width * 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'No se ha seleccionado ningún personaje sdsdds',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Icon(
                          Icons.warning_amber,
                          size: 40,
                        )
                      ],
                    )));
  }
}
