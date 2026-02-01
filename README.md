# Bathurst Race Pace Analysis

## 📊 Visualización de Análisis de Race Pace

Sistema de análisis de ritmo de carrera para las sesiones de práctica de Bathurst.

### 🚀 Cómo usar

1. **Abrir el archivo**: Simplemente abre `index_standalone.html` en tu navegador web favorito
2. **No requiere instalación**: Todo está autocontenido en un solo archivo HTML
3. **No requiere servidor**: Funciona directamente desde el sistema de archivos

### 📈 Características

- **Race Pace Global**: Promedio ponderado de todos los stints válidos (5+ vueltas)
- **Race Pace Recent**: Promedio ponderado de los últimos 3 stints válidos
  - Último stint: 50%
  - Penúltimo: 30%
  - Antepenúltimo: 20%
- **Diferencia (Δ)**: Muestra si el piloto está mejorando (verde) o empeorando (rojo)
- **Filtro por inscritos**: Ver solo pilotos registrados en el roster
- **Búsqueda**: Buscar pilotos por nombre
- **Desglose de stints**: Click en cualquier piloto para ver sus stints individuales
- **Stints inválidos**: Marcados con ⚠️ INVALID (< 5 vueltas)

### 📋 Columnas de la tabla

- **# Reg**: Ranking entre inscritos
- **Driver**: Nombre del piloto
- **Laps**: Total de vueltas completadas
- **Status**: Estado de vueltas mínimas (50 laps)
- **Clean %**: Porcentaje de vueltas limpias
- **Race Pace Global**: Ritmo promedio de todos los stints válidos
- **Race Pace Recent**: Ritmo promedio de últimos 3 stints (muestra mejora reciente)
- **Δ**: Diferencia entre recent y global (negativo = mejorando)
- **Best Lap**: Mejor vuelta individual
- **Consistency**: Desviación estándar de vueltas limpias
- **Sessions**: Número de sesiones y stints

### 🎯 Indicadores visuales

- **Verde** en Δ: El piloto está mejorando su ritmo
- **Rojo** en Δ: El piloto está empeorando su ritmo
- **Rojo en fila**: Piloto > 3 segundos más lento que el líder
- **Stints con fondo rojo**: Stint inválido (< 5 vueltas)

### 📅 Datos incluidos

- 6 sesiones de práctica
- 81 pilotos inscritos en roster
- Total: 99 pilotos (incluye no inscritos que participaron)
- Análisis de 716 stints
- 4,225 vueltas totales procesadas

---

**Fecha de generación**: Enero 2026  
**iRacing México - Bathurst 12 Hours Practice**

