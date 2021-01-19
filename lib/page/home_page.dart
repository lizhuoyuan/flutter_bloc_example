import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/cubit/counter_cubit.dart';
import 'package:flutter_bloc_example/page/second_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, int>(
              builder: (context, count) {
                print('rebuild');
                return Center(
                  child: Text('$count'),
                );
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
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return SecondPage();
          }));
        },
      ),
    );
  }

  buildPadding() {
    print('build padding');
    return SizedBox(
      height: 10,
    );
  }
}
