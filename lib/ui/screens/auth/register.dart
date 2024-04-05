part of '../screens.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool value = true;

  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();
  FocusNode f5 = FocusNode();
  FocusNode f6 = FocusNode();

  @override
  void dispose() {
    f1.dispose();
    f2.dispose();
    f3.dispose();
    f4.dispose();
    f5.dispose();
    f6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterContImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text("Register Page"),
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
          child: GetBuilder<RegisterContImp>(builder: (cont) {
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
                              "Get Started!",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .displaySmall,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Text(
                                "Create an account to continue..",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleSmall
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      AuthInput(
                        controller: cont.username,
                        hintText: "Username",
                        isNumber: false,
                        isPassword: false,
                        suffixIcon: const Icon(Icons.person_outline),
                        valid: (val) {
                          return validInput(val!, 5, 100, "username");
                        },
                        focusNode: f1,
                        onFieldSubmitted: (val) {
                          f1.unfocus();
                          FocusScope.of(context).requestFocus(f2);
                        },
                      ),
                      SizedBox(height: 3.h),
                      AuthInput(
                        controller: cont.email,
                        hintText: "Email",
                        isNumber: false,
                        isPassword: false,
                        suffixIcon: const Icon(Icons.email_outlined),
                        valid: (val) {
                          return validInput(val!, 5, 100, "email");
                        },
                        focusNode: f2,
                        onFieldSubmitted: (val) {
                          f2.unfocus();
                          FocusScope.of(context).requestFocus(f3);
                        },
                      ),
                      SizedBox(height: 3.h),
                      AuthInput(
                        controller: cont.mobile,
                        hintText: "Mobile",
                        isNumber: false,
                        isPassword: false,
                        suffixIcon: const Icon(Icons.phone_android),
                        valid: (val) {
                          return validInput(val!, 5, 100, "phone");
                        },
                        focusNode: f3,
                        onFieldSubmitted: (val) {
                          f3.unfocus();
                          FocusScope.of(context).requestFocus(f4);
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
                        focusNode: f4,
                        suffixIcon: GestureDetector(
                          onTap: (){
                            cont.showPassword();
                          },
                          child: cont.isShowPassword ? const Icon(Icons.visibility_outlined) : const Icon(Icons.visibility_off_outlined),
                        ),
                        onFieldSubmitted: (val) {
                          f4.unfocus();
                          FocusScope.of(context).requestFocus(f5);
                        },
                      ),
                      SizedBox(height: 3.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: value,
                            isError: false,
                            onChanged: (value) {
                              setState(() {
                                this.value = value!;
                              });
                            },
                          ),
                          SizedBox(
                            width: 83.w,
                            child: const Text(
                              "By Creating an account, you are agree to our terms and conditions",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 80.w,
                            child: ElevatedButton(
                              focusNode: f5,
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
                                "Continue",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(color: white),
                              ),
                              onPressed: () {
                                cont.register();
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              "Already Have an account? ",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleSmall
                          ),
                          TextButton(
                            onPressed: () {
                              Get.back();
                              Get.toNamed(screenLogin);
                            },
                            child: Text(
                                "Login",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: darkBlue)
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
