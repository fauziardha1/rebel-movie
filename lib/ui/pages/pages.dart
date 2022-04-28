import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebel_movie/bloc/similar/similar_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../bloc/now_playing/nowplaying_bloc.dart';
import '../../models/now_playing.dart';
import '../shared/shared.dart';
import '../widgets/widgets.dart';

part 'starting_page.dart';
part 'movie_detail_page.dart';
