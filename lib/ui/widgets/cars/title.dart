part of '../widgets.dart';

class CarsTitle extends StatelessWidget {
  final String sectionTitle;
  const CarsTitle({
    super.key, required this.sectionTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: 2.h
          ),
          width: 70.w,
          child: Text(
            sectionTitle,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}