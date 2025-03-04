import 'package:flutter/material.dart';

class BasicWidget extends StatefulWidget {
  const BasicWidget({super.key});

  @override
  _BasicWidgetState createState() => _BasicWidgetState();
}

class _BasicWidgetState extends State<BasicWidget> {
  bool _checkboxValue = false;
  int _radioValue = 0;
  bool _switchValue = false;
  double _sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Basic Widget',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello Flutter',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your name',
                hintText: 'Type here...',
                prefixIcon: Icon(Icons.person),
              ),
              keyboardType: TextInputType.text,
              maxLength: 20,
            ),
            const SizedBox(height: 20),

            Container(
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

            ElevatedButton(
              onPressed: () {
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

            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(color: Colors.red, height: 50),
                ),
                Expanded(
                  flex: 1,
                  child: Container(color: Colors.blue, height: 50),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: List.generate(
                6,
                (index) => Chip(
                  label: Text('Item $index'),
                  backgroundColor: Colors.blue[100],
                ),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Checkbox(
                  value: _checkboxValue,
                  onChanged: (value) {
                    setState(() {
                      _checkboxValue = value!;
                    });
                  },
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                ),
                const Text(' Agree to terms'),
              ],
            ),
            const SizedBox(height: 20),

            Column(
              children: [
                RadioListTile(
                  value: 0,
                  groupValue: _radioValue,
                  onChanged: (value) {
                    setState(() {
                      _radioValue = value!;
                    });
                  },
                  title: const Text('Option 1'),
                  activeColor: Colors.blue,
                ),
                RadioListTile(
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: (value) {
                    setState(() {
                      _radioValue = value!;
                    });
                  },
                  title: const Text('Option 2'),
                  activeColor: Colors.blue,
                ),
              ],
            ),
            const SizedBox(height: 20),

            const Divider(
              color: Colors.grey,
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox(height: 20),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('John Doe'),
              subtitle: const Text('john@example.com'),
              trailing: const Icon(Icons.arrow_forward),
              tileColor: Colors.grey[200],
              onTap: () {},
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Switch(
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                  activeColor: Colors.blue,
                  inactiveThumbColor: Colors.grey,
                ),
                const Text(' Enable feature'),
              ],
            ),
            const SizedBox(height: 20),

            Slider(
              value: _sliderValue,
              min: 0.0,
              max: 1.0,
              divisions: 10,
              label: _sliderValue.toStringAsFixed(1),
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
              activeColor: Colors.blue,
              inactiveColor: Colors.grey,
            ),
            const SizedBox(height: 20),

            // 11. Stack - Overlapping widgets
            SizedBox(
              height: 200,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    color: Colors.blue[200],
                  ),
                  Positioned(
                    top: 0,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.red[200],
                    ),
                  ),
                  const Positioned(
                    bottom: 10,
                    child: Text(
                      'Stacked!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

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

            Image.network(
              'https://i.pravatar.cc/150',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const CircularProgressIndicator();
              },
            ),
            const SizedBox(height: 20),

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
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: BasicWidget(),
      debugShowCheckedModeBanner: false,
    ),
  );
}