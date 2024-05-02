part of '../widgets.dart';

class HomeUnitsItem extends StatelessWidget {
  final void Function()? onTap;
  final String imageLink;
  final void Function()? onLikeTap;
  final int likes;
  final int isLike;
  final String title;
  final String address;
  final int price;

  const HomeUnitsItem({super.key, this.onTap, required this.imageLink, this.onLikeTap, required this.likes, required this.isLike, required this.title, required this.address, required this.price});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
                Radius.circular(15)),
            color: lightGrey.withOpacity(.3),
            border: Border.all(
                width: 1,
                color: lightGrey
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 20.h,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: lightGrey,
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    child: CachedNetworkImage(
                      imageUrl: imageLink,
                      height: 100.h,
                      width: 100.w,
                      fit: BoxFit.fill,
                      errorWidget: (_, i, e) {
                        return Container(
                            color: black,
                            height: 100.h,
                            child: Image.asset(
                              "assets/images/blank.png",
                            )
                        );
                      },
                      placeholder: (_, i) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.w),
                    ),
                    padding: EdgeInsets.only(
                      left: 5.w,
                      right: 5.w,
                      bottom: 2.h,
                    ),
                    alignment: Alignment.bottomLeft,
                    width: 100.w,
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.only(
                      right: 3.w,
                      top: 3.w,
                    ),
                    width: 100.w,
                    height: 100.h,
                    // color: black.withOpacity(.5),
                    child: GestureDetector(
                      onTap: onLikeTap,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        width: 13.w,
                        height: 4.h,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$likes",
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontSize: 16.sp,
                              ),
                            ),
                            SizedBox(width: 1.w),
                            Icon(
                              isLike == 1
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: red,
                              size: 18.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.h),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: .5.h),
            Text(
              address,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: darkGrey,
                fontWeight: FontWeight.bold,
                fontSize: 17.sp,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              "EGP $price / night",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 16.sp,
                color: darkBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
