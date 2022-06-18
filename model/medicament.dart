import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Medicament{
  String nom;
  String dosage;
  String quantite;


  Medicament(this.nom, this.dosage, this.quantite);

  //------------------------------------------------------
  Map<String, dynamic> toJson() {

    return {
      'nom': nom,
      'dosage': dosage,
      'quantite': quantite,
    };
  }

  //--------------------------------------------------------

  factory Medicament.fromJson(Map<String, dynamic> json){
    return Medicament(
      json['nom'],
      json['dosage'],
      json['quantite'],
    );
  }
}
