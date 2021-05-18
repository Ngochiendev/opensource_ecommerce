import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:van_transport/src/services/distance.dart';

class PickAddressController extends GetxController {
  final DistanceService distanceService = DistanceService();
  String placeTo, placeFrom;
  LatLng locationTo, locationFrom;
  String distance;

  initData() {
    placeTo = '';
    placeFrom = '';
    update();
  }

  pickAddress(PickResult input) {
    locationTo = LatLng(
      input.geometry.location.lat,
      input.geometry.location.lng,
    );
    placeTo = input.formattedAddress;
    update();
  }

  pickFromAddress(lat, lng, fullAddress) {
    locationFrom = LatLng(
      lat,
      lng,
    );
    placeFrom = fullAddress;
    update();
  }

  calDistance() async {
    var res = await distanceService.calculateDistance(
      locationFrom.latitude,
      locationFrom.longitude,
      locationTo.latitude,
      locationTo.longitude,
    );
    distance = res['rows'][0]['elements'][0]['distance']['text'];
    update();
  }
}
