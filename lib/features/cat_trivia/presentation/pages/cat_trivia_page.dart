import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_cat_trivia/core/utils/date_format.dart';
import 'package:test_task_cat_trivia/features/cat_trivia/presentation/bloc/cat_trivia_bloc.dart';
import 'package:test_task_cat_trivia/features/cat_trivia/presentation/widgets/cat_image.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../../di/dependency_injection.dart';
import '../widgets/app_bar.dart';
import '../widgets/country_shimmer_widget.dart';
import 'cat_trivia_history_page.dart';

class CatTriviaPage extends StatefulWidget {
  const CatTriviaPage({super.key});

  static Widget screen() => BlocProvider(
        create: (context) => di<CatTriviaBloc>()..add(GetCatTriviaEvent()),
        child: CatTriviaPage(),
      );

  @override
  State<CatTriviaPage> createState() => _CatTriviaPageState();
}

class _CatTriviaPageState extends State<CatTriviaPage> {
  late CatTriviaBloc _catTriviaBloc;

  @override
  void initState() {
    // _catTriviaBloc = di<CatTriviaBloc>();
    _catTriviaBloc = BlocProvider.of<CatTriviaBloc>(context);
    super.initState();
  }

  Future _handleRefresh() async {
    return _catTriviaBloc.add(GetCatTriviaEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBackgroundColor,
      appBar: MyAppBar(
        name: 'Cat Trivia',
      ),
      body: BlocBuilder<CatTriviaBloc, CatTriviaState>(
        builder: (context, state) {
          if (state is CatTriviaLoadedSuccess) {
            return RefreshIndicator(
                onRefresh: () => _handleRefresh(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CatImage(),
                      Text(
                        state.entity.text!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.black),
                      ),
                      const Divider(height: 10),
                      Text(
                        dateFormat(state.entity.createdAt!),
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.black),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _handleRefresh();
                          },
                          child: Text('Upload Trivia')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CatTriviaHistoryPage.screen()));
                          },
                          child: Text('Cat Trivia History'))
                    ],
                  ),
                ));
          } else if (state is CatTriviaLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CatTriviaLoadedFailure) {
            return Center(
              child: Text(state.message,
                  style:
                      const TextStyle(fontSize: 20, color: Color(0xff939EB4))),
            );
          }
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: CatTriviaShimmerWidget(),
          );
        },
      ),
    );
  }
}
