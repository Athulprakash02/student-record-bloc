import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_db_sample/bloc/add%20screen%20bloc/bloc/image_bloc.dart';
import 'package:hive_db_sample/bloc/details%20bloc/bloc/details_bloc.dart';
import 'package:hive_db_sample/bloc/search/bloc/search_bloc.dart';
import 'package:hive_db_sample/bloc/update_image/bloc/edit_image_bloc.dart';
import 'package:hive_db_sample/db/model/data_model.dart';
import 'package:hive_db_sample/screen_home.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main(List<String> args) async {
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  await Hive.openBox<StudentModel>('student_db');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DetailsBloc()),
        BlocProvider(create: (context) => ImageBloc()),
        BlocProvider(create: (context) => EditImageBloc(),),
        BlocProvider(create: (context) => SearchBloc(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Student Details',
        theme: ThemeData(primarySwatch: Colors.cyan),
        home: ScreenHome(),
      ),
    );
  }
}
