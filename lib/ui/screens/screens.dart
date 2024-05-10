import 'package:airbnb/core/class/request_status.dart';
import 'package:airbnb/logic/auth/profile.dart';
import 'package:airbnb/logic/auth/register.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:introduction_slider/source/presentation/pages/introduction_slider.dart';
import 'package:introduction_slider/source/presentation/widgets/background_decoration.dart';
import 'package:introduction_slider/source/presentation/widgets/buttons.dart';
import 'package:introduction_slider/source/presentation/widgets/dot_indicator.dart';
import 'package:introduction_slider/source/presentation/widgets/introduction_slider_item.dart';
import 'package:readmore/readmore.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../core/functions/validator.dart';
import '../../helpers/helpers.dart';
import '../../logic/auth/login.dart';
import '../../logic/cars/cars.dart';
import '../../logic/home/landing.dart';
import '../../logic/main/home.dart';
import '../../logic/units/units.dart';
import '../widgets/widgets.dart';

part 'home/home.dart';

part 'auth/register.dart';
part 'auth/login.dart';

part 'auth/reset_password.dart';
part 'auth/otp_code.dart';
part 'auth/new_password.dart';

part 'auth/profile.dart';

part 'main/home.dart';
part 'main/home_page.dart';
part 'main/account_page.dart';

part 'unit/view.dart';
part 'unit/popular.dart';
part 'unit/recommended.dart';

part 'cars/home.dart';
part 'cars/view.dart';
