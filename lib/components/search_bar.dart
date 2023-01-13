import 'package:flutter/cupertino.dart';

class SearchBar extends StatelessWidget {
  final onChanged;
  final onSubmitted;
  const SearchBar({super.key, required this.onChanged, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: CupertinoSearchTextField(
        onChanged: (value) => onChanged(value),
        onSubmitted: (value)=> onSubmitted(value),
      ),
    ));
  }
}
