import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double? increment(
  double price,
  int quantity,
) {
  //SUBTOTAL

  double tempprice = 0.0;
  int tempquantity = 0;
  double totalpayment = 0.0;

  tempprice = price;
  tempquantity = quantity;

  totalpayment = tempquantity * tempprice;
  return totalpayment;
}

double? newCustomFunction(
  double allProdtotal,
  double shippingfee,
) {
  return allProdtotal + shippingfee;
}

double? totalpayment(
  double subtotal,
  double shipFee,
) {
  double tempsubtotal = 0.0;
  double tempshipFee = 0.0;
  double totalpayment = 0.0;

  tempsubtotal = subtotal;
  tempshipFee = shipFee;

  totalpayment = tempsubtotal + tempshipFee;
  return totalpayment;
}

double? checkouttotal(List<double>? prod1) {
  // math expression that adds price but price that will be pass can be one value only
  double price = 0.0;
  double tempprice = 0.0;
  int len = 0;
  if (prod1 != null && prod1.isNotEmpty) {
    len = prod1.length;
    if (len >= 2) {
      int i = 0;
      while (i < len) {
        tempprice = prod1[i];
        price = price + tempprice;
        i++;
      }
    } else {
      price = prod1[0];
    }
  }
  return price;
}

double? totalRating(List<double>? ratings) {
  double? averageRating = 0.0;
  if (ratings != null && ratings.isNotEmpty) {
    int len = ratings.length;
    if (len >= 1) {
      int i = 0;
      double temp = 0;
      while (i < len) {
        temp += ratings[i]; // Accumulate values in the list
        i++;
      }
      averageRating = temp / len; // Divide the total by the number of ratings
    } else {
      averageRating =
          ratings[0]; // Handle the case when there's only one element
    }
  }
  return averageRating;
}
