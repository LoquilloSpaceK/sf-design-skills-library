# Guía de uso — shadcn/ui para Pillaki

## En qué proyectos usarlo

shadcn/ui es una buena base para:

- webs corporativas modernas;
- portales privados de clientes;
- dashboards;
- cotizadores;
- formularios de diagnóstico;
- onboarding;
- paneles administrativos;
- micrositios comerciales;
- sistemas internos;
- interfaces de seguimiento.

## Componentes que conviene priorizar

### Formularios
- Button
- Input
- Textarea
- Select
- Checkbox
- Radio Group
- Switch
- Form
- Label
- Calendar / Date Picker

### Navegación
- Navigation Menu
- Tabs
- Breadcrumb
- Pagination
- Sidebar
- Dropdown Menu
- Command

### Feedback y estados
- Alert
- Alert Dialog
- Dialog
- Drawer / Sheet
- Toast / Sonner
- Progress
- Skeleton
- Tooltip

### Datos y paneles
- Card
- Table
- Data Table patterns
- Badge
- Accordion
- Collapsible
- Chart integrations cuando correspondan

## Patrón Pillaki recomendado

1. Elegir solo los componentes necesarios para el proyecto.
2. Incorporarlos al repositorio del cliente como código propio.
3. Reemplazar colores, tipografía, radios, spacing y estados por el sistema visual del cliente.
4. Eliminar variantes y dependencias no usadas.
5. Revisar mobile, teclado, foco, contraste y lectores de pantalla.
6. Medir bundle y rendimiento antes de producción.
7. Documentar cualquier adaptación importante.

## Regla visual

El usuario final no debería sentir que está viendo "una web shadcn". Debe sentir que está viendo la identidad del cliente. shadcn/ui es la estructura técnica, no la marca.

## Regla de mantenimiento

Cuando un componente ya está copiado y adaptado dentro de un proyecto, tratarlo como código propio del proyecto. No actualizarlo a ciegas desde upstream. Comparar cambios, probar y migrar de forma consciente.

## Uso con Next.js / React

Encaja especialmente bien con proyectos React y Next.js modernos. Para nuevas implementaciones, revisar siempre la documentación vigente del upstream porque la CLI, los registries y las dependencias pueden cambiar con el tiempo.

## Decisión Pillaki

**Sí usar. Prioridad alta.**

Es una base más flexible que una librería visual cerrada porque permite adaptar completamente los componentes a cada cliente y construir una biblioteca propia reutilizable.