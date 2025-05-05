import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDataModel {
  final String id;
  final String size;
  final String color;

  MyDataModel({required this.id, required this.size, required this.color});

  factory MyDataModel.fromJson(Map<String, dynamic> json) {
    return MyDataModel(
      id: json['id'],
      size: json['size'],
      color: json['color'],
    );
  }
}

// Define events that your BLoC will respond to.
abstract class MyDataEvent {}

class FetchDataEvent extends MyDataEvent {}

class SelectSizeEvent extends MyDataEvent {
  final String size;

  SelectSizeEvent(this.size);
}

class SelectColorEvent extends MyDataEvent {
  final String color;

  SelectColorEvent(this.color);
}

abstract class MyDataState {}

class MyDataInitial extends MyDataState {}

class MyDataLoading extends MyDataState {}

class MyDataLoaded extends MyDataState {
  final List<MyDataModel> data;
  final String selectedSize; // Added selectedSize
  final String selectedColor; // Added selectedColor

  MyDataLoaded(this.data, this.selectedSize, this.selectedColor);
}

class MyDataError extends MyDataState {
  final String message;

  MyDataError(this.message);
}

class MyDataBloc extends Bloc<MyDataEvent, MyDataState> {
  String selectedSize = "N/A"; // Variable to hold the selected size
  String selectedColor = "N/A"; // Variable to hold the selected color
  static const String baseUrl = 'http://192.168.43.201:3000/variants';

  MyDataBloc() : super(MyDataInitial()) {
    on<FetchDataEvent>((event, emit) async {
      emit(MyDataLoading());
      try {
        final response = await http.get(Uri.parse(baseUrl));
        if (response.statusCode == 200) {
          List jsonResponse = json.decode(response.body);
          List<MyDataModel> data =
              jsonResponse.map((item) => MyDataModel.fromJson(item)).toList();
          emit(MyDataLoaded(data, selectedSize,
              selectedColor)); // Pass selectedSize and selectedColor
        } else {
          emit(MyDataError('Failed to load data: ${response.statusCode}'));
        }
      } catch (e) {
        emit(MyDataError('Error: ${e.toString()}'));
      }
    });

// Handle SelectSizeEvent
    on<SelectSizeEvent>((event, emit) {
      selectedSize = event.size; // Update the selected size

      if (state is MyDataLoaded) {
        final dataState = state as MyDataLoaded;
        emit(MyDataLoaded(dataState.data, selectedSize,
            dataState.selectedColor)); // Include selectedColor
      }
    });

// Handle SelectColorEvent
    on<SelectColorEvent>((event, emit) {
      selectedColor = event.color; // Update the selected color

      if (state is MyDataLoaded) {
        final dataState = state as MyDataLoaded;
        emit(MyDataLoaded(dataState.data, dataState.selectedSize,
            selectedColor)); // Include selectedSize
      }
    });
  }
}
