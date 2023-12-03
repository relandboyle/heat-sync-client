import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({super.key});

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  var accountKey = dotenv.env['ACCOUNT_KEY'];
  var webApi = dotenv.env['API_URL'];

  int testVar = 20;

  void testMethod() {
    print("TEST CARD");
  }

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text("Placeholder Text!"))],
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: 150,
          width: 150,
          child: Card(
            elevation: 5,
            child: Text("CARD EXAMPLE"),
          ),
        ),
        SizedBox(
          height: 150,
          width: 150,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(3.0),
              ),
            ),
            color: Color.fromARGB(255, 141, 24, 47),
            elevation: 5,
            child: Text(
              "CARD EXAMPLE",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Column(children: [
          ElevatedButton(onPressed: null, child: Text("Add Building")),
          ElevatedButton(onPressed: null, child: Text("Add Unit")),
          ElevatedButton(onPressed: null, child: Text("C / F")),
        ]),
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(onPressed: null, child: Text("Add Building")),
        ElevatedButton(onPressed: null, child: Text("Add Unit")),
        ElevatedButton(onPressed: null, child: Text("C / F")),
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        MyCard(
          title: "TEST CARD",
          description: "This is a description.",
        ),
        Column(children: [
          Row(children: [
            Text("Label"),
            Text("Value"),
          ]),
          Row(children: [
            Text("Label"),
            Text("Value"),
          ]),
          Row(children: [
            Text("Label"),
            Text("Value"),
          ]),
          Row(children: [
            Text("Label"),
            Text("Value"),
          ]),
        ])
      ]),
    ]);
  }
}

class MyCard extends StatelessWidget {
  final String title;
  final String description;

  const MyCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      elevation: 5,
      margin: const EdgeInsets.all(8),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: InkWell(
        splashColor: Colors.lightGreenAccent.withAlpha(30),
        //sizedBox of the card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 150,
              height: 50,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
