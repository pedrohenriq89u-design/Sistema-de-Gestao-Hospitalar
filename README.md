# Sistema de Gestão Hospitalar — Vida & Saúde

## 1. Apresentação do projeto

Este projeto consiste no desenvolvimento de um banco de dados relacional para o Hospital Geral Vida & Saúde, utilizando MySQL e MySQL Workbench.

A proposta é centralizar e organizar as informações hospitalares, facilitando o controle de pacientes, médicos, quartos, internações, consultas e prescrições.

## 2. Objetivos

- Organizar os dados hospitalares em um banco de dados relacional.
- Reduzir problemas de duplicidade e inconsistência de informações.
- Manter o histórico de consultas e internações.
- Estabelecer relacionamentos entre as tabelas.
- Evitar conflitos de horários médicos e ocupação dos quartos.
- Permitir consultas SQL para auxiliar na tomada de decisões.

## 3. Tecnologias utilizadas

- MySQL 8.0+
- MySQL Workbench
- SQL
- Git
- GitHub

## 4. Estrutura do banco de dados

O banco de dados utilizado possui o nome `hospital_db` e é composto por seis tabelas:

| Tabela | Descrição |
|---|---|
| `pacientes` | Armazena os dados dos pacientes e seus convênios. |
| `medicos` | Armazena os dados dos médicos e suas especialidades. |
| `quartos` | Armazena os dados dos quartos hospitalares. |
| `internacoes` | Registra as internações dos pacientes. |
| `consultas` | Registra os atendimentos médicos. |
| `prescricoes` | Armazena os medicamentos prescritos. |

## 5. Relacionamentos

O banco de dados possui os seguintes relacionamentos:

- **Pacientes 1:N Internações:** um paciente pode possuir várias internações.
- **Quartos 1:N Internações:** um quarto pode receber diferentes internações ao longo do tempo.
- **Pacientes 1:N Consultas:** um paciente pode realizar várias consultas.
- **Médicos 1:N Consultas:** um médico pode realizar vários atendimentos.
- **Consultas 1:N Prescrições:** uma consulta pode possuir várias prescrições.

As tabelas utilizam chaves primárias (PK) e chaves estrangeiras (FK) para estabelecer os relacionamentos e manter a integridade referencial.

## 6. Scripts SQL

### DDL — Linguagem de Definição de Dados

Responsável pela criação do banco de dados e das tabelas, incluindo:

- Criação do banco `hospital_db`.
- Criação das seis tabelas.
- Definição das chaves primárias e estrangeiras.
- Restrições `NOT NULL`, `UNIQUE` e `FOREIGN KEY`.
- Relacionamentos entre as tabelas.

### DML — Linguagem de Manipulação de Dados

Responsável pela inserção dos dados utilizados para testar o funcionamento do banco.

Foram preparados 10 registros para cada uma das seis tabelas, totalizando 60 registros de teste.

### DQL — Linguagem de Consulta de Dados

Responsável pelas consultas utilizadas para extrair informações do banco.

Foram desenvolvidas 15 consultas estratégicas, utilizando recursos como:

- `SELECT`
- `INNER JOIN`
- `LEFT JOIN`
- `WHERE`
- `ORDER BY`
- `GROUP BY`
- `LIKE`
- `AVG()`
- `SUM()`
- `COUNT()`

## 7. Consultas estratégicas desenvolvidas

1. Relatório da farmácia com pacientes, médicos, consultas e medicamentos prescritos.
2. Histórico de internações com pacientes, quartos, andares, datas e valores das diárias.
3. Relação de pacientes, convênios e médicos responsáveis pelos atendimentos.
4. Listagem de prescrições com médicos, especialidades, pacientes e medicamentos.
5. Identificação de pacientes que já foram internados e também passaram por consultas.
6. Listagem de consultas, começando pelas mais recentes.
7. Listagem dos valores das diárias em ordem crescente.
8. Cálculo do valor médio das consultas médicas.
9. Cálculo do valor total das consultas agendadas ou realizadas.
10. Identificação das consultas realizadas por pacientes com o sobrenome Silva.
11. Consultas realizadas por médicos de especialidades relacionadas à Cardiologia.
12. Levantamento das internações realizadas no primeiro semestre de 2026.
13. Cálculo dos valores gastos por pacientes que possuem convênio Unimed.
14. Cálculo dos custos das diárias por andar para pacientes com o sobrenome Oliveira.
15. Cálculo do faturamento por especialidades médicas relacionadas à Cirurgia.

## 8. Regras de integridade dos dados

Foram utilizadas restrições e validações para manter a consistência das informações:

- Chaves primárias para identificar os registros.
- Chaves estrangeiras para manter os relacionamentos.
- Restrições `UNIQUE` para evitar valores duplicados.
- Restrições `NOT NULL` para exigir informações obrigatórias.
- `ON DELETE RESTRICT` para proteger registros relacionados.
- Validações para evitar conflitos de horários e ocupação
