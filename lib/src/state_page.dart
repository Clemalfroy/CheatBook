import 'package:flutter/material.dart';
import 'package:flutter_cheatbook/src/models/scoped_model_counter.dart';
import 'package:scoped_model/scoped_model.dart';

class StatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ScopedModel<CounterModel>(
        model: CounterModel(),
        child: InheritedScopedWidget(),
      ),
    );
  }
}

class InheritedScopedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = CounterModel.of(context);
    return Column(
      children: <Widget>[
        Text('${state.counter}'),
        FloatingActionButton(
          onPressed: () => state.increment(),
        )
      ],
    );
  }
}
