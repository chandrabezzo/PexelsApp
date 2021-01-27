import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pexels/core/images.dart';
import 'package:pexels/presenter/blocs/photos/photos_bloc.dart';
import 'package:pexels/presenter/blocs/photos/photos_event.dart';
import 'package:pexels/presenter/blocs/photos/photos_state.dart';
import 'package:pexels/presenter/widgets/photos_grid.dart';
import 'package:pexels/presenter/widgets/photos_list.dart';

class MainPage extends StatefulWidget {
  static const String routeName = "/main";

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  bool _isGrid = true;
  int _page = 1;
  final _scrollController = ScrollController();

  PhotosBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _bloc = BlocProvider.of(context);
    _bloc.add(PhotosLoaded(_page));

    _scrollController.addListener(() {
      if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent){
        setState(() {
          _page++;
        });

        _bloc.add(PhotosUpdated(_page));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled){
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200,
              floating: false,
              pinned: true,
              title: (innerBoxIsScrolled) ? Text("Pexels") : SizedBox.shrink(),
              flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(banner)),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.grid_view,
                    color: (_isGrid) ? Colors.white : Color(0xffbfbfbf),
                  ),
                  onPressed: () {
                    setState(() {
                      _isGrid = true;
                    });
                  }
                ),
                IconButton(
                  icon: Icon(
                    Icons.list,
                    color: (!_isGrid) ? Colors.white : Color(0xffbfbfbf),
                  ),
                  onPressed: () {
                    setState(() {
                      _isGrid = false;
                    });
                  }
                ),
              ],
            ),
          ];
        },
        body: SingleChildScrollView(
          child: BlocConsumer<PhotosBloc, PhotosState>(
            listener: (context, state){
              if(state is PhotosLoadFailed){
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Load photos failed"),
                  action: SnackBarAction(
                    label: "Retry",
                    onPressed: () => _bloc.add(PhotosLoaded(_page)),
                  ),
                ));
              }
            },
            builder: (context, state){
              if(state is PhotosLoadSuccess){
                final photos = state.photos;
                return (_isGrid) ? PhotosGrid(photos) : PhotosList();
              }
              else {
                return Text("Loading");
              }
            },
          ),
        ),
      ),
    );
  }
}