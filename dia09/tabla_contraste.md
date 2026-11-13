# Actividad 9 – Tabla de contraste

## Comparación entre las prácticas de Agentic Coding y mi agente de revisión de código

| Práctica | ¿Mi agente la cumple? | Justificación |
|---|---|---|
| Proporcionar contexto e instrucciones claras | Parcialmente | El agente cuenta con instrucciones y prompts de revisión, pero se puede mejorar la información contextual que recibe sobre cada proyecto. |
| Utilizar pruebas automatizadas | Sí | El proyecto incluye pruebas y un sistema de evaluación con 15 casos. |
| Mantener un ciclo de retroalimentación | Parcialmente | El agente puede ejecutar pruebas mediante una herramienta MCP, pero no se comprobó un ciclo completamente automático de corrección y nueva validación. |
| Revisar los cambios antes de aceptarlos | Sí | El agente dispone de herramientas para consultar diferencias y revisar archivos. Además, los resultados se pueden verificar mediante pruebas. |
| Utilizar herramientas externas mediante MCP | Sí | Se implementó un servidor MCP con herramientas para consultar archivos, buscar código, revisar historial y ejecutar pruebas. |
| Reutilizar instrucciones y prompts | Sí | El proyecto incluye los prompts `general_code_review` y `security_review`. |
| Mantener documentación e instrucciones del proyecto | Parcialmente | El proyecto cuenta con documentación, pero no se comprobó el uso de un archivo específico como `AGENTS.md`. |
| Trabajar con varios agentes en paralelo | No | No se implementó un sistema de agentes paralelos en el proyecto. |
| Utilizar worktrees para separar tareas | No | No se documentó el uso de Git worktrees para trabajar en tareas independientes. |
| Aplicar TDD durante el desarrollo | No se evidenció | El proyecto tiene pruebas automatizadas, pero no quedó demostrado que se escribieran antes de implementar cada funcionalidad. |
| Considerar la seguridad y los riesgos | Parcialmente | Se incluyó un prompt de revisión de seguridad y pruebas de seguridad, aunque esto no demuestra que se hayan cubierto todos los riesgos posibles. |
| Mantener supervisión humana | Sí | Se ejecutaron pruebas, se revisaron resultados y se verificó el funcionamiento del agente durante el desarrollo. |

## Observación

El agente desarrollado tiene una base funcional importante porque integra Groq, MCP, herramientas de revisión y pruebas automatizadas. Sin embargo, todavía existen oportunidades de mejora en la gestión del contexto, el uso de TDD, la automatización de la retroalimentación y el trabajo paralelo.

La clasificación se basa en las funcionalidades que se implementaron y verificaron en el proyecto. No se considera que una práctica esté cumplida únicamente porque sea posible incorporarla.