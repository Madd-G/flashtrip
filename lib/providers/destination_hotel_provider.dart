import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/destination_hotel_model.dart';
import '../services/services.dart';
import '../utils/state/finite_state.dart';

class DestinationHotelProvider extends ChangeNotifier {
  final ApiService service = ApiService();

  DestinationHotelModel? destinationHotelModel;

  MyState myState = MyState.initial;

  Future getDestinationHotel() async {
    try {
      myState = MyState.loading;
      notifyListeners();
      destinationHotelModel = await service.getDestinationHotel();
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
