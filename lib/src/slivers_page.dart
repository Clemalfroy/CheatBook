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
    List<String> imageList = ['cmalfroy', 'cmalfroy', 'cmalfroy', 'cmalfroy'];
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text('Slivers Page'),
          expandedHeight: 200.0,
          flexibleSpace: Align(
            alignment: Alignment.bottomCenter,
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return FlexibleSpaceBar(
                  background: Image.network(
                "https://images.unsplash.com/photo-1542601098-3adb3baeb1ec?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=5bb9a9747954cdd6eabe54e3688a407e&auto=format&fit=crop&w=500&q=60",
                fit: BoxFit.cover,
              ));
            }),
          ),
          pinned: true,
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          sliver: SliverToBoxAdapter(
            child: Container(
              height: 150.0,
              width: 150.0,
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
