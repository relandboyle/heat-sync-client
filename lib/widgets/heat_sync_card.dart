import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class HeatSyncCard extends StatelessWidget {
  final String title;
  final String description;
  final double width;
  final double height;

  const HeatSyncCard({
    super.key,
    required this.title,
    required this.description,
    required this.width,
    required this.height
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: FlexColor.materialLightError,
      elevation: 5,
      margin: const EdgeInsets.all(8),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: width,
            height: height,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        color: Theme.of(context).colorScheme.onError,
                      ),
                    ),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onError,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
