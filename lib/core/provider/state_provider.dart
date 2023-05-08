import 'package:app_challenge/modules/elements/data/datasources/content_remote_datasources.dart';
import 'package:app_challenge/modules/elements/data/repositories/elements_repository_impl.dart';
import 'package:app_challenge/modules/elements/domain/dtos/elements_dto.dart';
import 'package:app_challenge/modules/elements/domain/dtos/results_dto.dart';
import 'package:app_challenge/modules/elements/domain/repositories/elements_repository.dart';
import 'package:flutter/material.dart';

class StateProvider extends ChangeNotifier {
  final ElementsRepository elementsRepository = ElementsRepositoryImpl(
      contentRemoteDataSource: ContentRemoteDataSourceImpl());

  //flujo listado de elementos
  bool _loadingElements = true;

  bool get loadingElements => _loadingElements;

  ElementsDto _listElementsDto = ElementsDto();

  ElementsDto get listElementsDto => _listElementsDto;

  Future<void> loadElements() async {
    _loadingElements = true;
    _listElementsDto = ElementsDto();
    notifyListeners();
    final response = await elementsRepository.loadElements();
    response.fold((l) {
      _loadingElements = false;
    }, (r) async {
      _loadingElements = false;
      _listElementsDto = r;
    });
    notifyListeners();
  }

  // seleccion de bottom
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void selectedBottomNavigationBar(int index) {
    if (index == 1) loadSelectedElement();
    _selectedIndex = index;
    notifyListeners();
  }

  // flujo de elemento seleccionado
  bool _loadingSelectedElement = true; // true = se ve el loading

  bool get loadingSelectedElement => _loadingSelectedElement;

  ResultsDto _elementSelected = ResultsDto();

  ResultsDto get elementSelected => _elementSelected;

  Future<void> loadSelectedElement() async {
    if (_idSelectedElement == 0) {
      _loadingSelectedElement = false;
      notifyListeners();
      return;
    }
    _loadingSelectedElement = true;
    _elementSelected = ResultsDto();
    notifyListeners();
    final response =
        await elementsRepository.loadElementSelected(_idSelectedElement);
    response.fold((l) {
      _loadingSelectedElement = false;
    }, (r) async {
      _loadingSelectedElement = false;
      _elementSelected = r;
    });
    notifyListeners();
  }

  int _idSelectedElement = 0;

  int get idSelectedElement => _idSelectedElement;

  set idSelectedElement(int idElement) {
    if (_idSelectedElement == idElement) {
      _idSelectedElement = 0;
    } else {
      _idSelectedElement = idElement;
    }
    notifyListeners();
  }
}
