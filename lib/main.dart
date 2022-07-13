import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/ui/pages/pages.dart';

import 'blocs/search_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchBloc>(
            create: (context) => SearchBloc()),
      ],
      child: MaterialApp(
        home: SearchPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
