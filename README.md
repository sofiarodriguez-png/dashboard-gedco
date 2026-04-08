# Dashboard GEDCO Consumer

Dashboard interactivo para visualizar métricas de GEDCO Consumer en MLA (Argentina) y MLM (México).

## 🔄 Actualización Automática

Este dashboard se actualiza automáticamente cada 6 horas con los datos más recientes de BigQuery.

## 📊 Ver Dashboard

👉 **[Ver Dashboard en Vivo](https://sofiarodriguez-png.github.io/dashboard-gedco/)**

## 📈 Métricas Incluidas

- **Clientes Asignados**: Total de clientes únicos asignados
- **Cobertura Total**: % de clientes con al menos una gestión
- **Cobertura CPC**: % de clientes con acción CPC
- **Gestiones por Usuario**: Promedio de gestiones por cliente
- **% Clientes Únicos Originados**: % de clientes que originaron crédito
- **Originados Total**: Total de créditos originados
- **% Clientes VTA**: % de clientes que originaron vía VTA
- **Monto Atribuido VTA**: % del monto total atribuido a VTA

### Métricas Voice Bot

- **Cobertura VB**: Cobertura del Voice Bot
- **Clientes Únicos Originados TEL/VB**
- **Monto Originado TEL/VB**
- **Monto Originado VB/TOTAL**
- **Clientes Únicos Originados VB/TOTAL**

## 🔍 Filtros Disponibles

- País (MLA / MLM)
- Tipo de Producto (DINERO_PLUS, BNPL, PL, FASTCHAT, OTRO)
- Tipo de Segmento (REPEATS, ACTIVATION, CHECKDROP, OTRO)
- Período (selector de mes)

## 📊 Gráficos

1. **Evolución de Cobertura y CPC**: Últimos 6 meses
2. **Monto Atribuido VTA**: Evolución histórica

## 🔧 Fuente de Datos

- **Tabla BigQuery**: `meli-bi-data.SBOX_COLLECTIONSDA.TLV_CONSUMER_BASE_KPIS_FINAL`
- **Filtros**: `LISTA_GESTION = 1`
- **Agencias**: GEDCO (MLA), GEDCO + GEDCO_MLM (MLM)
- **Nota**: Se excluye FASTCHAT para MLM

---

*Última actualización: Automática cada 6 horas*
