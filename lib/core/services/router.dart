import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viewing_nz/core/navigation/navigation_screen.dart';
import 'package:viewing_nz/core/services/route_transition.dart';
import 'package:viewing_nz/core/services/routes.dart';
import 'package:viewing_nz/core/widgets/full_screen_image_view.dart';
import 'package:viewing_nz/core/widgets/image_list_view.dart';
import 'package:viewing_nz/features/auth/views/sign_in_screen.dart';
import 'package:viewing_nz/features/auth/views/sign_up_screen.dart';
import 'package:viewing_nz/features/chat/views/chat_screen.dart';
import 'package:viewing_nz/features/chat/views/single_chat_screen_ui.dart';
import 'package:viewing_nz/features/home/views/home_screen.dart';
import 'package:viewing_nz/features/home/widgets/home_advanced_filter.dart';
import 'package:viewing_nz/features/profile/views/my_profile_screen.dart';
import 'package:viewing_nz/features/saved_search/views/saved_search_screen.dart';
import 'package:viewing_nz/features/viewings/views/request_viewing_screen.dart';
import 'package:viewing_nz/core/widgets/property_details_screen.dart';
import 'package:viewing_nz/features/notification/views/notification_screen.dart';
import 'package:viewing_nz/features/viewings/views/saved_properties_screen.dart';
import 'package:viewing_nz/features/viewings/views/viewing_main_screen.dart';
import 'package:viewing_nz/features/viewings/views/viewings_screen.dart';

part 'router.main.dart';
