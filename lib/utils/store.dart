import 'package:shared_preferences/shared_preferences.dart';

enum StoreKeys {
  token,
  city,
}

class Store {
  final SharedPreferences _store;
  // static StoreKeys storeKeys;

  static Future<Store> getInstance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Store._init(prefs);
  }

  Store._init(this._store);

  getString(StoreKeys key) async {
    return _store.get(key.toString());
  }

  setString(StoreKeys key, String value) async {
    _store.setString(key.toString(), value);
  }

  getStringList(StoreKeys key) async {
    return _store.getStringList(key.toString());
  }

  setStringList(StoreKeys key, List<String> value) async {
    _store.setStringList(key.toString(), value);
  }
}
