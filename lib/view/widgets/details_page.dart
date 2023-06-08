import 'package:flutter/material.dart';
import 'package:movie/model/details.dart';
import 'package:movie/view_model/detail_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../core/app_response.dart';

class DetailsPage extends StatefulWidget {
  final int movieId;

  const DetailsPage(this.movieId, {Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    ImageCache().clear();
    Provider.of<DetailsViewModel>(context, listen: false)
        .fetchDetailsId(widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Details")),
      body: Consumer<DetailsViewModel>(
        builder: (context, data, child) {
          if (data.response.status == Status.LOADING) {
            return const CircularProgressIndicator();
          }
          if (data.response.status == Status.COPMLETED) {
            return _initUI(data.details!);
          }
          if (data.response.status == Status.ERROR) {
            return Center(child: Text(data.response.message!));
          }
          if (data.response.status == Status.INITIAL) {
            return const Center(child: Text("initial"));
          }
          return const Center(child: Text("bo'sh"));
        },
      ),
    );
  }

  Widget _initUI(Details details) {
    return Column(
      children: [
        Image(
          key: const Key("assets/"),
          image: NetworkImage("http://image.tmdb.org/t/p/w500/${details.backdroppath}"),
        ),
        // FadeInImage(placeholder: const AssetImage("assets/img.png"), height: 220 ,width: double.infinity,
        //     image:NetworkImage("http://image.tmdb.org/t/p/w500/${details.backdroppath}") ),
      ],
    );
  }


  @override
  void deactivate() {
    ImageCache().clear();
    super.deactivate();
  }


}
