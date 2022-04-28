
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaProvider with ChangeNotifier {
  // 0)
  Set<Marker> mapMarkers = Set();
  GoogleMapController mapController;
  Position currentPosition = Position(
    longitude: 20.608148,
    latitude: -103.417576,
    altitude: 0.0,
    speed: 0.0,
    accuracy: 0.0,
    speedAccuracy: 0.0,
    timestamp: DateTime.now(),
    heading: 0.0,
  );

  // 2)
  Future<void> onMapCreated(controller) async {
    mapController = controller;
    await getCurrentPosition();
    notifyListeners();
  }

  // 4)
  void setMarker(LatLng coord) async {
    // get address
    String _markerAddress = await _getGeocodingAddress(
      Position(
        latitude: coord.latitude,
        longitude: coord.longitude,
        altitude: 0.0,
        speed: 0.0,
        accuracy: 0.0,
        speedAccuracy: 0.0,
        timestamp: DateTime.now(),
        heading: 0.0,
      ),
    );
    // add my  marker

    mapMarkers.add(
      Marker(
        markerId: MarkerId(coord.toString()),
        position: coord,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
        infoWindow: InfoWindow(
          title: coord.toString(),
          snippet: _markerAddress,
        ),
      ),
    );
    notifyListeners();
  }

  // 3)
  Future<void> getCurrentPosition() async {
    // verify permissions
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    // get current position
    currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // get address
    String _currentAddress = await _getGeocodingAddress(currentPosition);

    // add marker
    mapMarkers.add(
      Marker(
        markerId: MarkerId(currentPosition.toString()),
        position: LatLng(currentPosition.latitude, currentPosition.longitude),
        infoWindow: InfoWindow(
          title: currentPosition.toString(),
          snippet: _currentAddress,
        ),
      ),
    );

    // move camera
    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            currentPosition.latitude,
            currentPosition.longitude,
          ),
          zoom: 15.0,
        ),
      ),
    );
  }

  // 5)
  Future<String> _getGeocodingAddress(Position position) async {
    // geocoding
    var places = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    if (places != null && places.isNotEmpty) {
      final Placemark place = places.first;
      return "${place.thoroughfare}, ${place.locality}";
    }
    return "No address available";
  }
}