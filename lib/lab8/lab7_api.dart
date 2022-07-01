class Lab7Api {
  Future<List<Category>> getCategories() async {
    return Future.delayed(
      const Duration(milliseconds: 100),
          () {
        return Category.allCategories;
      },
    );
    // return Future.value(Category.allCategories);
  }

  Future<List<Product>> getProductsByCategory(String category) async {
    return Future.delayed(
      const Duration(milliseconds: 100),
          () {
        return Product.allProducts
            .where((p) => p.category == category)
            .toList();
      },
    );
  }
}

class Category {
  final String id;
  final String name;
  final String photo;

  const Category({
    required this.id,
    required this.name,
    required this.photo
  });

  static const List<Category> allCategories = [
    Category(id: '0', name: 'Fruits', photo: ""),
    Category(id: '2', name: 'Veggies', photo: ""),
    Category(id: '3', name: 'Meat', photo: ""),
    Category(id: '4', name: 'Diary', photo: ""),
    Category(id: '5', name: 'Snacks', photo: ""),
  ];
}

class Product {
  final String id;
  final String name;
  final String category;
  final String photo;
  final double price;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.photo,
    required this.price,
  });

  static const List<Product> allProducts =  [
    Product(id: '0', name: 'Apple', category: 'Fruits',price: 10, photo: "https://www.collinsdictionary.com/images/full/apple_158989157.jpg"),
    Product(id: '2', name: 'Banana', category: 'Fruits', price: 11, photo: "https://img.freepik.com/free-vector/vector-ripe-yellow-banana-bunch-isolated-white-background_1284-45456.jpg"),
    Product(id: '3', name: 'Mango', category: 'Fruits', price: 12, photo: "https://img.freepik.com/free-photo/ripe-mango-with-green-leaf-isolated-white_252965-183.jpg?w=2000"),
    Product(id: '4', name: 'Pine apple', category: 'Fruits',price: 12, photo: "https://wingmarts.com/media/user_299/23422/UBM-FF006.png"),
    Product(id: '5', name: 'Orange', category: 'Fruits', price: 12,photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Orange-Fruit-Pieces.jpg/1200px-Orange-Fruit-Pieces.jpg"),
    Product(id: '6', name: 'Egg plant', category: 'Veggies',price: 12, photo: "https://media.istockphoto.com/photos/eggplant-isolated-on-white-picture-id510515443?k=20&m=510515443&s=612x612&w=0&h=VZfZR8XRcGJzOcpcB1jF4teU-flgqcXdwYsmfM7OzDI="),
    Product(id: '7', name: 'Cucumber', category: 'Veggies',price: 12, photo: "https://img.freepik.com/free-photo/cucumber-vegetable-isolated-white-background_42033-135.jpg?w=2000"),
    Product(id: '8', name: 'Carrot', category: 'Veggies',price: 12, photo: "https://befreshcorp.net/wp-content/uploads/2017/06/product-packshot-Carrot.jpg"),
    Product(id: '9', name: 'Bell Pepper', category: 'Veggies',price: 12, photo: "https://i5.walmartimages.com/asr/7be94a8e-9a5d-4f87-842f-5fe4084138ba.c95d36e140f5e0d492ca632b42e4543c.jpeg"),
    Product(id: '10', name: 'Brocculi', category: 'Veggies',price: 12, photo: "https://cdn.britannica.com/25/78225-050-1781F6B7/broccoli-florets.jpg"),
    Product(id: '12', name: 'Out milk', category: 'Diary',price: 12, photo: "https://images.squarespace-cdn.com/content/v1/5c7d71d29b7d153b9ba9c6c5/1593549984326-9IMC1988RM711U9Q0K7F/image-asset.jpeg"),
    Product(id: '13', name: 'Soy milk', category: 'Diary', price: 12,photo: "https://www.biolabcafe.com/wp-content/uploads/2022/02/1605751237_Soy20Milk-2.jpg"),
    Product(id: '15', name: 'Goat milk', category: 'Diary',price: 12, photo: "https://images.heb.com/is/image/HEBGrocery/001414619?fit=constrain,1&wid=800&hei=800&fmt=jpg&qlt=85,0&resMode=sharp2&op_usm=1.75,0.3,2,0"),
    Product(id: '15', name: 'Cow milk', category: 'Diary',price: 12, photo: "https://4.imimg.com/data4/HX/DL/MY-2942987/fresh-cow-milk-500x500.jpg"),
    Product(id: '15', name: 'Camel milk', category: 'Diary',price: 12, photo: "https://www.ubuy.com.kh/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvNzFYTk5XSFZlVUwuX1NMMTUwMF8uanBn.jpg"),
    Product(id: '15', name: 'Buffalo milk', category: 'Diary',price: 12, photo: "https://static.toiimg.com/photo/69464837.cms"),
    Product(id: '15', name: 'Hen milk', category: 'Diary',price: 12, photo: "https://thumbs.dreamstime.com/b/milk-eggs-3726348.jpg"),
    Product(id: '16', name: 'Kebob', category: 'Meat',price: 12, photo: "https://www.cookingclassy.com/wp-content/uploads/2012/11/chicken+teriyaki+kebabs7.jpg"),
    Product(id: '17', name: 'Steak', category: 'Meat',price: 12, photo: "https://www.seriouseats.com/thmb/K40kegtcsC9WbzOCvogu-sjU79k=/1500x1125/filters:fill(auto,1)/butter-basted-pan-seared-steaks-recipe-hero-06-03b1131c58524be2bd6c9851a2fbdbc3.jpg"),
    Product(id: '18', name: 'Alien', category: 'Meat',price: 12, photo: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/green-alien-looking-angry-or-dangerous-royalty-free-image-1620398625."),
    Product(id: '19', name: 'Roger smith', category: 'Meat',price: 12, photo: "https://upload.wikimedia.org/wikipedia/commons/f/fa/Roger_Smith_Mister_Roberts.JPG"),
    Product(id: '20', name: 'Meat Balls Z', category: 'Meat',price: 12, photo: "https://thumbs.dreamstime.com/z/home-made-meat-balls-tomatoes-onions-peppers-herbs-wooden-rustic-background-top-view-close-up-black-pepper-red-chili-131777907.jpg"),
    Product(id: '21', name: 'KitKat', category: 'Snacks',price: 12, photo: "data:image/jpeg;base64,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"),
  ];
}