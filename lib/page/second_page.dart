import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/cubit/counter_cubit.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterCubit, int>(
                cubit: BlocProvider.of<CounterCubit>(context),
                builder: (BuildContext context, state) {
                  print('second build');
                  return Text('count:$state');
                },
              ),
              buildPadding(),
              RaisedButton(
                child: Icon(Icons.add),
                onPressed: () => context.read<CounterCubit>().increment(),
              ),
              RaisedButton(
                child: Icon(Icons.remove),
                onPressed: () => context.read<CounterCubit>().decrement(),
              ),
            ],
          ),
        ));
  }

  buildPadding() {
    print('second build padding');
    return SizedBox(
      height: 10,
    );
  }
}
