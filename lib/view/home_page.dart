import 'package:flutter/material.dart';
import 'package:movie/view/widgets/movie_item.dart';
import 'package:movie/view_model/main_viewModel.dart';
import 'package:provider/provider.dart';

import '../core/app_response.dart';
import '../model/genres.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _index = 0;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Provider.of<MainViewModel>(context, listen: false).fetchPopular(_index);
    Provider.of<MainViewModel>(context, listen: false).fetchGenres();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
        bottom:
        PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
          child:BottomNavigationBar(
            currentIndex: _index,
            onTap: onTapIndex,
            selectedLabelStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
            unselectedLabelStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
            selectedIconTheme: const IconThemeData(opacity: 0.0, size: 0),
            unselectedIconTheme: const IconThemeData(opacity: 0.0, size: 0),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.add), label: "Popular",),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: "Now playing",),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: "Upcoming"),
           //   http://image.tmdb.org/t/p/w500/your_poster_path
            ],
          ),
        ),
      ),

      body: Consumer<MainViewModel> (builder: (context,data,child) {
        List<Genre> genres = data.genres;

        if(data.response.status == Status.LOADING){
          return const CircularProgressIndicator();
        }
        if(data.response.status == Status.COPMLETED){
          return ListView.builder(
            itemCount: data.movies.length,
              itemBuilder: (context, int index){

              List<Genre> movieGenres = [];
              data.movies[index].genreIds?.forEach((element) {
                movieGenres.addAll(genres.where((genre) => genre.id == element));
              });

            return MovieItem(data.movies[index],movieGenres);
          });
        }
        if(data.response.status == Status.ERROR){
          return Center(child: Text(data.response.message!));
        }
        if(data.response.status == Status.INITIAL){
          return const Center(child: Text("initial"));
        }
        return const Center(child: Text("bo'sh"));
      },),
    );
  }


  void onTapIndex(int index) {
    setState(() {
      _index = index;
    });
  }

}
