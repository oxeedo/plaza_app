import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100], // Background color for the row
        borderRadius: BorderRadius.circular(30.0), // Rounded corners
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Center horizontally
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: Text("Quantity", style: TextStyle(fontSize: 16)),
          ),
          SizedBox(width: 20.0),
          ElevatedButton(
            onPressed: () {
              context.read<CounterCubit>().decrement();
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(8),
            ),
            child: const Text('-', style: TextStyle(fontSize: 16)),
          ),
          BlocBuilder<CounterCubit, int>(
            builder: (context, state) {
              return Text(
                state.toString(),
                style: const TextStyle(fontSize: 16),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(8),
            ),
            child: const Text('+', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
