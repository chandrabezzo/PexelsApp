import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pexels/core/cache_helper.dart';
import 'package:pexels/core/network/network_info.dart';
import 'package:pexels/core/styles/styles.dart';
import 'package:pexels/data/datasources/photo_local_datasource.dart';
import 'package:pexels/data/datasources/photo_remote_datasource.dart';
import 'package:pexels/data/repositories/photo_repository_impl.dart';
import 'package:pexels/domain/usecases/get_photos.dart';
import 'package:pexels/presenter/blocs/photos/photos_bloc.dart';
import 'package:pexels/presenter/pages/main_page.dart';
import 'package:pexels/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  MyApp(this.prefs);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PhotosBloc(
          getPhotos: GetPhotos(repository: PhotoRepositoryImpl(
            remoteDatasource: PhotoRemoteDatasourceImpl(),
            localDatasource: PhotoLocalDatasourceImpl(
              CacheHelper(prefs)
            ),
            networkInfo: NetworkInfoImpl(DataConnectionChecker())
          )))
        )
      ], 
      child: MaterialApp(
        theme: Styles.themeData(context),
        home: MainPage(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouterGenerator.generatedRoute,
      )
    );
  }
}