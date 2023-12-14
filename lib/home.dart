import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heat_sync/buildings.dart';
import 'package:heat_sync/temperature.dart';
import 'package:heat_sync/units.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAlignment = -1.0;
  bool mobile = false;
  final String redLogo = './assets.red-blue-icon.svg';
  late Widget redLogoSvg = SvgPicture.asset(redLogo, semanticsLabel: 'Acme Logo');

  @override
  Widget build(BuildContext context) {
    mobile = MediaQuery.of(context).size.width > 700 ? false : true;
    Widget selectedPage = const Placeholder();

    switch (_selectedIndex) {
      case 0:
        selectedPage = const TemperaturePage();
        break;
      case 1:
        selectedPage = const BuildingsPage();
        break;
      case 2:
        selectedPage = const UnitsPage();
        break;
      case 3:
        selectedPage = const Placeholder();
        break;
      default:
        throw UnimplementedError('no widget for $_selectedIndex');
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: FlexColor.blueLightPrimary,
          title: Align(alignment: const Alignment(0.95, 0.0), child: Text(widget.title)),
        ),
        body: Row(children: <Widget>[
          NavigationRail(
            elevation: 10,
            selectedIndex: _selectedIndex,
            groupAlignment: groupAlignment,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: labelType,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.thermostat_sharp),
                selectedIcon: Icon(
                  Icons.thermostat_sharp,
                  // color: Color.fromARGB(255, 136, 25, 25)
                ),
                padding: EdgeInsets.all(20.0),
                label: Text('Temperature'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.business_sharp),
                selectedIcon: Icon(
                  Icons.business_sharp,
                  // color: Color.fromARGB(255, 136, 25, 25)
                ),
                padding: EdgeInsets.all(20.0),
                label: Text('Buildings'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.chair_sharp),
                selectedIcon: Icon(
                  Icons.chair_sharp,
                  // color: Color.fromARGB(255, 136, 25, 25)
                ),
                label: Text('Units'),
                padding: EdgeInsets.all(20.0),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                selectedIcon: Icon(
                  Icons.settings,
                  // color: Color.fromARGB(255, 136, 25, 25)
                ),
                padding: EdgeInsets.all(20.0),
                label: Text('Settings'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: selectedPage,
          )
        ]));
  }
}
