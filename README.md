# ALU32 – Parcial en Nand2Tetris

### Integrantes del equipo

* William Andrés Henao López
* Carlos David Sanchez Soto
* Laura Sofía Jiménez Paris

## Descripción

Este proyecto implementa una **ALU de 32 bits** construida a partir de dos mitades de 16 bits.
Mantiene la misma semántica de control que la **ALU16** del curso, pero añade **banderas extra** para manejar carry y overflow en operaciones de suma.

## Funcionalidad

La ALU32 recibe dos operandos de 32 bits (`x`, `y`) y un conjunto de señales de control (`zx, nx, zy, ny, f, no`).
Dependiendo de dichas señales, la ALU puede:


* Forzar entradas a cero (`zx`, `zy`).
* Negar entradas (`nx`, `ny`).
* Calcular `x & y` o `x + y` según `f`.
* Negar el resultado final (`no`).


Además, la ALU produce cuatro banderas de estado:

* `zr` → 1 si la salida es cero.
* `ng` → 1 si la salida es negativa (bit 31 = 1 en complemento a dos).
* `cout` → carry-out de la suma de 32 bits (válido solo si `f=1`).
* `ovf` → indica si ocurrió un desbordamiento aritmético en suma con complemento a dos (válido solo si `f=1`).

## Entradas y salidas

### Entradas

* `x[32]` → Operando A.
* `y[32]` → Operando B.
* `zx` → 1 → fuerza `x=0`.
* `nx` → 1 → fuerza `x=¬x`.
* `zy` → 1 → fuerza `y=0`.
* `ny` → 1 → fuerza `y=¬y`.
* `f` → 0 → `x & y`; 1 → `x + y`.
* `no` → 1 → `out = ¬out`.

### Salidas

* `out[32]` → Resultado de la operación.
* `zr` → 1 si `out==0`.
* `ng` → 1 si `out < 0`.
* `cout` → Carry-out de la suma de 32 bits.
* `ovf` → Overflow de suma en complemento a dos.

## Estructura del diseño

* **Pre-procesamiento de entradas (x, y)**:

  * `zx` y `zy` permiten anular las entradas.
  * `nx` y `ny` permiten negarlas.

* **Ruta AND**:

  * AND paralelo por mitades de 16 bits.

* **Ruta ADD**:

  * Se usa un **sumador de 16 bits con carry-in y carry-out (`Add16CF`)**.
  * Se hace ripple-carry entre la parte baja (`[0..15]`) y la alta (`[16..31]`).
  * El acarreo de la parte baja solo se propaga si `f=1`.

* **Selección por `f`**:

  * Si `f=0` → se usa `x & y`.
  * Si `f=1` → se usa `x + y`.

* **Negación de salida (`no`)**:

  * Negación condicional posterior a la operación principal.

* **Cálculo de banderas**:

  * `zr`: se obtiene verificando si todos los bits de salida son cero.
  * `ng`: se toma directamente del bit 31 del resultado.
  * `cout`: carry final de la suma de 32 bits (salida de la parte alta).
  * `ovf`: se activa si al sumar dos números con el mismo signo, el resultado cambia de signo.

## Decisiones de diseño

1. **Extensión a 32 bits por mitades**

   * Se dividieron las entradas en dos mitades (`[0..15]` y `[16..31]`).
   * Esto permitió reutilizar `Mux16`, `And16`, `Not16`, `Add16CF`, etc.

2. **Carry ripple real de 32 bits**

   * La suma propaga el acarreo desde la parte baja a la alta.
   * El acarreo final (`cout`) se expone como salida adicional.

3. **Overflow explícito**

   * A diferencia de la ALU16 estándar, se implementó un flag `ovf`.
   * Este se activa únicamente cuando el resultado de la suma no cabe en el rango representable en complemento a dos.

4. **Compatibilidad con la ALU16**

   * Las señales de control (`zx, nx, zy, ny, f, no`) mantienen la semántica de la ALU16.
   * Se añadieron `cout` y `ovf` como extensiones extra.

## Pruebas realizadas

* **Operaciones lógicas** (`AND`, negaciones de entrada y salida).
* **Operaciones aritméticas** (`+`, con y sin carry).
* **Casos especiales**:

  * `0 + 0 → zr=1`.
  * Suma de valores positivos que produce negativo → `ovf=1`.
  * Suma de valores negativos que produce positivo → `ovf=1`.
  * Sumas con carry propagado entre mitades → `cout=1`.

