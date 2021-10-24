import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:volvo_app/drawer/drawer.dart';
import 'package:volvo_app/main.dart';
import 'package:volvo_app/map/map_view_model.dart';
import 'package:volvo_app/service_apply/service_apply_view.dart';
import 'package:volvo_app/widgets/appbar_with_search.dart';
import 'package:volvo_app/widgets/white_slim_container.dart';

// ignore: use_key_in_widget_constructors
class MapView extends StatefulWidget {
  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  bool showOnlyDealers = false;

  List<Marker> _buildMarkers(List<MapMarker> mapMarkers, BuildContext context) {
    List<Marker> _markerList = [];
    for (var i = 0; i < mapMarkers.length; i++) {
      final _mapItem = mapMarkers[i];
      showOnlyDealers
          ? _mapItem.title == 'VOLVO CAR ТУЛЬСКАЯ' ||
                  _mapItem.title == 'VOLVO CAR ДУМСКАЯ'
              ? _markerList.add(
                  Marker(
                    height: _mapItem.isPartnerService ? 40 : 48,
                    width: _mapItem.isPartnerService ? 29 : 35,
                    point: _mapItem.location,
                    builder: (_) {
                      return GestureDetector(
                        onTap: () {
                          showServiceBottomSheet(
                              context: context, service: _mapItem);
                        },
                        child: _mapItem.isPartnerService
                            ? SvgPicture.asset(
                                'assets/icons/partner_map_point.svg')
                            : SvgPicture.asset(
                                'assets/icons/volvo_map_point.svg'),
                      );
                    },
                  ),
                )
              : print('')
          : _markerList.add(
              Marker(
                height: _mapItem.isPartnerService ? 40 : 48,
                width: _mapItem.isPartnerService ? 29 : 35,
                point: _mapItem.location,
                builder: (_) {
                  return GestureDetector(
                    onTap: () {
                      showServiceBottomSheet(
                          context: context, service: _mapItem);
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

  void showServiceBottomSheet({
    required BuildContext context,
    required MapMarker service,
  }) {
    Provider.of<MapViewModel>(context, listen: false).bottomSheetController =
        showBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  spreadRadius: 4,
                  blurRadius: 32,
                  offset: Offset(0, -2), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      Text(
                        service.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        service.description,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(93, 105, 115, 1),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: service.rating ?? 0,
                            ignoreGestures: true,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemSize: 20,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 3.5),
                            itemBuilder: (context, _) =>
                                SvgPicture.asset('assets/icons/star.svg'),
                            onRatingUpdate: (rating) {
                              // ignore: avoid_print
                              print(rating);
                            },
                          ),
                          const SizedBox(width: 8),
                          Text(
                            service.rating != null
                                ? service.rating.toString()
                                : '',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            service.howManyReviews != null
                                ? service.howManyReviews.toString() + ' оценка'
                                : 'Нет отзывов',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(93, 105, 115, 1),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Открыто до ' +
                                service.closeHours.toString() +
                                ':00',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(93, 105, 115, 1),
                            ),
                          ),
                          // ignore: prefer_const_constructors
                          Text(
                            '2,7 км',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(93, 105, 115, 1),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                        children: [
                          // Записаться
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      ServiceApplyView(service: service),
                                ),
                              );
                            },
                            child: SvgPicture.asset(
                                'assets/buttons/zapisatsya_dark_button.svg'),
                          ),
                          const SizedBox(width: 8),

                          // Маршрут
                          GestureDetector(
                            onTap: () {
                              print("Маршрут");
                            },
                            child: SvgPicture.asset(
                                'assets/buttons/marshrut_light_button.svg'),
                          ),
                          const SizedBox(width: 8),

                          // Избранное
                          GestureDetector(
                            onTap: () {
                              print("Избранное");
                            },
                            child: SvgPicture.asset(
                                'assets/buttons/favorites_light_small_button.svg'),
                          ),

                          const SizedBox(width: 8),

                          // ! Позвонить (НИКОГДА НЕ ВСТАВЛЯЙТЕ КНОПИ КАРТИНКАМИ)
                          GestureDetector(
                            onTap: () {
                              print("Позвонить");
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(221, 231, 255, 1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 6),
                                child: SvgPicture.asset(
                                    'assets/buttons/phone_small_light_button.svg'),
                              ),
                            ),
                          ),

                          const SizedBox(width: 8),

                          // Поделиться
                          GestureDetector(
                            onTap: () {
                              print("Поделиться");
                            },
                            child: SvgPicture.asset(
                                'assets/buttons/share_small_light_button.svg'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var mapViewModel = Provider.of<MapViewModel>(context);
    final _markers = _buildMarkers(mapViewModel.mapMarkers, context);
    return Scaffold(
      drawer: MainDrawer(),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              minZoom: 3,
              maxZoom: 18,
              zoom: 12,
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
                          setState(() {
                            showOnlyDealers = !showOnlyDealers;
                          });
                        },
                        child: WhiteSlimContainer(
                          svgIconPath: 'assets/icons/wheel.svg',
                          title: 'Дилеры',
                          isSelected: showOnlyDealers,
                        ),
                      ),
                      const SizedBox(width: 8),

                      // Тест-драйв
                      GestureDetector(
                        onTap: () {},
                        child: const WhiteSlimContainer(
                          svgIconPath: 'assets/icons/flag.svg',
                          title: 'Тест-драйв',
                          isSelected: false,
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
                          isSelected: false,
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
