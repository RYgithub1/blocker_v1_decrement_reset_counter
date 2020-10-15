import 'package:blocker_v1_decrement_reset_counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {runApp(MyApp());}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Increment Reset Decrement'),
      home: BlocProvider<CounterCubit>(   /// [home: BlocProviderでWrap -> 状態共有する範囲の指定]
        create: (_) => CounterCubit(),   /// [カウンターの状態管理を行うCounterCubitをインスタンス化]
        child: MyHomePage(title: 'Increment Reset Decrement'),   /// [child: CLASS() 配下のWidgetではCounterCubitの状態を共有]
      ),
    );
  }
}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  // void _incrementCounter() {   /// [increment]
  //   setState(() {
  //     _counter++;
  //   });
  // }
  // void _decrementCounter() {   /// [decrement]
  //   setState(() {
  //     _counter--;
  //   });
  // }
  // void _resetCounter() {   /// [reset]
  //   setState(() {
  //     _counter = 0;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),

      // body: Center(
      //   child: Text(
      //     '$_counter',
      //     style: Theme.of(context).textTheme.headline4,
      //   ),
      // ),
      body: BlocBuilder<CounterCubit, int>(   /// [body: BlocBuilderでwrap]->「Cubitで管理中の状態」を使いたい部分でBlocBuilder
          builder: (_, count) {
            return Center(
              child: Text(
                '$count',
                style: Theme.of(context).textTheme.headline4,
              ),
            );
          }
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton(
            // onPressed: _incrementCounter,
            // onPressed: () => context.bloc<CounterBloc>().add(CounterEvent.increment),   /// [blocの場合複数操作故add定義]
            onPressed: () => context.bloc<CounterCubit>().increment(),   /// [context.bloc<CounterCubit> -> CounterCubitクラス内メソッド利用]
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            // onPressed: _resetCounter,
            onPressed: () => context.bloc<CounterCubit>().reset(),   /// [context.bloc<CounterCubit> -> CounterCubitクラス内メソッド利用]
            tooltip: 'Reset',
            child: Icon(Icons.refresh),
          ),
          FloatingActionButton(
            // onPressed: _decrementCounter,
            onPressed: () => context.bloc<CounterCubit>().decrement(),   /// [context.bloc<CounterCubit> -> CounterCubitクラス内メソッド利用]
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
