import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:volvo_app/main.dart';
import 'package:volvo_app/map/map_view_model.dart';
import 'package:volvo_app/widgets/appbar_with_search.dart';
import 'package:volvo_app/widgets/white_slim_container.dart';

class MapView extends StatelessWidget {
  const MapView({Key? key}) : super(key: key);

  List<Marker> _buildMarkers(List<MapMarker> mapMarkers) {
    List<Marker> _markerList = [];
    for (var i = 0; i < mapMarkers.length; i++) {
      final _mapItem = mapMarkers[i];
      _markerList.add(
        Marker(
          height: _mapItem.isPartnerService ? 40 : 48,
          width: _mapItem.isPartnerService ? 29 : 35,
          point: _mapItem.location,
          builder: (_) {
            return GestureDetector(
              onTap: () {
                print('selected ${_mapItem.title}');
              },
              child: _mapItem.isPartnerService
                  ? SvgPicture.asset('assets/icons/partner_map_point.svg')
                  : SvgPicture.asset('assets/icons/volvo_map_point.svg'),
            );
          },
        ),
      );
    }
    return _markerList;
  }

  @override
  Widget build(BuildContext context) {
    var mapViewModel = Provider.of<MapViewModel>(context);
    final _markers = _buildMarkers(mapViewModel.mapMarkers);
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              minZoom: 3,
              maxZoom: 18,
              zoom: 13,
              center: mapViewModel.myLocation,
            ),
            nonRotatedLayers: [
              TileLayerOptions(
                urlTemplate: mapViewModel.URL_TEMPLATE,
                additionalOptions: {
                  'accessToken': mapViewModel.MAPBOX_ACCESS_TOKEN,
                  'id': mapViewModel.MAPBOX_STYLE,
                },
              ),
              MarkerLayerOptions(
                markers: _markers,
              ),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    point: mapViewModel.myLocation,
                    builder: (_) {
                      return _MyLocationMarker();
                    },
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 13,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    children: [
                      // Дилеры
                      GestureDetector(
                        onTap: () {
                          print("Дилеры");
                        },
                        child: const WhiteSlimContainer(
                          svgIconPath: 'assets/icons/wheel.svg',
                          title: 'Дилеры',
                        ),
                      ),
                      const SizedBox(width: 8),

                      // Тест-драйв
                      GestureDetector(
                        onTap: () {
                          print("Тест-драйв");
                        },
                        child: const WhiteSlimContainer(
                          svgIconPath: 'assets/icons/flag.svg',
                          title: 'Тест-драйв',
                        ),
                      ),
                      const SizedBox(width: 8),

                      // Отели
                      GestureDetector(
                        onTap: () {
                          print("Отели");
                        },
                        child: const WhiteSlimContainer(
                          svgIconPath: 'assets/icons/bed.svg',
                          title: 'Отели',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 60,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: AppbarWithSearch(
                controller: mapViewModel.searchController,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _MyLocationMarker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: const BoxDecoration(
        color: VolvoColors.firstColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
