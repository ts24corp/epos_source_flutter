import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:flutter/material.dart';

class PlaceTicketViewModel extends ViewModelBase {
  BuildContext context;

List<dynamic> placeList = [
{
  'id': 1,
  'placeName': 'Hải Phòng',
  'status': true,
},
{
  'id': 2,
  'placeName': 'Quảng Nam',
  'status': true,
},
{
  'id': 3,
  'placeName': 'Đà Nẵng',
  'status': false,
},

{
  'id': 4,
  'placeName': 'Đà lạt',
  'status': false,
},

{
  'id': 5,
  'placeName': 'Vũng tàu',
  'status': true,
},
{
  'id': 6,
  'placeName': 'Phú Quốc',
  'status': false,
},
{
  'id': 7,
  'placeName': 'Ninh Bình',
  'status': true,
},
];


}