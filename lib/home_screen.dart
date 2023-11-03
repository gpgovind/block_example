import 'package:block_example/bloc/submit_bloc.dart';
import 'package:block_example/bloc/submit_event.dart';
import 'package:block_example/bloc/submit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/submit_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
        child: Column(
          children: [
            BlocBuilder<SubmitBloc, SubmitState>(
              builder: (context, state) {
                if (state is SubmitErrorState) {
                  return Text(
                    state.error,
                    style: const TextStyle(color: Colors.red),
                  );
                } else {
                  return Container();
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(hintText: 'enter email'),
              onChanged: (value) {
                BlocProvider.of<SubmitBloc>(context).add(SubmitTextChangeEvent(
                    _emailController.text, _passWordController.text));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'enter password'),
              controller: _passWordController,
              onChanged: (value) {
                BlocProvider.of<SubmitBloc>(context).add(SubmitTextChangeEvent(
                    _emailController.text, _passWordController.text));
              },
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<SubmitBloc, SubmitState>(
              builder: (context, state) {
                return SubmitButton(
                  onTap: () {},
                  color: state is SubmitValidState
                      ? Colors.blue
                      : Colors.grey[500],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
