import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class BuildingsService {
  // Define a controller to handle debouncing
  final _searchController = StreamController<String>.broadcast();

  // Define the debounced search stream
  Stream<String> get debouncedSearch => _searchController.stream;

  // Define a method to add a search query to the stream
  void search(String query) {
    _searchController.add(query);
  }

  // Constructor to initialize the service
  BuildingsService() {
    // Set up debouncing mechanism
    _searchController.stream.debounce((_) => TimerStream(true, const Duration(milliseconds: 500))).listen(_handleSearch);
  }

  // Method to handle the actual search logic
  void _handleSearch(String query) {
  //   // Perform your search logic here, for example, make an API call or update UI
  //   logger.i('Searching for buildings with query: $query');
  //   // Replace this with your actual search logic
  //   final response = await http.post(
  //       // Uri.parse("http://localhost:8089/api/v1/building/searchBuildings"),
  //       Uri.parse('https://heat-sync-534f0413abe0.herokuapp.com/api/v1/building/searchBuildings'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: jsonEncode(<String, String>{
  //         'fullAddress': query,
  //       }));

  //   Iterable res = json.decode(response.body);
  //   debugPrint('$res');
  //   state._kOptions = List<BuildingData>.from(res.map((model) => BuildingData.fromJson(model)));

  //   return state._kOptions.where((BuildingData option) {
  //     return option.fullAddress.toLowerCase().contains(query.toLowerCase());
  //   });
  }

  // Dispose method to release resources when the service is no longer needed
  void dispose() {
    _searchController.close();
  }
}
