part of '../screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool value = true;

  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();

  @override
  void dispose() {
    f1.dispose();
    f2.dispose();
    f3.dispose();
    f4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(LoginContImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text("Login Page"),
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.chevronLeft,
            color: Colors.black,
            size: 22.sp,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: GetBuilder<LoginContImp>(builder: (cont) {
            if(cont.requestStatus == RequestStatus.loading){
              return SizedBox(
                height: 85.h,
                width: 100.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    const CircularProgressIndicator(
                      color: black,
                    ),
                  ],
                ),
              );
            }
            return Form(
              key: cont.formstate,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 5.h),
                  child: Column(
                    children: [
                      SizedBox(height: 2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 100.w,
                            height: 5.h,
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Text(
                              "Let`s Sign You In.",
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Text(
                                "Welcome back. You have been missed!",
                                style: Theme.of(context).textTheme.titleSmall
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      AuthInput(
                        controller: cont.email,
                        hintText: "Email",
                        isNumber: false,
                        isPassword: false,
                        suffixIcon: const Icon(Icons.email),
                        valid: (val) {
                          return validInput(val!, 5, 100, "email");
                        },
                        focusNode: f1,
                        onFieldSubmitted: (val) {
                          f1.unfocus();
                          FocusScope.of(context).requestFocus(f2);
                        },
                      ),
                      SizedBox(height: 3.h),
                      AuthInput(
                        controller: cont.pass,
                        hintText: "Password",
                        isNumber: false,
                        isPassword: cont.isShowPassword,
                        valid: (val) {
                          return validInput(val!, 5, 100, "password");
                        },
                        focusNode: f2,
                        suffixIcon: GestureDetector(
                          onTap: (){
                            cont.showPassword();
                          },
                          child: cont.isShowPassword ? const Icon(Icons.visibility_outlined) : const Icon(Icons.visibility_off_outlined),
                        ),
                        onFieldSubmitted: (val) {
                          f2.unfocus();
                          FocusScope.of(context).requestFocus(f3);
                        },
                      ),
                      SizedBox(height: 3.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 80.w,
                            child: ElevatedButton(
                              focusNode: f3,
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    primaryColor),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      vertical: 2.h
                                  ),
                                ),
                              ),
                              child: Text(
                                "Login",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(color: white),
                              ),
                              onPressed: () {
                                cont.login();
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                                "Not Remember Your Password?",
                                style: Theme.of(context).textTheme.bodySmall
                            ),
                            TextButton(
                              onPressed: (){
                                Get.back();
                                Get.toNamed(screenResetPassword);
                              },
                              child: Text(
                                  "Reset Password",
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: darkBlue)
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              "Don`t Have an account? ",
                              style: Theme.of(context).textTheme.titleSmall,
                          ),
                          TextButton(
                            onPressed: (){
                              Get.back();
                              Get.toNamed(screenRegister);
                            },
                            child: Text(
                                "Sign Up",
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: darkBlue),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
