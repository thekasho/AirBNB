part of '../widgets.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainHomeContImp>(builder: (cont) {
      return BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        child: Row(
          children: [
            ...List.generate(
              cont.pagesList.length + 1, (index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2 ? const Spacer() :
                CustomAppBarButton(
                    buttonTitle: cont.pagesTitles[i], buttonIcon: cont.pageIcons[i],
                    active: cont.currentPage == i ? true : false,
                    onPressed: () => cont.changePage(i)
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
