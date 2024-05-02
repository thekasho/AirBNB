part of '../widgets.dart';

class FilterButton extends StatelessWidget {
  final void Function()? onPressed;
  final int currentPage;
  final int current;
  final String title;
  final IconData? icon;

  const FilterButton({super.key, this.onPressed, required this.currentPage, required this.title, required this.current, this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          side: MaterialStateProperty.all(const BorderSide(
            color: primaryColor,
            width: 2,
            style: BorderStyle.solid,),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 4.w,)),
          backgroundColor: MaterialStateProperty.all<Color>(
            currentPage == current
            ? primaryColor
            : white,
          ),
          shape: MaterialStateProperty.all<
              RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon, size: 20.sp,
              color: currentPage == current
                ? white
                : primaryColor,
            ),
            SizedBox(width: 1.w),
            SizedBox(width: 0.6.w),
            Text(
              title,
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(
                color: currentPage == current ? white : primaryColor, fontSize: 19,),
            ),
          ],
        ),
      ),
    );
  }
}
