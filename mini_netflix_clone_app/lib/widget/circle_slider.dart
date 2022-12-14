import 'package:flutter/material.dart';

import '../model/model_movie.dart';
import '../screen/detail_screen.dart';

class CircleSlider extends StatelessWidget {
  final List<Movie>? movies;

  const CircleSlider({
    this.movies,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('미리보기'),
          Container(
            height: 120,
            child: Container(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal, // 좌우로 스크롤 가능
                children: makeCircleImages(context, movies),
              ),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeCircleImages(BuildContext context, List<Movie>? movies) {
  List<Widget> results = [];

  if (movies == null) {
    return [
      Center(
        child: CircularProgressIndicator(),
      )
    ];
  }

  for (var i = 0; i < movies.length; i++) {
    results.add(
      InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return DetailScreen(movie: movies[i]);
              }));
        },
        child: Container(
          padding: EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                movies[i].poster,
              ),
              radius: 48,
            ),
          ),
        ),
      ),
    );
  }

  return results;
}
