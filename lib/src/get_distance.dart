import 'dart:math';

import 'package:vector_math/vector_math.dart';

class Distance
{
  static double getDistance(double userLat, double userLong, double companyLat, double companyLong, DistanceIn unit)
  {
    if ((userLat == companyLat) && (userLong == companyLong)) {
      return 0;
    } else {
      double theta = (userLong - companyLong);
      print('t1 $theta');
      double dist = ((sin(radians(userLat)) * sin(radians(companyLat))) + ((cos(radians(userLat)) * cos(radians(companyLat))) * cos(radians(theta))));
      print('t2 $dist');
      dist = acos(dist);
      print('t3 $dist');
      dist = degrees(dist);
      print('t4 $dist');
      dist = ((dist * 60) * 1.1515);
      print('t5 $dist');
      if (unit == DistanceIn.kilometer) {
        dist = (dist * 1.609344);
      }
      else if (unit == DistanceIn.meters) {
        dist = (dist * 1.609344)*1000;
      }else {
        if (unit == DistanceIn.nauticalMiles) {
          dist = (dist * 0.8684);
        }
      }
      return dist;
    }
  }
}
enum DistanceIn
{
  kilometer,
  nauticalMiles,
  meters
}