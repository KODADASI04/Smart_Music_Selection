import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<BitmapDescriptor> avatars = [];
  LatLng? _location;
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 10; i++) {
      BitmapDescriptor.fromAssetImage(
              const ImageConfiguration(
                size: Size(1, 1),
              ),
              "assets/images/example_avatar${i + 1}.png")
          .then(
        (value) {
          avatars.add(value);
          if (avatars.length == 10) {
            setState(() {});
          }
        },
      );
    }
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> controller =
        Completer<GoogleMapController>();
    return avatars.length != 10 || _location == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: _location!,
              zoom: 14.4746,
            ),
            onMapCreated: (GoogleMapController gcontroller) {
              controller.complete(gcontroller);
            },
            markers: {
              for (int i = 0; i < 10; i++)
                Marker(
                  markerId: MarkerId(i.toString()),
                  icon: avatars[i],
                  infoWindow: const InfoWindow(
                    title: "Aaa",
                  ),
                  position: LatLng(
                    _location!.latitude + i / (Random().nextInt(1000) + 900),
                    _location!.longitude + i / (Random().nextInt(1000) + 900),
                  ),
                )
            },
          );
  }

  void getLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        locationData = await location.getLocation();
        locationData = await location.getLocation();
        setState(() {
          _location = LatLng(locationData.latitude!, locationData.longitude!);
        });
        return;
      } else {
        setState(() {
          _location = const LatLng(37.42796133580664, -122.085749655962);
        });
      }
    } else if (permissionGranted == PermissionStatus.deniedForever) {
      setState(() {
        _location = const LatLng(37.42796133580664, -122.085749655962);
      });
    } else {
      locationData = await location.getLocation();
      setState(() {
        _location = LatLng(locationData.latitude!, locationData.longitude!);
      });
    }
  }
}
