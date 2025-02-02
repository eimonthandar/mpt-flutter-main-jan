class Grid {
  const Grid._();
  static final Map<double, double> _gridFactors = {
    0.25: 2,
    0.5: 4,
    1: 8,
    2: 16,
    3: 24,
    4: 32,
    5: 40,
    6: 48,
    7: 56,
    8: 64,
  };

  static double grid(double gridFactor) {
    if (_gridFactors.containsKey(gridFactor)) {
      return _gridFactors[gridFactor]!;
    }
    return 0; // Default value for unknown grid factors
  }

  static const double zero = 0;
  static const double quarter = 2;
  static const double half = 4;
  static const double one = 8;
  static const double two = 16;
  static const double three = 24;
  static const double four = 32;
  static const double five = 40;
  static const double six = 48;
  static const double seven = 56;
  static const double eight = 64;
}

class BorderRadiusSize {
  const BorderRadiusSize._();
  static const double normal = 8;
  static const double medium = 16;
}

class Dimen {
  const Dimen._();
  static const double buttonTextSize = 16;
  static const double buttonWidth = double.infinity;
  static const double buttonHeight = 48;
  static const double imageHeight = 300;
}
