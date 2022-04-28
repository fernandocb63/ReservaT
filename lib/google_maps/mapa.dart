import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:reserva_t/google_maps/mapa_provider.dart';

class Mapa extends StatefulWidget {
  Mapa({Key key}) : super(key: key);

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MapaProvider>(builder: ((context, provider, child) => 
    GoogleMap(
      onMapCreated: provider.onMapCreated,
      initialCameraPosition: 
        CameraPosition(target: 
          LatLng(provider.currentPosition.latitude, provider.currentPosition.longitude)))));
  }
}
