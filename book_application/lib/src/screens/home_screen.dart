import 'package:book_application/src/widgets/Categories_Page.dart';
import 'package:book_application/src/widgets/books.dart';
import 'package:book_application/src/widgets/cart_page.dart';
import 'package:book_application/src/widgets/profile_page.dart';
import 'package:flutter/material.dart';
import '../models/book_model.dart';

class Book {
  final String name;
  final String image;
  final String title;

  Book(this.name, this.image, this.title);
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePageContent(),
    CategoriesPage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: Colors.white,
          title: Text(
            "Hello Daboosh",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Stack(
              children: [
                Icon(
                  Icons.shopify,
                  size: 30,
                  color: Colors.black,
                ),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    maxRadius: 8,
                    backgroundColor: Colors.amber,
                    child: Center(
                      child: Text(
                        "8",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 15),
            Icon(
              Icons.notification_add,
              size: 30,
              color: Colors.black,
            ),
            SizedBox(width: 15),
          ],
        ),
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.green,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  HomePageContent({super.key});
  final List<Book> books = [
    Book(
      "The Subtle Art",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4lpVTHHztFZQ_Egb8XSeqGB9qWsBgxBA99G6rvUc-o-Ouj2untA0o3ULoJFxVmXrgfOY&usqp=CAU",
      "An interesting wonderful book",
    ),
    Book(
      "Another Book",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlAkmuLe5t04pqAdlj0YB8eH2fuikKN6eumA&s",
      "Another interesting book",
    ),
    Book(
      "Third Book",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_Lt5XfzMqwN2-TAM4MMjxYjsWDDPp5-T9rw&s",
      "A third book description",
    ),
    Book(
      "Fourth Book",
      "https://apps.npr.org/best-books/assets/synced/covers/2023/0593538242.jpg",
      "A fourth book description",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 380,
              height: 150,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 15,
                    left: 30,
                    child: Text(
                      "Get up to 20% off\non your first order",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 40,
                    top: 90,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: Text(
                        "Buy Now",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 220,
                    top: 16,
                    child: Image(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_Lt5XfzMqwN2-TAM4MMjxYjsWDDPp5-T9rw&s'),
                      width: 150,
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search a book',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.filter_list_rounded,
                  size: 50,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoriesPage(),
                          ),
                        );
                      },
                      child: Text("See all"),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      buildCategoryContainer("Textbooks",
                          "https://apps.npr.org/best-books/assets/synced/covers/2023/0593538242.jpg"),
                      SizedBox(width: 10),
                      buildCategoryContainer("Novel",
                          "https://apps.npr.org/best-books/assets/synced/covers/2023/0593538242.jpg"),
                      SizedBox(width: 10),
                      buildCategoryContainer("Non-Fiction",
                          "https://apps.npr.org/best-books/assets/synced/covers/2023/0593538242.jpg"),
                      SizedBox(width: 10),
                      buildCategoryContainer("Non-Fiction",
                          "https://apps.npr.org/best-books/assets/synced/covers/2023/0593538242.jpg"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Latest Books",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return buildBookContainer(books[index]);
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildBookContainer(Book book) {
    return Container(
      width: 160,
      height: 250,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            ),
            child: Image.network(
              book.image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              book.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              book.title,
              style: TextStyle(fontSize: 15),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$19.99",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Buy Now",
                          style: TextStyle(color: Colors.green),
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryContainer(String category, String imageUrl) {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
          child: Container(
            height: 80,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 3),
        Text(
          category,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
