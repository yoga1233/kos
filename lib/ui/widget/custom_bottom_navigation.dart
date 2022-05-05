import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kos/cubit/page_cubit.dart';

import '../../shared/theme.dart';

class CustomBottomNavigation extends StatelessWidget {
  final String imageUrl;
  final int index;
  const CustomBottomNavigation(
      {Key? key, required this.imageUrl, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Image.asset(
            imageUrl,
            width: 24,
            height: 24,
            color: context.watch<PageCubit>().state == index
                ? primaryColor
                : greyColor,
          ),
          Container(
            width: 30,
            height: 4,
            color: context.watch<PageCubit>().state == index
                ? primaryColor
                : Colors.transparent,
          )
        ],
      ),
    );
  }
}
