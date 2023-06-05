// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool get loding => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void login(String emil, String password) async {
    setLoading(true);
    try {
      Response response = await post(Uri.parse('https://reqres.in/api/login'),
          body: {'emil': emil, 'password': password});
      if (response.statusCode == 200) {
        print('successfull');
        setLoading(false);
      } else {
        setLoading(false);
        print('failded');
      }
    } catch (e) {
      setLoading(false);
      print(e.toString());
    }
  }
}
