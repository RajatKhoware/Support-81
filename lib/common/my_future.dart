import 'package:flutter/material.dart';

class MyFutureBuilder<T> extends StatefulWidget {
  final Future<T> future;
  final Widget Function(BuildContext context, T data) builder;
  final Widget Function(BuildContext context, Object error) errorBuilder;
  final Widget Function(BuildContext context) loadingBuilder;

  const MyFutureBuilder({
    Key? key,
    required this.future,
    required this.builder,
    this.errorBuilder = defaultErrorBuilder,
    this.loadingBuilder = defaultLoadingBuilder,
  }) : super(key: key);

  static Widget defaultLoadingBuilder(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }

  static Widget defaultErrorBuilder(BuildContext context, Object error) {
    return Text(error.toString());
  }

  @override
  _MyFutureBuilderState<T> createState() => _MyFutureBuilderState<T>();
}

class _MyFutureBuilderState<T> extends State<MyFutureBuilder<T>> {
  late Future<T> _future;

  @override
  void initState() {
    _future = widget.future;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return widget.builder(context, snapshot.data!);
        } else if (snapshot.hasError) {
          return Center(child: widget.errorBuilder(context, snapshot.error!));
        } else {
          return Center(child: widget.loadingBuilder(context));
        }
      },
    );
  }
}
