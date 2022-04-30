import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:reserva_t/google_maps/mapa_provider.dart';

class Mapa extends StatefulWidget {
  final String lat;
  final String long;
  final String nombre;

  Mapa({Key key, this.lat, this.long, this.nombre}) : super(key: key);

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  GoogleMapController mapController;


  @override
  Widget build(BuildContext context) {
    final double lat2 = double.parse(widget.lat);
    final double long2 = double.parse(widget.long);
    final LatLng _center = LatLng(lat2, long2);

    List<Marker> _markers = [];

    _markers.add(
      Marker(
      markerId: MarkerId('R'),
      position: _center,
      infoWindow: InfoWindow(
      title: widget.nombre
      )
      )
    );
      return Scaffold(
        appBar: AppBar(
          title: Text('Mapa'),
        ),
        body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: Set<Marker>.of(_markers),
          initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 70.0,)),
      );
  
  }
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  
}
