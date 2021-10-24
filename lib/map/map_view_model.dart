import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class MapMarker {
  MapMarker({
    required this.title,
    required this.description,
    required this.address,
    required this.location,
    required this.openHours,
    required this.closeHours,
    required this.phone,
    required this.links,
    required this.isPartnerService,
    this.rating,
    this.howManyReviews,
  });

  final String title;
  final String description;
  final String address;
  final LatLng location;
  final int openHours;
  final int closeHours;
  final String phone;
  final List<String> links;
  final bool isPartnerService;
  double? rating;
  int? howManyReviews;
}

class MapViewModel with ChangeNotifier {
  // ignore: constant_identifier_names, non_constant_identifier_names
  final MAPBOX_ACCESS_TOKEN =
      'pk.eyJ1IjoicG9saXRlLWNhdC0yMDAxIiwiYSI6ImNrdW1yMWxobDFzdGMyb296anNpZWxiODUifQ.8U-tlcrAEuEnszTQor0cHw';
// ignore: constant_identifier_names, non_constant_identifier_names
  final MAPBOX_STYLE = 'mapbox.mapbox-streets-v8';

  // ignore: non_constant_identifier_names
  final URL_TEMPLATE =
      'https://api.mapbox.com/styles/v1/polite-cat-2001/ckv1s47q7323114o5id0o8l0t/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicG9saXRlLWNhdC0yMDAxIiwiYSI6ImNrdW1yMWxobDFzdGMyb296anNpZWxiODUifQ.8U-tlcrAEuEnszTQor0cHw';

// ignore: constant_identifier_names, non_constant_identifier_names, prefer_const_constructors
  final MARKER_COLOR = Colors.red;

// ignore: unused_field
  final LatLng myLocation = LatLng(-12.0162176, -77.0496812);

  TextEditingController searchController = TextEditingController();

  // ignore: prefer_typing_uninitialized_variables
  var bottomSheetController;

  final mapMarkers = [
    MapMarker(
      title: 'VOLVO CAR ДУМСКАЯ',
      address: 'Address Macdonald\'s 123',
      description: 'Официальный диллер',
      location: LatLng(-12.0630041, -77.0978237),
      openHours: 8,
      closeHours: 20,
      phone: '89997776655',
      links: [],
      isPartnerService: false,
      rating: 4.2,
      howManyReviews: 58,
    ),
    MapMarker(
      title: 'Karro',
      address: 'Address Macdonald\'s 123',
      description: 'Официальный партнер',
      location: LatLng(-12.0130041, -77.0678237),
      openHours: 8,
      closeHours: 20,
      phone: '89997776655',
      links: [],
      isPartnerService: true,
      rating: 3.5,
      howManyReviews: 0,
    ),
    MapMarker(
      title: 'VOLVO CAR ТУЛЬСКАЯ',
      address: 'Address Macdonald\'s 123',
      description: 'Официальный диллер',
      location: LatLng(-12.02030041, -77.0278237),
      openHours: 8,
      closeHours: 20,
      phone: '89997776655',
      links: [],
      isPartnerService: false,
      rating: 4.5,
      howManyReviews: 1,
    ),
    MapMarker(
      title: 'H2O Profi',
      address: 'Address Macdonald\'s 123',
      description: 'Официальный партнер',
      location: LatLng(-12.0630041, -77.0278237),
      openHours: 8,
      closeHours: 19,
      phone: '89997776655',
      links: [],
      isPartnerService: true,
      rating: 5,
      howManyReviews: 201,
    ),
    MapMarker(
      title: 'W & W',
      address: 'Corona, California, USA',
      description: 'Партнерский партнер',
      location: LatLng(-13.0180045, -77.0105112),
      openHours: 10,
      closeHours: 21,
      phone: '89917166151',
      links: [],
      isPartnerService: true,
      rating: 4,
      howManyReviews: 51,
    ),
  ];
}
