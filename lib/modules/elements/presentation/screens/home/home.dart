import 'package:app_challenge/core/provider/state_provider.dart';
import 'package:app_challenge/modules/elements/presentation/screens/elements/detail_elements/selected_element.dart';
import 'package:app_challenge/modules/elements/presentation/screens/elements/list_elements/list_elements.dart';
import 'package:app_challenge/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final stateProvider = Provider.of<StateProvider>(context, listen: false);
      await stateProvider.loadElements();
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    ListElements(),
    SelectedElement()
  ];

  @override
  Widget build(BuildContext context) {
    final stateProvider = context.watch<StateProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Challenge'),
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: _widgetOptions.elementAt(stateProvider.selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Lista',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_drive_file),
            label: 'Detalle',
          ),
        ],
        currentIndex: stateProvider.selectedIndex,
        selectedItemColor: primaryColor,
        onTap: stateProvider.selectedBottomNavigationBar,
      ),
    );
  }
}
