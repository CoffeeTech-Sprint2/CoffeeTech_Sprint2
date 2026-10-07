# ☕ CoffeeTech — Sistema de Monitoramento de Solo para Cafeicultura

**Projeto de Inovação (PI) · 1º Semestre de Análise e Desenvolvimento de Sistemas (ADS)**

[![Turma](https://img.shields.io/badge/turma-1ADSA-blue)](#)
[![Grupo](https://img.shields.io/badge/grupo-04-success)](#)
[![Semestre](https://img.shields.io/badge/semestre-2026.2-lightgrey)](#)
[![Progresso](https://img.shields.io/badge/progresso-40%25-yellow)](#-progresso-dos-entregáveis)

**Faculdade:** SPTech (São Paulo Tech School)

---

## 📑 Sumário

- [Sobre o projeto](#-sobre-o-projeto)
- [Funcionalidades](#-funcionalidades)
- [Tecnologias e hardware](#️-tecnologias-e-hardware)
- [Escopo do protótipo](#-escopo-do-protótipo)
- [Arquitetura da solução](#-arquitetura-da-solução)
- [Entregáveis](#-entregáveis)
- [Progresso dos entregáveis](#-progresso-dos-entregáveis)
- [Integrantes](#-integrantes)
- [Estrutura do repositório](#️-estrutura-do-repositório)

---

## 🎯 Sobre o projeto

O agronegócio é fundamental para a economia brasileira, e o café Arábica possui grande relevância no setor. Contudo, a falta de dados precisos sobre a umidade do solo faz com que muitos produtores tomem decisões baseadas em observações empíricas, gerando **desperdício de água e energia** ou **perdas por déficit hídrico**, que podem reduzir a produção entre 20% e 30%.

A solução proposta é um **sistema IoT de baixo custo** para monitoramento em tempo real da umidade do solo em lavouras de café. Com base nos dados coletados, o produtor pode tomar decisões mais assertivas de irrigação, preservando a produção e melhorando a qualidade da colheita.

---

## 🚀 Funcionalidades

| # | Funcionalidade | Descrição |
|---|----------------|-----------|
| 1 | 📡 Leitura de umidade | Coleta contínua da umidade do solo por meio de sensor capacitivo. |
| 2 | 🌐 Envio de dados via API | Transmissão automática das leituras utilizando módulo Wi-Fi (ESP8266). |
| 3 | 📊 Dashboard web | Visualização clara e em tempo real dos níveis de umidade do solo. |
| 4 | 💡 Apoio à decisão | Informações para o produtor saber o momento ideal de irrigar ou suspender a água. |

---

## 🛠️ Tecnologias e hardware

### Hardware

- Microcontrolador Arduino Uno R3
- Sensor de umidade de solo capacitivo
- Módulo Wi-Fi ESP8266
- Protoboard e jumpers

### Software

- C / C++ (IDE Arduino)
- APIs para recebimento e disponibilização dos dados
- Dashboard web
- Banco de dados no MySQL Workbench

---

## 📦 Escopo do protótipo

O sistema faz a leitura analógica do sensor, converte os dados em porcentagem de umidade, envia para o banco de dados via API e exibe as métricas no painel web do produtor.

---

## 🧩 Arquitetura da solução

> 📷 **Espaço reservado:** insira aqui o diagrama da solução (sensor → Arduino → ESP8266 → API → banco de dados → dashboard).

<!-- ![Arquitetura da solução](./docs/img/arquitetura.png) -->

### Dashboard

> 📷 **Espaço reservado:** prints da dashboard web.

<!-- ![Dashboard](./docs/img/dashboard.png) -->

---

## 📦 Entregáveis

| Entregável | Link |
|------------|------|
| 🗄️ DER (Diagrama Entidade-Relacionamento) | _em breve_ |
| 📄 Documentação | _em breve_ |
| 📊 Especificação da dashboard | _em breve_ |
| 📋 Backlog | _em breve_ |
| 📉 Gráfico de burndown | _em breve_ |
| 🌐 Site estático / Dashboard | _em breve_ |
| 💰 Simulador financeiro | _em breve_ |
| 📽️ Apresentação | _em breve_ |

### 🗄️ DER (Diagrama Entidade-Relacionamento)

🔗 **Link:** _em breve_

> 📷 **Espaço reservado:** insira aqui o print do DER.

<!-- ![DER](./docs/img/der.png) -->

### 📄 Documentação

🔗 **Link:** _em breve_

> 📷 **Espaço reservado:** insira aqui o print da capa ou de uma página da documentação.

<!-- ![Documentação](./docs/img/documentacao.png) -->

### 📊 Especificação da dashboard

🔗 **Link:** _em breve_

> 📷 **Espaço reservado:** insira aqui o print da especificação (seções, KPIs e alertas).

<!-- ![Especificação da dashboard](./docs/img/especificacao-dashboard.png) -->

### 📋 Backlog

🔗 **Link:** _em breve_

> 📷 **Espaço reservado:** insira aqui o print do backlog (Trello, Jira, Azure DevOps etc.).

<!-- ![Backlog](./docs/img/backlog.png) -->

### 📉 Gráfico de burndown

🔗 **Link:** _em breve_

> 📷 **Espaço reservado:** insira aqui o print do gráfico de burndown da sprint.

<!-- ![Gráfico de burndown](./docs/img/burndown.png) -->

### ⚠️ Planilha de risco

🔗 **Link:** _em breve_

> 📷 **Espaço reservado:** insira aqui o print da planilha de risco (riscos, probabilidade, impacto e plano de ação).

<!-- ![Planilha de risco](./img/planilha-risco.png) -->

---

## 📊 Progresso dos entregáveis

| Entregável | Progresso |
|------------|-----------|
| Contexto | `▱▱▱▱▱▱▱▱▱▱ 0%` |
| Protótipo do site | `▰▰▰▰▰▰▰▰▰▰ 100%` |
| Banco de dados | `▰▰▰▰▰▰▰▰▰▱ 90%` |
| Simulador financeiro | `▰▰▰▰▰▰▰▱▱▱ 70%` |
| Documentação | `▰▰▰▰▱▱▱▱▱▱ 40%` |
| Site final | `▰▰▰▰▱▱▱▱▱▱ 40%` |
| Apresentação | `▱▱▱▱▱▱▱▱▱▱ 0%` |

> O **progresso geral** é a média simples dos 7 entregáveis: `▰▰▰▰▱▱▱▱▱▱ 40%`

---

## 👥 Integrantes

**Grupo 04 · Turma 1ADSA · 7 integrantes**

| # | Nome | GitHub |
|---|------|--------|
| 1 | Arthur Lima dos Santos | [@Arthurfull](https://github.com/Arthurfull) | |
| 2 | Bruno Volpe Costa | [@bruno-volpe915](https://github.com/bruno-volpe915) | |
| 3 | Guilherme de Sousa Pinheiro | [@guisyntax](https://github.com/guisyntax) | |
| 4 | Matheus de Souza Menino | [@MatheusMenino](https://github.com/MatheusMenino) | |
| 5 | Julia Carolina Brito dos Santos | [@caju1911](https://github.com/caju1911) |  |
| 6 | Nátaly Rufino Pereira Gutierrez | [@nataly1802](https://github.com/nataly1802) | |
| 7 | Vinícius Augusto Alves de Almeida | [@Vinicius-Augusto05](https://github.com/Vinicius-Augusto05) | |

---


---

Feito com ☕ pelo **Grupo 04** da turma **1ADSA** · [Voltar ao topo](#️-coffeetech--sistema-de-monitoramento-de-solo-para-cafeicultura)