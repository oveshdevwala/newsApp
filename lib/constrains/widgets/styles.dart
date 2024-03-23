import 'package:flutter/material.dart';

InputDecoration myInputDecoration(
      {required String hint, required IconData icon}) {
    return InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide()));
  }