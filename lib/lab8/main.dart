
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:vertical_tab_bar_view/vertical_tab_bar_view.dart';

import 'lab7_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        accentColor: Colors.redAccent,
      ),
      home: Banner(
        message: 'Example',
        location: BannerLocation.topEnd,
        child: MyHomePage(title: 'Vertical Tab Bar Example'),
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final Lab7Api api = Lab7Api();
  List<Category> categories = [];

  TabController? _tabController;

  fetchAllCategories() {
    // _tabController?.dispose();
    api.getCategories().then((value) {
      setState(() {
        categories.addAll(value);
        _tabController = TabController(length: value.length, vsync: this);
      });
    });
  }

  @override
  void initState() {
    fetchAllCategories();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: _tabController == null
            ? null
            : TabBar(
          controller: _tabController,
          labelColor: Colors.redAccent,
          unselectedLabelColor: Colors.black,
          isScrollable: true,
          tabs: [
            for (Category category in categories) Tab(text: category.name)
          ],
        ),
      ),
      body: _tabController == null
          ? const Center(child: CircularProgressIndicator())
          : VerticalTabBarView(
        controller: _tabController,
        children: [
          for (Category category in categories)
            TabView(category: category)
        ],
      ),
    );
  }
}

class TabView extends StatefulWidget {
  const TabView({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  final Lab7Api api = Lab7Api();
  final List<Product> _products = [];

  fetchProducts(String category) {
    api.getProductsByCategory(category).then((value) {
      setState(() {
        _products.addAll(value);
      });
    });
  }
  dynamic allValue;
  dynamic qty =0;
  dynamic totalPrice = 0;

  @override
  void initState() {
    fetchProducts(widget.category.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return GridView.builder(
       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
           maxCrossAxisExtent: 200,
           childAspectRatio: 3 / 2,
           crossAxisSpacing: 10,
           mainAxisSpacing: 10),
       itemCount: _products.length,
       itemBuilder: (BuildContext ctx, index) {
         var purductValue = _products[index];
         return Padding(
           padding: EdgeInsets.all(5),
           child: Column(
               children: [
                 Container(
                   width: 70,
                   height: 70,
                   child: Image.network(purductValue.photo, fit: BoxFit.contain),
                 ),
                 Text("${purductValue.price}", style: TextStyle(color: Colors.red)),
                 Container(
                   width: 100,
                   height: 20,
                   decoration: BoxDecoration(
                     color: Colors.green,
                     borderRadius: BorderRadius.circular(10)
                   ),
                   child: Container(
                     margin: EdgeInsets.only(left: 4),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         InkWell(
                           onTap: () {
                             setState(() {
                               qty++;
                               totalPrice = qty * purductValue.price;
                             });
                           },
                           child: Container(
                             decoration: BoxDecoration(
                                 color: Colors.blue,
                                 borderRadius: BorderRadius.circular(5)
                             ),
                             child: Icon(Icons.add, size: 15),
                           ),
                         ),
                         Text("$totalPrice"),
                         InkWell(
                           onTap: () {
                               setState(() {
                                 qty--;
                                 totalPrice = qty * purductValue.price;
                               });
                           },
                           child: Container(
                             decoration: BoxDecoration(
                                 color: Colors.blue,
                                 borderRadius: BorderRadius.circular(5)
                             ),
                             child: const Icon(Icons.minimize, size: 15),
                           ),
                         ),
                       ],
                     ),
                   ),
                 )
               ],
             ),

         );
       });
  }

  void increment({required double price}) {
    var qty = 0;
    setState(() {
      qty++;
      allValue = qty * price;
      print("$allValue");
    });
  }

  // ignore: non_constant_identifier_names
  void DeCrement({required double price}) {
    setState(() {
    });
  }
}