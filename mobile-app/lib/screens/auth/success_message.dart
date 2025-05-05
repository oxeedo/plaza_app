import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaza_ng/screens/auth/sign_in.dart';
import 'package:plaza_ng/components/bloc/MyDataModel.dart';

class SuccessMessage extends StatelessWidget {
  const SuccessMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(''), // Title for the AppBar
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
        ),
        body: BlocProvider(
            create: (context) => MyDataBloc()
              ..add(FetchDataEvent()), // Fetch data when BLoC is created
            child:
                BlocBuilder<MyDataBloc, MyDataState>(builder: (context, state) {
              if (state is MyDataLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is MyDataLoaded) {
                return Center(
                  // Center the entire body content
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(
                          16.0), // Add padding around the content
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Center the contents vertically
                        crossAxisAlignment: CrossAxisAlignment
                            .center, // Center the contents horizontally
                        children: [
                          Image.asset(
                            'assets/images/success.png',
                            height: 100,
                            width: 100,
                          ),
                          const SizedBox(
                              height:
                                  20), // Add space between the image and text
                          const Center(
                            child: Text(
                              "We sent you an email to reset\nyour password.",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignInScreen()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                foregroundColor: Colors.white,
                                minimumSize: const Size(double.infinity,
                                    50), // Set minimum size for full width
                              ),
                              child: const Text('Return to Login'),
                            ),
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                );
              } else if (state is MyDataError) {
                return Center(child: Text('Error: ${state.message}'));
              }
              return Center(child: Text('No data available.'));
            })));
  }
}
