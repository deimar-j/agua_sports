import java.util.InputMismatchException;
import java.util.Scanner;

class Main {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int numMeses = 0;
        double montoTotal = 0;

        // Pedir al usuario el número de meses y el monto total
        while (true) {
            try {
                System.out.print("Ingrese el número de meses: ");
                numMeses = scanner.nextInt();
                if (numMeses <= 0) {
                    throw new InputMismatchException("El número de meses debe ser mayor que cero.");
                }
                break;
            } catch (InputMismatchException e) {
                System.out.println("Error: Debes ingresar un número entero válido.");
                scanner.nextLine(); // Limpiar el buffer del scanner
            }
        }

        while (true) {
            try {
                System.out.print("Ingrese el monto total: ");
                montoTotal = scanner.nextDouble();
                if (montoTotal <= 0) {
                    throw new InputMismatchException("El monto total debe ser mayor que cero.");
                }
                break;
            } catch (InputMismatchException e) {
                System.out.println("Error: Debes ingresar un número válido.");
                scanner.nextLine(); // Limpiar el buffer del scanner
            }
        }

        // Calcular el monto a pagar por mes
        double montoPorMes = montoTotal / numMeses;

        // Imprimir el calendario de pagos
        System.out.println("Calendario de Pagos:");
        System.out.println("--------------------");
        for (int i = 1; i <= numMeses; i++) {
            System.out.printf("Mes %d: R$%.2f%n", i, montoPorMes);
        }

        // Cerrar el scanner
        scanner.close();
    }
}