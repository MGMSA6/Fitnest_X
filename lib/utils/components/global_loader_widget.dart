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
        BlocBuilder<GlobalLoaderBloc, GlobalLoaderState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Container(
                color: Colors.black54,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
