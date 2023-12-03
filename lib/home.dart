import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ft_test_app/temperature.dart';
import 'package:ft_test_app/buildings.dart';
import 'package:ft_test_app/units.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  // Widget _selectedPage = const Placeholder();

  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAlignment = -1.0;
  bool mobile = false;
  final String redLogo = './assets.red-blue-icon.svg';
  late Widget redLogoSvg =
      SvgPicture.asset(redLogo, semanticsLabel: 'Acme Logo');

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
      default:
        throw UnimplementedError('no widget for $_selectedIndex');
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Center(child: Text(widget.title)),
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
                selectedIcon: Icon(Icons.thermostat_sharp),
                label: Text('Temperature'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.business_sharp),
                selectedIcon: Icon(Icons.business_sharp),
                label: Text('Buildings'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.chair_sharp),
                selectedIcon: Icon(Icons.chair_sharp),
                label: Text('Units'),
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
