import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Lab7MainBody extends StatefulWidget {
  const Lab7MainBody({Key? key}) : super(key: key);

  @override
  _Lab7MainBodyState createState() => _Lab7MainBodyState();
}

class _Lab7MainBodyState extends State<Lab7MainBody> {
  // Generate dummy data for the list view
  final List<String> _products =
  List.generate(10, (index) => "Product ${index.toString()}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lab7MainBody"),
      ),
      body: ReorderableListView.builder(
          itemCount: _products.length,
          itemBuilder: (context, index) {
            final String productName = _products[index];
            return Slidable(
              startActionPane: ActionPane(
                motion: const BehindMotion(),
                children: [
                  // A SlidableAction can have an icon and/or a label.
                  SlidableAction(
                    backgroundColor: const Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                    onPressed: (context){
                      _handleTabDelete(
                        context: context,
                        index: index
                      );
                    },
                  ),
                  SlidableAction(
                    onPressed: _handleTabShard(
                      context: context,
                    ),
                    backgroundColor: const Color(0xFF21B7CA),
                    foregroundColor: Colors.white,
                    icon: Icons.share,
                    label: 'Share',
                  ),
                ],
              ),
              key: ValueKey(productName),
              child: Card(
                key: ValueKey(productName),
                color: Colors.amberAccent,
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
              ),
            );
          },
          // The reorder function
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex = newIndex - 1;
              }
              final element = _products.removeAt(oldIndex);
              _products.insert(newIndex, element);
            });
          }),
    );
  }

  _handleTabDelete({BuildContext? context, int? index}) {
   setState(() {
     _products.removeAt(index!);
   });
  }

  _handleTabShard({BuildContext? context}) {

  }
}
