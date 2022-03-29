// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationofUser {
  // ignore: unnecessary_new
  Location location = new Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  // ignore: prefer_final_fields
  bool _isListenLocation = false, _isGetLocation = false;
  String coords = "";

  locationuser(BuildContext context) {
    return StreamBuilder(
        stream: location.onLocationChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.waiting) {
            var data = snapshot.data as LocationData;
            coords = data.latitude.toString() + " " + data.longitude.toString();
            return Text(coords);
          }
          return const Text("sin coordenadas");
        });
  }
}
