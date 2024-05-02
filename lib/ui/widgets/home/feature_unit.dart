part of '../widgets.dart';

class FeaturedUnitItem extends StatelessWidget {
  final String imageLink;
  final void Function()? onTap;
  final String title;
  final String address;
  final int price;
  final void Function()? likeOnTap;
  final int likes;
  final int isLike;

  const FeaturedUnitItem({super.key, required this.imageLink, this.onTap, required this.title, required this.address, required this.price, this.likeOnTap, required this.likes, required this.isLike});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(30)),
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
                    ),
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
                  bottom: 2.h
              ),
              alignment: Alignment.bottomLeft,
              width: 100.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius
                            .circular(15),
                        topRight: Radius
                            .circular(15),
                      ),
                      color: white.withOpacity(.4),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                      vertical: .6.h,
                    ),
                    width: 100.w,
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Container(
                    width: 100.w,
                    color: white.withOpacity(.4),
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                      vertical: .6.h,
                    ),
                    child: Text(
                      address,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      color: white.withOpacity(.4),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                      vertical: 1.h,
                    ),
                    width: 100.w,
                    child: Text(
                      "EGP ${price} / night",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 18.sp,
                        color: darkBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(
                right: 3.w,
                top: 3.w,
              ),
              width: 100.w,
              height: 100.h,
              child: GestureDetector(
                onTap: likeOnTap,
                child: Container(
                  decoration: const BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  width: 15.w,
                  height: 4.5.h,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${likes}",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(
                          width: 1.w),
                      Icon(
                        isLike == 1 ? Icons.favorite : Icons.favorite_border,
                        color: red,
                        size: 22.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
