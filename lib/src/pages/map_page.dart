import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:qr_scanner_app/src/models/scan_model.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  int _index = 1;
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final ScanModel scanModel = ModalRoute.of(context).settings.arguments;

    final CameraPosition _position = CameraPosition(
      target: scanModel.getLatLng(),
      zoom: 14.0,
    );

    final Set<Marker> markers = new Set<Marker>();
    markers.add(
        Marker(markerId: MarkerId('geo'), position: scanModel.getLatLng()));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Mapa'),
        actions: [
          IconButton(
              icon: Icon(Icons.my_location),
              onPressed: () async {
                final GoogleMapController controller = await _controller.future;
                controller
                    .animateCamera(CameraUpdate.newCameraPosition(_position));
              })
        ],
      ),
      body: _googleMap(_position, markers),
      floatingActionButton: _floatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.layers),
      onPressed: () {
        setState(() {
          if (_index >= MapType.values.length - 1)
            _index = 1;
          else
            _index++;
        });
      },
    );
  }

  GoogleMap _googleMap(CameraPosition _position, Set<Marker> markers) {
    return GoogleMap(
      mapType: MapType.values[_index],
      initialCameraPosition: _position,
      markers: markers,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
