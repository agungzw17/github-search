import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/models/http_exception.dart';

import '../../blocs/search_bloc.dart';
import '../../models/search_github_item.dart';
import '../../shared/shared.dart';
import '../widgets/widgets.dart';

part 'search_page.dart';