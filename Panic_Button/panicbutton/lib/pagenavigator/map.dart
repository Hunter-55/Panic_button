// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable, avoid_unnecessary_containers, prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Maps extends StatefulWidget {
  String latitude = "", logitude = "";
  Maps(this.latitude, this.logitude, {Key? key}) : super(key: key);

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 5),
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(
              double.parse(widget.latitude), double.parse(widget.logitude)),
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
            attributionBuilder: (_) {
              return const Text("© OpenStreetMap contributors");
            },
          ),

          //
          new PolylineLayerOptions(
            polylines: [
              Polyline(
                points: <LatLng>[
                  LatLng(double.parse(widget.latitude),
                      double.parse(widget.logitude)),
                  LatLng(25.428992366437562, -100.92566894978316),
                ],
                color: Colors.deepPurple,
                strokeWidth: 4.0,
              ),
            ],
          ),
          //
          CircleLayerOptions(circles: [
            CircleMarker(
                point: LatLng(double.parse(widget.latitude),
                    double.parse(widget.logitude)),
                color: Colors.blue.withOpacity(0.5),
                borderStrokeWidth: 2,
                useRadiusInMeter: true,
                radius: 10 // 2000 meters | 2 km
                ),
          ]),
          //
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 40.0,
                height: 40.0,
                point: LatLng(double.parse(widget.latitude),
                    double.parse(widget.logitude)),
                builder: (ctx) => Container(
                  child: Icon(Icons.face),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
