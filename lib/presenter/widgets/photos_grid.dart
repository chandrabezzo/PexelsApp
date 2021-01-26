
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pexels/presenter/blocs/photos/photos_bloc.dart';
import 'package:pexels/presenter/blocs/photos/photos_event.dart';
import 'package:pexels/presenter/blocs/photos/photos_state.dart';
import 'package:pexels/presenter/widgets/tile_grid.dart';
import 'package:shimmer/shimmer.dart';

class PhotosGrid extends StatefulWidget {

  @override
  _PhotosGridState createState() => _PhotosGridState();
}

class _PhotosGridState extends State<PhotosGrid> {

  int _page = 1;

  PhotosBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _bloc = BlocProvider.of(context);
    _bloc.add(PhotosLoaded(_page));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PhotosBloc, PhotosState>(
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
          return RefreshIndicator(
            onRefresh: () async {
              setState(() {
                _page = 1;
              });

              return _bloc.add(PhotosLoaded(_page));
            },
            child: NotificationListener(
              onNotification: (ScrollNotification scrollInfo){
                if(scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent){
                  setState(() {
                    _page++;
                  });

                  _bloc.add(PhotosUpdated(_page));
                }

                return true;
              },
              child: StaggeredGridView.countBuilder(
                primary: false,
                crossAxisCount: 4,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                itemCount: photos.length,
                itemBuilder: (context, index){
                  final photo = photos[index];
                  return TileGrid(photo);
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(2),
              ),
            ),
          );
        }
        else {
          return _loading();
        }
      }
    );
  }

  Widget _loading(){
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2
          ),
          itemBuilder: (context, index){
            return Card();
          }
      ),
    );
  }
}