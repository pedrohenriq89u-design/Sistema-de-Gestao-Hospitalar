use hospital_db;

-- 1. listar todos os pacientes

select * from pacientes;

-- 2. listar todos os médicos

select * from medicos;

-- 3. listar todos os quartos

select * from quartos;

-- 4. histórico de internações

select p.nome_paciente, q.numero_quarto, q.andar,
       i.data_entrada, i.valor_diaria
from internacoes i
inner join pacientes p on i.id_paciente = p.id_paciente
inner join quartos q on i.id_quarto = q.id_quarto;

-- 5. prescrições e médicos responsáveis

select m.nome_medico, m.especialidade,
       p.nome_paciente, pr.medicamento
from prescricoes pr
inner join consultas c on pr.id_consulta = c.id_consulta
inner join medicos m on c.id_medico = m.id_medico
inner join pacientes p on c.id_paciente = p.id_paciente;

-- 6. consultas mais recentes

select p.nome_paciente, m.nome_medico, c.data_consulta
from consultas c
inner join pacientes p on c.id_paciente = p.id_paciente
inner join medicos m on c.id_medico = m.id_medico
order by c.data_consulta desc;

-- 7. diárias da menor para a maior

select p.nome_paciente, q.numero_quarto, i.valor_diaria
from internacoes i
inner join pacientes p on i.id_paciente = p.id_paciente
inner join quartos q on i.id_quarto = q.id_quarto
order by i.valor_diaria asc;

-- 8. média dos valores das consultas

select round(avg(valor_consulta), 2) as valor_medio
from consultas;

-- 9. total arrecadado com consultas agendadas ou realizadas

select sum(valor_consulta) as total_arrecadado
from consultas
where status_consulta in ('agendada', 'realizada');

-- 10. consultas de pacientes com silva no nome

select p.nome_paciente, m.nome_medico, c.data_consulta
from consultas c
inner join pacientes p on c.id_paciente = p.id_paciente
inner join medicos m on c.id_medico = m.id_medico
where p.nome_paciente like '%silva%'
and c.status_consulta = 'realizada';

-- 11. médicos da área de cardiologia

select p.nome_paciente, m.nome_medico, m.especialidade
from consultas c
inner join pacientes p on c.id_paciente = p.id_paciente
inner join medicos m on c.id_medico = m.id_medico
where m.especialidade like '%cardio%';

-- 12. internações no primeiro semestre de 2026

select p.nome_paciente, q.numero_quarto, i.data_entrada
from internacoes i
inner join pacientes p on i.id_paciente = p.id_paciente
inner join quartos q on i.id_quarto = q.id_quarto
where i.data_entrada >= '2026-01-01'
and i.data_entrada < '2026-07-01';

-- 13. gastos dos pacientes com unimed

select p.nome_paciente, p.convenio,
       sum(c.valor_consulta) as total_gasto
from pacientes p
inner join consultas c on p.id_paciente = c.id_paciente
where p.convenio like '%unimed%'
group by p.id_paciente, p.nome_paciente, p.convenio
order by total_gasto desc;

-- 14. custo das diárias por andar para pacientes oliveira

select q.andar,
       sum(i.valor_diaria *
       greatest(datediff(
       coalesce(i.data_saida, curdate()),
       i.data_entrada), 1)) as custo_total
from internacoes i
inner join pacientes p on i.id_paciente = p.id_paciente
inner join quartos q on i.id_quarto = q.id_quarto
where p.nome_paciente like '%oliveira%'
group by q.andar
order by q.andar asc;

-- 15. faturamento por especialidades cirúrgicas

select m.especialidade,
       sum(c.valor_consulta) as total_arrecadado
from consultas c
inner join medicos m on c.id_medico = m.id_medico
where m.especialidade like '%cirurgia%'
group by m.especialidade
order by total_arrecadado desc;