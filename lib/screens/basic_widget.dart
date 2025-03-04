import 'package:flutter/material.dart';

class BasicWidget extends StatelessWidget {
  const BasicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Removes shadow
        title: const Text(
          'Basic Widget',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Centers the title
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Text Widget with properties
            const Text(
              'Hello Flutter',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),

            // 2. Container Widget with properties
            Container(
              width: double.infinity,
              height: 100,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue, width: 2),
              ),
              child: const Center(
                child: Text('Container Example'),
              ),
            ),

            // 3. ElevatedButton with properties
            ElevatedButton(
              onPressed: () {
                // Action when pressed
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Button Pressed')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Click Me',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),

            // 4. Row with Icon and Text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                ),
                SizedBox(width: 10),
                Text(
                  'Love Flutter',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 5. Image with properties
            Image.network(
              'https://i.pravatar.cc//150',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const CircularProgressIndicator();
              },
            ),
            const SizedBox(height: 20),

            // 6. Card with properties
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text('This is a Card'),
              ),
            ),
          ],
        ),
      ),
      // 7. FloatingActionButton with properties
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}

// To use this widget, you would need a MaterialApp:
void main() {
  runApp(
    const MaterialApp(
      home: BasicWidget(),
      debugShowCheckedModeBanner: false,
    ),
  );
}