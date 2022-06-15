import 'package:flutter/material.dart';

class MainLab6 extends StatefulWidget {
  const MainLab6({Key? key}) : super(key: key);

  @override
  _MainLab6State createState() => _MainLab6State();
}

class _MainLab6State extends State<MainLab6> {
  final List<String> _products = List.generate(10, (index) => "Product ${index.toString()}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("lab6".toLowerCase()),
      ),
      body: ReorderableListView.builder(
          itemCount: _products.length,
          itemBuilder: (context, index) {
            final String productName = _products[index];
            return Card(
              key: ValueKey(productName),
              color: index.isOdd ? Colors.yellow : Colors.pink,
              elevation: 1,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                contentPadding: const EdgeInsets.all(25),
                title: Text(
                  productName,
                  style: const TextStyle(fontSize: 18),
                ),
                trailing: const Icon(Icons.drag_handle),
                onTap: () {/* Do something else */},
              ),
            );
          },
          // The reorder function
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex--;
              }
              final element = _products.removeAt(oldIndex);
              _products.insert(newIndex, element);
            });
          }),
    );
  }
}
