
import 'package:cece/core/app_export.dart';
import 'package:flutter/material.dart';

DataRow conferenceDataRow() {
  return DataRow(
    cells: [

      buildCell(Icons.title_outlined, "Test Text! Test Text!"),
      buildCell(Icons.date_range,
          "20/10/2023 10.50Am"),
      buildCell(
          Icons.date_range, "20/10/2023 10.50Am"),

    ],
  );
}
DataRow conferenceDataRow2() {
  return DataRow(
    cells: [
      buildCell(Icons.title_outlined, "Test Text! Test Text!"),
      buildCell(Icons.title_outlined," Test Text! Test Text!"),
      buildCell(Icons.title_outlined, "Test Text! Test Text!"),
      buildCell(Icons.date_range,
          "20/10/2023 10.50Am"),
      buildCell(
          Icons.date_range, "20/10/2023 10.50Am"),
    ],
  );
}
DataRow conferenceDataRow3() {
  return DataRow(
    cells: [
      buildCell(Icons.title_outlined, "Test Text! Test Text!"),
      buildCell(Icons.title_outlined, "Test Text! Test Text!"),
      buildCell(Icons.title_outlined, "Test Text! Test Text!"),
      buildCell(Icons.title_outlined, "Test Text! Test Text!"),

      buildCell(Icons.date_range,
          "20/10/2023 10.50Am"),
      buildCell(
          Icons.date_range, "20/10/2023 10.50Am"),
    ],
  );
}
DataRow conferenceDataRow4() {
  return DataRow(
    cells: [
      buildCell(Icons.title_outlined, "Test Text! Test Text!"),
      buildCell(Icons.title_outlined," Test Text! Test Text!"),
      buildCell(Icons.title_outlined, "Test Text! Test Text!"),
      buildCell(Icons.title_outlined, "Test Text! Test Text!"),

      buildCell(Icons.date_range,
          "20/10/2023 10.50Am"),
      buildCell(
          Icons.date_range, "20/10/2023 10.50Am"),
    ],
  );
}
DataRow conferenceDataRow5() {
  return DataRow(
    cells: [
      buildCell(Icons.title_outlined, "Test Text! Test Text!"),
      buildCell(Icons.title_outlined," Test Text! Test Text!"),
      buildCell(Icons.title_outlined, "Test Text! Test Text!"),
      buildCell(Icons.title_outlined, "Test Text! Test Text!"),

      buildCell(Icons.date_range,
          "20/10/2023 10.50Am"),
      buildCell(
          Icons.date_range, "20/10/2023 10.50Am"),
    ],
  );
}

DataCell buildCell(IconData icon, String text) {
  return DataCell(
    SizedBox(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: ColorConstant.primaryColor,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Icon(
              icon,
              size: 16,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
  );
}