import 'dart:math';

import 'package:flutter/material.dart';

class SliversPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScrollable(context),
    );
  }

  Widget _buildScrollable(BuildContext context) {
    List<String> imageList = ['cmalfroy', 'anzouari', 'rghirell', 'curquiza'];
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text('Slivers Page'),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          sliver: SliverToBoxAdapter(
            child: Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageList.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 150.0,
                    child: ClipOval(
                      child: Card(
                        child: Image.network(
                          "https://cdn.intra.42.fr/users/medium_${imageList[index]}.jpg",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(16.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(List.generate(15, (index) {
              return ListTile(
                leading: Icon(
                  Icons.favorite,
                  color: Color.fromRGBO(Random().nextInt(255),
                      Random().nextInt(255), Random().nextInt(255), 1),
                ),
                title: Text(
                  'Lorem Ipsum',
                  style: Theme.of(context).textTheme.title,
                ),
              );
            })),
          ),
        ),
      ],
    );
  }
}
