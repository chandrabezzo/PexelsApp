
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pexels/domain/entities/photo.dart';
import 'package:pexels/presenter/widgets/tile_grid.dart';

class PhotosGrid extends StatefulWidget {

  final List<Photo> photos;

  PhotosGrid(this.photos);

  @override
  _PhotosGridState createState() => _PhotosGridState();
}

class _PhotosGridState extends State<PhotosGrid> {

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      primary: true,
      crossAxisCount: 4,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      itemCount: widget.photos.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index){
        final photo = widget.photos[index];
        return TileGrid(photo);
      },
      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
    );
  }
}