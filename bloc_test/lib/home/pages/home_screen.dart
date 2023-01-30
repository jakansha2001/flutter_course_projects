import 'package:bloc_test/home/bloc/home_bloc.dart';
import 'package:bloc_test/result/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          IconButton(
            onPressed: () {
              homeBloc.add(IncrementEvent());
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              homeBloc.add(DecrementEvent());
            },
            icon: Icon(Icons.minimize),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     homeBloc.add(IncrementEvent());
      //   },
      //   child: const Icon(Icons.add),
      // ),
      //
      //
      // THIS WILL SEND A NEW INSTANCE OF THE BLOC MAKING THE VALUE 0
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context).push(
      //       MaterialPageRoute(
      //         builder: (context) => BlocProvider<HomeBloc>(
      //           create: (context) => HomeBloc(),
      //           child: const Result(),
      //         ),
      //       ),
      //     );
      //   },
      //   child: Icon(
      //     Icons.next_plan,
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: homeBloc,
                child: const Result(),
              ),
            ),
          );
        },
        child: Icon(
          Icons.next_plan,
        ),
      ),
      body: Center(
        child: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state.status == HomeStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Negative Value'),
                ),
              );
            }
          },
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.status == HomeStatus.loading) {
                return const CircularProgressIndicator();
              }
              return Text(state.counterValue.toString());
            },
          ),
        ),
      ),
    );
  }
}
