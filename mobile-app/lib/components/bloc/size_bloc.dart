import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

// Event for size selection
abstract class SizeEvent {}

class SelectSize extends SizeEvent {
  final String size; // Size as a String

  SelectSize(this.size);
}

// State for the size bloc
class SizeState {
  final String selectedSize; // Selected size as a String
  final List<String> availableSizes; // List of available sizes
  final String? error; // Optional error message

  SizeState(this.selectedSize, this.availableSizes, {this.error});
}

class SizeBloc extends Bloc<SizeEvent, SizeState> {
  SizeBloc() : super(SizeState('', [])) {
    // Fetch sizes when the bloc is initialized
    fetchSizes();

    // Event listener for SelectSize event
    on<SelectSize>((event, emit) {
      emit(SizeState(event.size,
          state.availableSizes)); // Update the state with the selected size
    });
  }

  Future<void> fetchSizes() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:3000/products'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        List<String> sizes =
            data.map((item) => item['size'] as String).toList();

        // Emit new state with the fetched sizes and select the first size
        emit(SizeState(sizes.isNotEmpty ? sizes[0] : '', sizes));
      } else {
        throw Exception('Failed to load sizes');
      }
    } catch (e) {
      emit(SizeState('', [], error: e.toString())); // Handle error
    }
  }
}
