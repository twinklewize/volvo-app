import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Gauge imports
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:volvo_app/main.dart';
import 'package:volvo_app/user_profile/user_profile_view_model.dart';

/// Renders the gauge points tracker sample.
// ignore: use_key_in_widget_constructors, must_be_immutable
class PointsTracker extends StatefulWidget {
  @override
  _PointsTrackerState createState() => _PointsTrackerState();
}

class _PointsTrackerState extends State<PointsTracker> {
  _PointsTrackerState();

  @override
  Widget build(BuildContext context) {
    var card = Provider.of<UserProfileViewModel>(context).card;
    double min;
    card.cardLevel == CardLevels.bronze
        ? min = 0
        : card.cardLevel == CardLevels.silver
            ? min = 50000
            : card.cardLevel == CardLevels.gold
                ? min = 250000
                : min = 1250000;
    double max;
    card.cardLevel == CardLevels.bronze
        ? max = 50000
        : card.cardLevel == CardLevels.silver
            ? max = 250000
            : card.cardLevel == CardLevels.gold
                ? max = 1250000
                : max = 999999999;
    double value = card.howManyPointsOnCard;
    return _buildRangePointerExampleGauge(card, min, max, value);
  }

  /// Returns the range pointer gauge
  SfRadialGauge _buildRangePointerExampleGauge(
      LoyaltyCard card, double min, double max, double value) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
            showLabels: false,
            showTicks: false,
            startAngle: 90,
            endAngle: 90,
            minimum: min,
            maximum: max,
            radiusFactor: 0.8,
            axisLineStyle: const AxisLineStyle(
                thicknessUnit: GaugeSizeUnit.factor, thickness: 0.15),
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                angle: 180,
                widget: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      child: Text(
                        (value / 1000).toStringAsFixed(0) + ' тыс.',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            pointers: <GaugePointer>[
              RangePointer(
                value: card.howManyPointsOnCard,
                cornerStyle: CornerStyle.bothCurve,
                enableAnimation: true,
                animationDuration: 800,
                animationType: AnimationType.ease,
                sizeUnit: GaugeSizeUnit.factor,
                // gradient: SweepGradient(
                //     colors: <Color>[Color(0xFF6A6EF6), Color(0xFFDB82F5)],
                //     stops: <double>[0.25, 0.75]),
                color: VolvoColors.firstColor,
                width: 0.15,
              ),
            ]),
      ],
    );
  }
}
