import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_db_sample/bloc/details%20bloc/bloc/details_bloc.dart';
import 'package:hive_db_sample/db/functions/db_functions.dart';
import 'package:hive_db_sample/screen/screen_person.dart';
import 'package:hive_db_sample/screen/screen_search.dart';
import 'package:hive_db_sample/screen/screen_update.dart';

class ScreenDetails extends StatelessWidget {
   ScreenDetails({super.key});

  // late Box<StudentModel> studentBox;

  // @override
  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return BlocBuilder<DetailsBloc, DetailsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            // backgroundColor: Colors.blue,
            centerTitle: true,
            title: const Text('Student Details'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  SearchScreen(),
                    ));
                  },
                  icon: const Icon(Icons.search))
            ],
          ),
          body: SafeArea(
            child:  ListView.separated(
                  itemBuilder: (ctx, index) {
                    final data = state.studentList[index];
                    return ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return PersonScreen(passValue: data, idPass: index);
                          },
                        ));
                      },
    
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: FileImage(File(data.img)),
                      ),
                      title: Text(data.name),
    
                      trailing: Wrap(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => UpdateScreen(index: index),
                              ));
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.grey,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                deleteAlert(context, index);
                                //  if(data.id != null){
    
                                //    deleteStudent(data.id!);
                                //  }else{
                                //   print('key not found');
                                //  }
                              },
                              icon: const Icon(
                                Icons.delete_forever,
                                color: Colors.red,
                              ))
                        ],
                      ),
                      // IconButton(onPressed: () {
    
                      //     }, icon: Icon(Icons.delete)),
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return const Divider();
                  },
                  itemCount: state.studentList.length,
                ),
             
          ),
        );
      },
    );
  }

  deleteAlert(BuildContext context, key) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: const Text(
          'Delete data Permanently?',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
              onPressed: () {
                deleteStudent(key, context);
                Navigator.of(context).pop(ctx);
              },
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.red, fontSize: 20),
              )),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(ctx);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                    color: Color.fromARGB(255, 76, 228, 15), fontSize: 20),
              ))
        ],
      ),
    );
  }
}
