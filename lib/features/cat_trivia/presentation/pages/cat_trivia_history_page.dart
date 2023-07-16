import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_cat_trivia/core/utils/date_format.dart';
import 'package:test_task_cat_trivia/features/cat_trivia/presentation/bloc/cat_trivia_bloc.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../../di/dependency_injection.dart';
import '../widgets/app_bar_history.dart';

class CatTriviaHistoryPage extends StatefulWidget {
  const CatTriviaHistoryPage({super.key});

  static Widget screen() => BlocProvider(
        create: (context) =>
            di<CatTriviaBloc>()..add(GetCatTriviaHistoryEvent()),
        child: CatTriviaHistoryPage(),
      );

  @override
  State<CatTriviaHistoryPage> createState() => _CatTriviaHistoryPageState();
}

class _CatTriviaHistoryPageState extends State<CatTriviaHistoryPage> {
  late CatTriviaBloc _catTriviaBloc;

  @override
  void initState() {
    // _catTriviaBloc = di<CatTriviaBloc>();
    _catTriviaBloc = BlocProvider.of<CatTriviaBloc>(context);
    super.initState();
  }

  Future _handleRefresh() async {
    return _catTriviaBloc.add(GetCatTriviaHistoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBackgroundColor,
      appBar: MyAppBarHistory(
        name: 'Cat Trivia History',
      ),
      body: BlocBuilder<CatTriviaBloc, CatTriviaState>(
        builder: (context, state) {
          if (state is CatTriviaHistoryLoadedSuccess) {
            return ListView.builder(
              itemCount: state.entities.length,
              itemBuilder: (context, index) {
                final catTrivia = state.entities[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: ListTile(
                    title: Text(catTrivia.text!),
                    subtitle: Text(dateFormat(catTrivia.createdAt!)),
                  ),
                );
              },
            );
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
            child: Text('Ma\'lumot topilmadi'),
          );
        },
      ),
    );
  }
}
