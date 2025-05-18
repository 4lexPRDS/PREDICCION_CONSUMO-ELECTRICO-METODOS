
# 🔌 Proyecto: Predicción del Consumo Energético usando Interpolación Numérica

Este proyecto tiene como objetivo estimar el consumo energético a partir de datos históricos utilizando métodos de interpolación como la **interpolación lineal**, **interpolación polinómica (cuadrática y cúbica)** y **polinomio de Lagrange**. Se diseñó como parte de una asignatura de Métodos Numéricos con enfoque práctico y académico.

## 📌 Objetivos

- Aplicar métodos numéricos para estimar valores faltantes o futuros en una serie de datos.
- Comparar distintos modelos de interpolación.
- Visualizar y validar los resultados a partir de datos simulados o reales de consumo energético.

---

## ⚙️ Requisitos

Este proyecto fue desarrollado principalmente en **MATLAB**, pero puede adaptarse fácilmente a otros entornos como Python o Octave.

### Dependencias en MATLAB
- `polyfit` y `polyval` para interpolación polinómica.
- `input`, `plot`, `legend` para entradas gráficas y visualización.
- Conjunto de datos tipo vector para consumo mensual.

---

## 🧪 Datos de Entrada

El programa solicita los siguientes datos:

1. **Número de puntos**: n (recomendado entre 3 y 6 para evitar errores por sobreajuste).
2. **Vectores de entrada**: 
   - `x`: meses (ej. `[1, 2, 3, 4]`)
   - `y`: consumo (kWh) (ej. `[320, 340, 370, 390]`)
3. **Valor de x a interpolar**: Por ejemplo, el mes 2.5.
4. **Selección del método**: 
   - 1 = Lineal
   - 2 = Polinómico
   - 3 = Lagrange

---

## 🚀 Cómo Ejecutarlo

1. **Abrir MATLAB u Octave**.
2. Copiar el código del script principal (interpolacion_energia.m).
3. Ejecutar el script.
4. Ingresar los datos solicitados por consola.
5. Observar los resultados estimados y el gráfico de comparación.

```matlab
>> interpolacion_energia
Ingrese el número de puntos:
Ingrese los valores de x:
Ingrese los valores de y:
Ingrese el valor de x a interpolar:
Seleccione el método de interpolación (1=Lineal, 2=Polinómico, 3=Lagrange):
```

---

## 📈 Resultados Esperados

- Valor estimado de consumo energético en el punto interpolado.
- Comparación visual mediante gráfico entre puntos reales y predicción.
- Estimación del error (opcional) con respecto a un valor real conocido.

---

## 📦 Estructura del Repositorio

```
📁 /interpolacion-energia
├── interpolacion_energia.m          # Script principal
├── pseudocodigo.txt                 # Lógica del algoritmo en pseudocódigo (PSeInt)
├── diagrama_flujo.png               # Imagen del diagrama de flujo
├── README.md                        # Manual de ejecución y descripción del proyecto
└── datos_ejemplo.mat                # Archivo opcional con datos precargados
```

---

## ❗ Limitaciones

- El método de Lagrange puede ser ineficiente para más de 6 puntos (problema de Runge).
- No considera ruido ni variaciones abruptas en los datos.
- No reemplaza modelos estadísticos más complejos como la regresión.

---

## ✅ Futuras Mejoras

- Implementar validación cruzada para evaluar precisión.
- Incluir técnicas de suavizado o regresión spline.
- Incorporar datos reales del sector energético nacional.
- Adaptar la lógica a una app con interfaz gráfica.

---

## 🤝 Contribuciones

Se aceptan sugerencias y mejoras al proyecto. Puedes enviar un **Pull Request** o crear un **Issue** para reportar errores o proponer funcionalidades.

---

## 👨‍💻 Autores

Proyecto desarrollado en pareja por:

- **Mariany Jurado**
- **Alexander Paredes**

**Estudiantes de Ingeniería en Sistemas**  
**Universidad Mariano Gálvez**
//**Guatemala • 17/05/2025**

---

## 🧠 Créditos Académicos

Este proyecto fue desarrollado como parte de la asignatura **Métodos Numéricos**, y tiene fines estrictamente académicos y formativos.
