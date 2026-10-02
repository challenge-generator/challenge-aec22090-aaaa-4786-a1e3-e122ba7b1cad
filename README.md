# Implementación y diagnóstico de pruebas funcionales automatizadas en aplicaciones móviles

En el contexto de desarrollo móvil avanzado, el equipo necesita mejorar la eficiencia y calidad del código mediante la implementación de pruebas funcionales automatizadas y el uso de técnicas de perfilamiento para diagnosticar y corregir bugs. La aplicación en cuestión es una plataforma de comercio electrónico que requiere alta disponibilidad y rendimiento. Los actores involucrados son el desarrollador móvil, el equipo de QA, y los usuarios finales. La aplicación debe manejar un volumen de 10 000 transacciones por hora durante las horas pico con una latencia máxima de 200ms. Los errores comunes incluyen fallos de sincronización en las transacciones asíncronas y cuellos de botella en el rendimiento.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | técnicas de pruebas funcionales automatizadas y perfilamiento de aplicaciones |
| **Nivel** | master-l1 |
| **Tipo** | practical |
| **Tiempo estimado** | 20 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y generará un ZIP listo para usar.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Un IDE o editor de código.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y generará un archivo ZIP descargable. Descárgalo y extráelo en la carpeta donde quieras trabajar.
- Verifica que el proyecto arranca sin errores.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no genera el ZIP automáticamente al terminar el análisis, escríbele: "genera el ZIP ahora".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Configuración del entorno de pruebas

**Objetivo:** Configurar un entorno que permita ejecutar pruebas funcionales automatizadas en diferentes dispositivos.

**Tiempo estimado:** 5 horas

**Instrucciones:**

- Identificar las necesidades del entorno de pruebas para la aplicación de comercio electrónico.
- Configurar servicios que corran pruebas funcionales automatizadas en al menos tres dispositivos diferentes.
- Verificar que el entorno está correctamente configurado y que las pruebas se ejecutan sin errores.

**Entregable:** Entorno de pruebas configurado y funcional.

<details>
<summary>Pistas de conocimiento</summary>

- Considera las diferentes configuraciones de dispositivos y sistemas operativos.
- Piensa en la integración continua y cómo automatizar el proceso de pruebas.

</details>

### Fase 2: Implementación de pruebas funcionales utilizando BDD

**Objetivo:** Implementar pruebas funcionales automatizadas utilizando la metodología BDD.

**Tiempo estimado:** 6 horas

**Instrucciones:**

- Diseñar y escribir pruebas funcionales para las funcionalidades críticas de la aplicación utilizando Gherkin.
- Ejecutar las pruebas y verificar que se cumplan los criterios de aceptación.
- Documentar los resultados y anylizar cualquier fallo detectado.

**Entregable:** Conjunto de pruebas funcionales automatizadas utilizando BDD.

<details>
<summary>Pistas de conocimiento</summary>

- Revisa la sintaxis y estructura de Gherkin para escribir pruebas claras y comprensibles.
- Considera la reutilización de pasos y la modularidad en tus pruebas.

</details>

### Fase 3: Diagnóstico de bugs utilizando el perfilador de aplicaciones

**Objetivo:** Utilizar técnicas de perfilamiento para diagnosticar y corregir bugs en la aplicación.

**Tiempo estimado:** 5 horas

**Instrucciones:**

- Identificar áreas de la aplicación que pueden tener problemas de rendimiento o bugs.
- Usar el perfilador para analizar el comportamiento de la aplicación durante la ejecución de las pruebas funcionales.
- Documentar los hallazgos y proponer soluciones para corregir los bugs detectados.

**Entregable:** Informe de diagnóstico con recomendaciones para corregir bugs.

<details>
<summary>Pistas de conocimiento</summary>

- Familiarízate con las métricas y herramientas de perfilamiento disponibles.
- Considera el impacto de las correcciones en el rendimiento y la estabilidad de la aplicación.

</details>

### Fase 4: Refactorización y optimización del código

**Objetivo:** Refactorizar y optimizar el código basado en los hallazgos del perfilador.

**Tiempo estimado:** 4 horas

**Instrucciones:**

- Revisar el código y realizar cambios necesarios para corregir los bugs y mejorar el rendimiento.
- Ejecutar nuevamente las pruebas funcionales para verificar que los cambios no introducen nuevos errores.
- Documentar los cambios realizados y su impacto en el rendimiento y estabilidad de la aplicación.

**Entregable:** Código refactorizado y optimizado con pruebas funcionales actualizadas.

<details>
<summary>Pistas de conocimiento</summary>

- Sigue las mejores prácticas de refactorización para asegurar que el código sea legible y mantenible.
- Verifica que los cambios realizados no afecten negativamente otras partes de la aplicación.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué son las pruebas funcionales automatizadas y cómo se implementan utilizando BDD?
- **paraQueSirve**: ¿Para qué sirve el perfilamiento de aplicaciones y cómo puede ayudar a mejorar el código?
- **comoSeUsa**: ¿Cómo se configura un entorno de pruebas funcionales automatizadas en diferentes dispositivos?
- **erroresComunes**: ¿Cuáles son los errores comunes que pueden ocurrir durante la implementación de pruebas funcionales y cómo se pueden evitar?
- **queDecisionesImplica**: ¿Qué decisiones implica el uso de técnicas de perfilamiento para diagnosticar y corregir bugs en una aplicación?

## Criterios de Evaluacion

- Configurar correctamente el entorno de pruebas en diferentes dispositivos.
- Implementar pruebas funcionales automatizadas utilizando BDD.
- Diagnosticar y corregir bugs utilizando técnicas de perfilamiento.
- Refactorizar y optimizar el código basado en los hallazgos del perfilador.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT). Devuelve un ZIP con el proyecto. Sirve si no tenes un agente en el IDE.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
flutter pub get && flutter analyze
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
