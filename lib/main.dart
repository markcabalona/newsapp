import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:newsapp/core/usecases/usecase_params.dart';
import 'package:newsapp/features/news/presentation/bloc/news_bloc.dart';
import 'dependency_injection.dart' as di;

Future<void> main() async {
  di.init();
  await dotenv.load(fileName: '.env');
  runApp(
    BlocProvider(
      create: (_) => di.sl<NewsBloc>()
        ..add(const FetchNewsEvent(params: FetchNewsParams())),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Balita',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF5C1D1D),
      ),
      home: const MyHomePage(),
    );
  }
}

// THIS IS JUST FOR TESTING
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      bloc: BlocProvider.of(context),
      builder: (context, state) {
        if (state is Loading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (state is Error) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text((state as NewsLoaded).news.length.toString()),
            ),
          );
        }
      },
    );
  }
}
