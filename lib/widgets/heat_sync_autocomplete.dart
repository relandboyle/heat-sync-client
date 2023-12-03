import 'package:flutter/material.dart';

// void main() => runApp(const AutocompleteExampleApp());

// class AutocompleteExampleApp extends StatelessWidget {
//   const AutocompleteExampleApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Autocomplete Basic'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                   'Type below to autocomplete the following possible results: ${HeatSyncAutocomplete._kOptions}.'),
//               const HeatSyncAutocomplete(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class HeatSyncAutocomplete extends StatelessWidget {

  final List<String> options;

  const HeatSyncAutocomplete({super.key, required this.options});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 100,
            child: Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                return options.where((String option) {
                  return option.contains(textEditingValue.text.toLowerCase());
                });
              },
              onSelected: (String selection) {
                debugPrint('You just selected $selection');
              },
            ),
          ),
        ],
      ),
    );
  }
}
