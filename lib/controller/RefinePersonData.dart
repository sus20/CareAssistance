import 'package:refresh/models/PersonData.dart';

class RefinePersonData {
  static bool isMale(int index) {
    return PersonData.personList.elementAt(index).containsValue("male");
  }

  static bool isFemale(int index) {
    return PersonData.personList.elementAt(index).containsValue("female");
  }

  static bool isInInnerhalb(int index, int distance) {
    return (int.parse(
            PersonData.personList.elementAt(index)["distanceFromCityCenter"]) <
        distance);
  }

  static bool isAroundAlt(int index, int age) {
    return int.parse(PersonData.personList.elementAt(index)["age"]) < age;
  }

  static bool refineDataBasedOnOptions(
      i, _checkBox1, _checkBox2, _checkBox3, _checkBox4, km, age) {
    List<bool> isPersonSelected = [];
    bool personSelected = true;

    if (_checkBox1 && _checkBox2)
      isPersonSelected.add(true);
    else {
      if (_checkBox1) isPersonSelected.add(isMale(i));
      if (_checkBox2) isPersonSelected.add(isFemale(i));
    }

    if (_checkBox3) isPersonSelected.add(isInInnerhalb(i, km));
    if (_checkBox4) isPersonSelected.add(isAroundAlt(i, age));

    for (int j = 0; j < isPersonSelected.length; j++) {
      personSelected = personSelected && isPersonSelected[j];
    }

    if (isPersonSelected.length == 0) return false;
    return personSelected;
  }
}
