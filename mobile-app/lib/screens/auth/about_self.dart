import 'package:flutter/material.dart';
import 'package:plaza_ng/screens/auth/success_message.dart';

class AboutSelf extends StatelessWidget {
  const AboutSelf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''), // Title for the AppBar
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false, // Remove the back arrow
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white, // Background color for the section
            padding: const EdgeInsets.all(16.0), // Padding for the container
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 100.0),
                  child: Text(
                    'Tell us About Yourself',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Who do you shop for?',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                const SizedBox(height: 30),

                // Row of buttons for "Men" and "Women"
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Action when "Men" is pressed
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).primaryColor, // Custom color
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                      ),
                      child: const Text('Men',
                          style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(width: 20), // Space between buttons
                    ElevatedButton(
                      onPressed: () {
                        // Action when "Women" is pressed
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            255, 229, 228, 228), // Custom color
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                      ),
                      child: const Text('Women',
                          style: TextStyle(
                              color: Color.fromARGB(255, 112, 111, 111))),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Text(
                  "How Old are you?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                // Dropdown for age selection
                DropdownButtonFormField<int>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    filled: true,
                    fillColor: Colors.grey[50],
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                  ),
                  hint: const Text('Age Range'),
                  items: List.generate(100, (index) => index + 1).map((age) {
                    return DropdownMenuItem<int>(
                      value: age,
                      child: Text(age.toString()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    // Handle the selected value
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          const SizedBox(height: 230), // Adjusted space
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SuccessMessage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Finish'),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
