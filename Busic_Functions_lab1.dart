import 'dart:math';

void main() {
  double x = 1.23;
  double y = 4.6;
  double z = 36.6;
  Function ft = outer(x, y, z);
  for (int i = 0; i < 10; i++) {
    ft();
  }
}

Function outer(double x, double y, double z) {
  Function b = (double x, double y, double z) {
    return x *
        ((y + atan(x * x + z)) / (3 + pow(sin(pow(y, 3)), 2)) +
            exp((x + z) / y));
  };
  return () {
    double numerator = (pow((x * x - z), 0.3) as double) - (pow(y + 2 * b(x, y, z), 1 / 3) as double);
    double denominator =
        1 + (x / 1) + (pow(y, 2) / 2) + (pow(z, 3) / 3);
    double a = numerator / denominator;
    print("x=$x y=$y z=$z a=$a");
    x++;
  };
}
