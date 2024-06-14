import 'package:flutter/material.dart';

class Book {
  final String name;
  final String image;
  final String title;

  Book(this.name, this.image, this.title);
}

class BooksPage extends StatelessWidget {
  BooksPage({super.key});

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
    // أضف المزيد من الكتب إذا لزم الأمر
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Text Books",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          toolbarHeight: 100,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: List.generate((books.length / 2).ceil(), (index) {
              final book1 = books[index * 2];
              final book2 =
                  index * 2 + 1 < books.length ? books[index * 2 + 1] : null;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildBookContainer(book1),
                  if (book2 != null) buildBookContainer(book2),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget buildBookContainer(Book book) {
    return Container(
      width: 180,
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
}
