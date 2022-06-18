import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Pharmacy{
  String id;
  String pharmName;
  String pharmEmail;
  String phone;
  String ville;
  String adressemap;
  bool CNAS;
  bool CASNOS;
  bool ouvert;



  Pharmacy( this.id ,this.pharmName, this.pharmEmail, this.phone, this.ville, this.adressemap, this.CNAS, this.CASNOS, this.ouvert);

  //------------------------------------------------------
  Map<String, dynamic> toJson() {

    return {
      'id':id,
      'pharmName': pharmName,
      'pharmEmail':pharmEmail,
      'phoneNumber': phone,
      'ville': ville,
      'adressemap': adressemap,
      'CNAS': CNAS,
      'CASNOS': CASNOS,
      'ouvert': ouvert,

    };
  }

//--------------------------------------------------------
  factory Pharmacy.fromJson(Map<String, dynamic> json){
    return Pharmacy(
      json['id'],
        json['nom'],
        json['pharmEmail'],
        json['phone'],
        json['ville'],
        json['adressemap'],
        json['CNAS'],
        json['CASNOS'],
        json['ouvert']
    );
  }
}
