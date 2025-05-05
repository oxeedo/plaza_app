import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaza_ng/screens/auth/sign_up.dart';
import 'package:plaza_ng/components/bloc/MyDataModel.dart';
import 'package:plaza_ng/screens/auth/sign_in_with_password.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(''), // Title for the AppBar
            backgroundColor: Colors.white),
        body: BlocProvider(
            create: (context) => MyDataBloc()
              ..add(FetchDataEvent()), // Fetch data when BLoC is created
            child:
                BlocBuilder<MyDataBloc, MyDataState>(builder: (context, state) {
              if (state is MyDataLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is MyDataLoaded) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(
                        16.0), // Add padding around the content
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                              right: 200.0), // Adjust left padding here
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            labelStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.5),
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInWithPassword()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(double.infinity,
                                  50), // Set minimum size for full width
                            ),
                            child: const Text('Continue'),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .start, // Center the text in the button
                            children: const [
                              Text(
                                "Don't have an account? ",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                "Create One",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        ElevatedButton(
                          onPressed: () {
                            // Implement Apple Sign-In here
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor:
                                const Color.fromARGB(255, 239, 239, 239),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .start, // Align items to the start
                            children: [
                              Image.asset(
                                'assets/images/apple.png',
                                height: 24,
                                width: 24,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    left:
                                        40), // Add padding to the left of the text
                                child: Text(
                                  'Sign in with Apple',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {
                            // Implement Facebook Sign-In here
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor:
                                const Color.fromARGB(255, 239, 239, 239),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .start, // Align items to the start
                            children: [
                              Image.asset(
                                'assets/images/facebook.png',
                                height: 24,
                                width: 24,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    left:
                                        40), // Add padding to the left of the text
                                child: Text(
                                  'Sign in with Facebook',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {
                            // Implement Google Sign-In here
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor:
                                const Color.fromARGB(255, 239, 239, 239),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .start, // Align items to the start
                            children: [
                              Image.asset(
                                'assets/images/google.png',
                                height: 24,
                                width: 24,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    left:
                                        40), // Add padding to the left of the text
                                child: Text(
                                  'Sign in with Google',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
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
