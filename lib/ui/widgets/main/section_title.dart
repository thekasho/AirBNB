part of '../widgets.dart';

class MainHomeTitle extends StatelessWidget {
  final String sectionTitle;
  final void Function()? onTap;
  const MainHomeTitle({
    super.key, required this.sectionTitle, this.onTap,
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
        GestureDetector(
          onTap: onTap,
          child: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: 2.h,
            ),
            width: 30.w,
            child: Text(
              "See All",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}