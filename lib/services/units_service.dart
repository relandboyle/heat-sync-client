import 'dart:async';
import 'dart:convert';
import 'package:heat_sync/classes/unit_data.dart';
import 'package:rxdart/rxdart.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

final logger = Logger();

class UnitsService {
  // Define a controller to handle debouncing
  final _searchController = StreamController<String>.broadcast();

  // Define the debounced search stream
  Stream<String> get debouncedSearch => _searchController.stream;

  // Define a method to add a search query to the stream
  void search(String query) {
    _searchController.add(query);
  }

  // Constructor to initialize the service
  UnitsService() {
    // Set up debouncing mechanism
    _searchController.stream.debounce((_) => TimerStream(true, const Duration(milliseconds: 500))).listen(handleSearch);
  }

  // Method to handle the actual search logic
  Future<Iterable<UnitData>> handleSearch(String query) async {
    //   // Perform your search logic here, for example, make an API call or update UI
    logger.i('Searching for buildings with query: $query');
    //   // Replace this with your actual search logic
    final response = await http.post(
        // Uri.parse("http://localhost:8089/api/v1/building/searchUnits"),
        Uri.parse('https://heat-sync-534f0413abe0.herokuapp.com/api/v1/unit/searchUnits'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'fullUnit': query,
        }));

    logger.i('RESPONSE: ${response.body}');

    Iterable res = json.decode(response.body);
    logger.i('RES JSON: $res');
    List<UnitData> finalRes = List<UnitData>.from(res.map((model) => UnitData.fromJson(model)));
    logger.i('FINAL RES: $finalRes');

    return finalRes.where((UnitData option) {
      return option.fullUnit.toLowerCase().contains(query.toLowerCase());
    });
  }

  // Dispose method to release resources when the service is no longer needed
  void dispose() {
    _searchController.close();
  }
}
