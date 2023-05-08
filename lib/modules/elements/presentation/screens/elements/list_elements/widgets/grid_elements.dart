import 'package:app_challenge/core/provider/state_provider.dart';
import 'package:app_challenge/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridElements extends StatelessWidget {
  const GridElements({super.key});

  @override
  Widget build(BuildContext context) {
    final stateProvider = context.watch<StateProvider>();

    return stateProvider.loadingElements
        ? const Center(child: CircularProgressIndicator(color: primaryColor))
        : Expanded(
            child: GridView.count(
                crossAxisCount: 2,
                children: (stateProvider.listElementsDto.results ?? [])
                    .map((e) => GestureDetector(
                        onTap: () {
                          stateProvider.idSelectedElement = e.id ?? 0;
                        },
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              decoration:
                                  stateProvider.idSelectedElement == e.id
                                      ? BoxDecoration(
                                          border: Border.all(
                                              width: 10, color: secondaryColor),
                                        )
                                      : null,
                              child: Stack(
                                children: [
                                  Image.network(
                                    e.image ?? '',
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
                                  Center(
                                    child:
                                        stateProvider.idSelectedElement == e.id
                                            ? const Icon(
                                                Icons.check_circle_outline,
                                                size: 80,
                                                color: secondaryColor,
                                              )
                                            : Container(),
                                  )
                                ],
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: Text(
                                  "${e.name}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        )))
                    .toList()),
          );
  }
}
