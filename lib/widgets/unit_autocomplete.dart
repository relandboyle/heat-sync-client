import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:heat_sync/classes/building_data.dart';
import 'package:heat_sync/classes/unit_data.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:heat_sync/services/units_service.dart';

final logger = Logger();

/// Flutter code sample for [Autocomplete] that demonstrates fetching the
/// options asynchronously and debouncing the network calls, including handling
/// network errors.

const Duration debounceDuration = Duration(milliseconds: 400);

class UnitAutocomplete extends StatefulWidget {
  final Function selectBuilding;
  const UnitAutocomplete({super.key, required this.selectBuilding});

  @override
  State<UnitAutocomplete> createState() => UnitAutocompleteState();
}

class UnitAutocompleteState extends State<UnitAutocomplete> {
  Iterable<UnitData> _kOptions = <UnitData>[];

  // The query currently being searched for. If null, there is no pending
  // request.
  String? _currentQuery;

  // The most recent options received from the API.
  late Iterable<UnitData> _lastOptions = <UnitData>[];

  late final _Debounceable<Iterable<UnitData>?, String> _debouncedSearch;

  // A network error was recieved on the most recent query.
  bool _networkError = false;

  // Calls the "remote" API to search with the given query. Returns null when
  // the call has been made obsolete.
  Future<Iterable<UnitData>?> _search(String query) async {
    _currentQuery = query;

    late final Iterable<UnitData> options;

    try {
      options = await UnitsService().handleSearch(_currentQuery!);
    } catch (error) {
      if (error is _NetworkException) {
        setState(() {
          _networkError = true;
        });
        return <UnitData>[];
      }
      rethrow;
    }

    // If another search happened after this one, throw away these options.
    if (_currentQuery != query) {
      return null;
    }
    _currentQuery = null;

    return options;
  }

  @override
  void initState() {
    super.initState();
    _debouncedSearch = _debounce<Iterable<UnitData>?, String>(_search);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Autocomplete<UnitData>(
          fieldViewBuilder: (BuildContext context, TextEditingController controller, FocusNode focusNode, VoidCallback onFieldSubmitted) {
            return TextFormField(
              decoration: InputDecoration(
                label: const Text("Select a Unit"),
                border: const OutlineInputBorder(borderSide: BorderSide()),
                errorText: _networkError ? 'Network error, please try again.' : null,
              ),
              controller: controller,
              focusNode: focusNode,
              onFieldSubmitted: (String value) {
                onFieldSubmitted();
              },
            );
          },
          optionsBuilder: (TextEditingValue textEditingValue) async {
            setState(() {
              _networkError = false;
            });
            final Iterable<UnitData>? options = await _debouncedSearch(textEditingValue.text);
            if (options == null) {
              return _lastOptions;
            }
            _lastOptions = options;
            return options;
          },
          displayStringForOption: (option) => option.fullUnit,
          onSelected: (UnitData selection) {
            widget.selectBuilding(selection);
          },
        ),
      ],
    );
  }
}


typedef _Debounceable<S, T> = Future<S?> Function(T parameter);

/// Returns a new function that is a debounced version of the given function.
///
/// This means that the original function will be called only after no calls
/// have been made for the given Duration.
_Debounceable<S, T> _debounce<S, T>(_Debounceable<S?, T> function) {
  _DebounceTimer? debounceTimer;

  return (T parameter) async {
    if (debounceTimer != null && !debounceTimer!.isCompleted) {
      debounceTimer!.cancel();
    }
    debounceTimer = _DebounceTimer();
    try {
      await debounceTimer!.future;
    } catch (error) {
      if (error is _CancelException) {
        return null;
      }
      rethrow;
    }
    return function(parameter);
  };
}

// A wrapper around Timer used for debouncing.
class _DebounceTimer {
  _DebounceTimer() {
    _timer = Timer(debounceDuration, _onComplete);
  }

  late final Timer _timer;
  final Completer<void> _completer = Completer<void>();

  void _onComplete() {
    _completer.complete();
  }

  Future<void> get future => _completer.future;

  bool get isCompleted => _completer.isCompleted;

  void cancel() {
    _timer.cancel();
    _completer.completeError(const _CancelException());
  }
}

// An exception indicating that the timer was canceled.
class _CancelException implements Exception {
  const _CancelException();
}

// An exception indicating that a network request has failed.
class _NetworkException implements Exception {
  const _NetworkException();
}
