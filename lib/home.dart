import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? buildPortraitLayout()
              : buildLandscapeLayout();
        },
      ),
    );
  }

  buildPortraitLayout() {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return Card(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            // height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(articles[index].icon),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(articles[index].text),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    articles[index].totalOrder,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  buildLandscapeLayout() {
    return Expanded(
      child: GridView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return Card(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(articles[index].icon),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(articles[index].text),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      articles[index].totalOrder,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
      ),
    );
  }
}

class Article {
  final IconData icon;
  final String text;
  final String totalOrder;

  Article({required this.icon, required this.text, required this.totalOrder});
}

List<Article> articles = [
  Article(
    icon: Icons.shopping_cart,
    text: 'Orders',
    totalOrder: '567',
  ),
  Article(
    icon: Icons.shopping_cart,
    text: 'Orders',
    totalOrder: '321',
  ),
  Article(icon: Icons.shopping_cart, text: 'Orders', totalOrder: '1234'),
];
