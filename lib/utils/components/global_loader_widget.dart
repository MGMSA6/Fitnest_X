import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/global_loader_bloc/global_loader_bloc.dart';

class GlobalLoaderWidget extends StatelessWidget {
  final Widget child;

  const GlobalLoaderWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        BlocListener<GlobalLoaderBloc, GlobalLoaderState>(
          listener: (context, state) {
            if (state.isLoading) {
              // Show loader
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              // Hide loader
              Navigator.of(context).pop();
            }
          },
          child: BlocBuilder<GlobalLoaderBloc, GlobalLoaderState>(
            builder: (context, state) {
              // You can also handle the loading state here if needed,
              // but it is not required since we handle it in the listener.
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
