part of '../widgets.dart';

class MainSearchInput extends StatelessWidget {
  const MainSearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 10.h,
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 15.0),
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 2.h),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: (){},
                        icon: const Icon(
                          FontAwesomeIcons.magnifyingGlass,
                          size: 20.0,
                          color: darkGrey,
                        ),
                      ),
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 1.5.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
