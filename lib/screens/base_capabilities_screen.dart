import 'package:flutter/material.dart';

class BaseCapabilitiesScreen extends StatefulWidget {
  const BaseCapabilitiesScreen({super.key});

  @override
  State<BaseCapabilitiesScreen> createState() => _BaseCapabilitiesScreenState();
}

class _BaseCapabilitiesScreenState extends State<BaseCapabilitiesScreen> {
  final TextEditingController _controller = TextEditingController();

  final List<String> _data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Base widgets capabilities')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    'Enter text and tap icon to add the item',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[400],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            if (_controller.text.isNotEmpty) {
                              setState(() {
                                _data.add(_controller.text);
                              });
                            }
                          },
                          icon: const Icon(Icons.add_circle_outline_rounded))
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            if (_data.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: _data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.face_sharp),
                      title: Text(_data[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            _data.removeAt(index);
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            if (_data.isEmpty)
              const Expanded(
                child: Center(
                  child: Text('No items in list'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
