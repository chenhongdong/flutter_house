import 'package:flutter_rent_house/models/general_type.dart';
import 'package:flutter_rent_house/pages/home/tab_search/filter_bar/data.dart';
import 'package:scoped_model/scoped_model.dart';

class FilterBarModel extends Model {
  List<GeneralType> _roomTypeList = roomTypeList;
  List<GeneralType> _orientedList = orientedList;
  List<GeneralType> _floorList = floorList;

  Set<String> _selectedList = Set();

  Map<String, List<GeneralType>> get dataList {
    var result = Map<String, List<GeneralType>>();
    result['roomTypeList'] = _roomTypeList;
    result['orientedList'] = _orientedList;
    result['floorList'] = _floorList;
    return result;
  }

  set dataList(Map<String, List<GeneralType>> data) {
    _roomTypeList = data['roomTypeList']!;
    orientedList = data['orientedList']!;
    _floorList = data['floorList']!;

    notifyListeners();
  }

  Set<String> get selectedList {
    return _selectedList;
  }

  selectedListToggleItem(String id) {
    if (_selectedList.contains(id)) {
      _selectedList.remove(id);
    } else {
      _selectedList.add(id);
    }
    notifyListeners();
  }
}
