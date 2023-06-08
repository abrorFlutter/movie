import 'package:flutter/material.dart';
import 'package:movie/model/genres.dart';
import 'package:movie/view/widgets/details_page.dart';
import '../../model/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  List<Genre> movieGenres;


  MovieItem(this.movie, this.movieGenres, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          ImageCache().clear();
          _openDetailsPage(context,movie.id?.toInt());
        },
        child: Card(
            elevation: 6,
            shadowColor: Colors.blue,
            child: Container(
              margin: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network("http://image.tmdb.org/t/p/w500/${movie.posterPath}",width: 100,),
                  const SizedBox(width: 16,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(movie.title ?? "---",
                          style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                        const SizedBox(height: 10,),
                        genres(movieGenres ?? []),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 130),
                    child: Text(movie.releaseDate ?? "---"),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }

  Widget genres(List<Genre> genres) {
    List<Widget> list = [];

    genres.forEach((element) {
      list.add(Text("- ${element.name}"));
    });

    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: list,);
  }


  void _openDetailsPage(BuildContext context,int? movieId) {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>  DetailsPage(movieId!)));
  }



}
