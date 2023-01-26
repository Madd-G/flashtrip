import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/destination_model.dart';
import '../services/services.dart';
import '../utils/state/finite_state.dart';

class DestinationProvider extends ChangeNotifier {
  final ApiService service = ApiService();

  DestinationModel? destinationModel;

  MyState myState = MyState.initial;

  Future getAllDestination() async {
    try {
      myState = MyState.loading;
      notifyListeners();
      destinationModel = await service.getAllDestination();
      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        // if (kDebugMode) {
        //   print(e.response!.statusCode);
        //   print(e.response!.statusMessage);
        //   print(e.response!.data);
        // }
      }
      myState = MyState.failed;
      if (kDebugMode) {
        print(e.toString());
      }
      notifyListeners();
    }
  }
}
