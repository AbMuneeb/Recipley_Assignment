import 'package:flutter/cupertino.dart';
import 'package:recipley_assignment/BusinessLogicModel/Enums/apistatus_anum.dart';

mixin PaginationClasses
{
  start(BuildContext context,ApiStatus status);
  updateStep(bool event,BuildContext context);
  updatedResponseAtReachedEndList();
  reachedEndList(bool reached);
}