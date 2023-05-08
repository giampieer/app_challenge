import 'package:app_challenge/modules/elements/presentation/screens/elements/list_elements/widgets/grid_elements.dart';
import 'package:app_challenge/utils/colors.dart';
import 'package:flutter/material.dart';

class ListElements extends StatelessWidget {
  const ListElements({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size / 10;

    return Scaffold(
        backgroundColor: backgroundWhite,
        body: SizedBox(
            width: size.width * 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [GridElements()],
            )));
  }
}
