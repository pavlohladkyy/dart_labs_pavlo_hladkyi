abstract class Transport {
  String name;
  double speed; // км/год
  double costPerKmPassenger; // грн/км для пасажира
  double costPerKmCargo; // грн/км для вантажу

  Transport(this.name, this.speed, this.costPerKmPassenger, this.costPerKmCargo);

  double calculateTime(double distance) {
    // Час = Відстань / Швидкість
    return distance / speed;
  }

  double calculateCostPassenger(double distance, int passengers) {
    return costPerKmPassenger * distance * passengers;
  }

  double calculateCostCargo(double distance, double cargoWeight) {
    return costPerKmCargo * distance * cargoWeight;
  }

  @override
  String toString() {
    return 'Транспортний засіб: $name, Швидкість: $speed км/год, Вартість/км пасажир: $costPerKmPassenger грн, Вартість/км вантаж: $costPerKmCargo грн';
  }
}

class Car extends Transport {
  Car() : super('Автомобіль', 80, 2.5, 1.5);
}

class Bicycle extends Transport {
  Bicycle() : super('Велосипед', 20, 0.5, 0.2);
}

class Cart extends Transport {
  Cart() : super('Віз', 10, 0.3, 0.1);
}

void main() {
  List<Transport> vehicles = [Car(), Bicycle(), Cart()];
  double distance = 100; // км
  int passengers = 2;
  double cargoWeight = 0.5; // тонни

  for (var vehicle in vehicles) {
    print(vehicle.toString());
    print('Час перевезення: ${vehicle.calculateTime(distance).toStringAsFixed(2)} год');
    print('Вартість перевезення пасажирів: ${vehicle.calculateCostPassenger(distance, passengers).toStringAsFixed(2)} грн');
    print('Вартість перевезення вантажу: ${vehicle.calculateCostCargo(distance, cargoWeight).toStringAsFixed(2)} грн');
    print('---');
  }
}