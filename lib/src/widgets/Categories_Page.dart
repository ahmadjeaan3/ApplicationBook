// ignore: file_names
// ignore_for_file: prefer_const_constructors

import 'package:book_application/src/screens/home_screen.dart';
import 'package:book_application/src/widgets/books.dart';
import 'package:flutter/material.dart';

class Book {
  final String name;
  final String image;

  Book(this.name, this.image);
}

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});

  final List<Book> books = [
    Book(
      "The Subtle Art",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSALY8U08Pk6cTXBh1gkT7acMgOxkahHrQzTA&s",
    ),
    Book(
      "Another Book",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlAkmuLe5t04pqAdlj0YB8eH2fuikKN6eumA&s",
    ),
    Book(
      "Third Book",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_Lt5XfzMqwN2-TAM4MMjxYjsWDDPp5-T9rw&s",
    ),
    Book(
      "Fourth Book",
      "https://apps.npr.org/best-books/assets/synced/covers/2023/0593538242.jpg",
    ),
    Book(
      "Fourth Book",
      "https://apps.npr.org/best-books/assets/synced/covers/2023/0593538242.jpg",
    ),
    Book(
      "The Subtle Art",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSALY8U08Pk6cTXBh1gkT7acMgOxkahHrQzTA&s",
    ),
    Book(
      "Another Book",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlAkmuLe5t04pqAdlj0YB8eH2fuikKN6eumA&s",
    ),
    Book(
      "Third Book",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_Lt5XfzMqwN2-TAM4MMjxYjsWDDPp5-T9rw&s",
    ),
    Book(
      "Fourth Book",
      "https://apps.npr.org/best-books/assets/synced/covers/2023/0593538242.jpg",
    ),
    Book(
      "Fourth Book",
      "https://apps.npr.org/best-books/assets/synced/covers/2023/0593538242.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Categories",
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
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  SizedBox(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search a book',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.filter_list_rounded,
                    size: 50,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: List.generate((books.length / 2).ceil(), (index) {
                  final book1 = books[index * 2];
                  final book2 = index * 2 + 1 < books.length
                      ? books[index * 2 + 1]
                      : null;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildBookContainer(book1, context),
                      if (book2 != null) buildBookContainer(book2, context),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBookContainer(Book book, BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return BooksPage();
            }));
          },
          child: Container(
            width: 150,
            height: 190,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(50),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: NetworkImage(book.image),
                width: 100,
                height: 100,
                fit: BoxFit.fill,
                colorBlendMode: BlendMode.dst,
              ),
            ),
          ),
        ),
        Text(
          book.name,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
