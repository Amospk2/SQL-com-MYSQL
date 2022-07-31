-- Alterações e teste finais

-- Alterar campo NOTA da tabela Disc_Hist para tipo FLOAT
ALTER TABLE Disc_Hist
MODIFY COLUMN NOTA FLOAT(4,2);


-- Inserir alguns dados de disciplinas e notas nos históricos, que estavam faltando
INSERT INTO Disc_Hist (Cod_Historico, Cod_Disciplina, Nota, Frequência)
VALUES
(1, 2, 7, 6), -- Marcos - Psicologia Cognitiva (cod 2)
(2, 3, 8.5, 2), -- Beatriz - Programação em C (cod 3)
(3, 1, 6.8, 8); -- Gabriel - Raciocínio Lógico (cod 1)


-- 1. RAs, Nomes e Sobrenomes dos Alunos, Nomes dos Cursos e Períodos das Turmas, ordenados pelo primeiro nome de aluno:
SELECT A.RA, A.Nome_Aluno, A.Sobrenome_Aluno, T.Periodo, C.Nome_Curso
FROM Aluno A
INNER JOIN Curso C
ON C.Cod_Curso = A.Cod_Curso
INNER JOIN Turma T
ON A.Cod_Turma = T.Cod_Turma
ORDER BY A.Nome_Aluno;

-- 2. Todas as disciplinas cursadas por um aluno, com suas respectivas notas:
-- Aluno: RA 3 (Beatriz)
SELECT A.Nome_Aluno, A.Sobrenome_Aluno, D.Nome_Disciplina, DH.Nota
FROM Aluno A
INNER JOIN Aluno_Disc AD
ON A.RA = AD.RA
INNER JOIN Disciplina D
ON D.Cod_Disciplina = AD.Cod_Disciplina
INNER JOIN Historico H
ON A.RA = H.RA
INNER JOIN Disc_Hist DH
ON H.Cod_Historico = DH.Cod_Historico
WHERE A.RA = 3;

-- 3. Nomes e sobrenomes dos professores, e disciplinas que ministram com suas cargas horárias:
SELECT CONCAT(P.Nome_Professor, ' ', P.Sobrenome_Professor) AS Docente,
D.Nome_Disciplina, D.Carga_Horaria
FROM Professor P
INNER JOIN Prof_Disciplina PD
ON P.Cod_Professor = PD.Cod_Professor
INNER JOIN Disciplina D
ON D.Cod_Disciplina = PD.Cod_Disciplina
ORDER BY D.Nome_Disciplina;

-- 4. Gerar "relatório" com nomes, sobrenomes, CPF dos alunos, tipos e números de telefones e endereços completos.
SELECT CONCAT(A.Nome_Aluno, ' ', A.Sobrenome_Aluno) AS Aluno, A.CPF, T.Num_Telefone, CONCAT(TL.Tipo_Logradouro, ' ', E.Nome_Rua, ', ', E.Num_Rua) AS Logradouro, E.Complemento, E.CEP
FROM Aluno A
INNER JOIN Telefones_Aluno T
ON A.RA = T.RA
INNER JOIN Endereco_Aluno E
ON A.RA = E.RA
INNER JOIN Tipo_Logradouro TL
ON TL.Cod_Tipo_Logradouro = E.Cod_Tipo_Logradouro;

-- 5. Listar as disciplinas, indicando seus departamentos, cursos e professores
SELECT Di.Nome_Disciplina, C.Nome_Curso,
CONCAT(P.Nome_Professor, ' ', P.Sobrenome_Professor) AS Docente, De.Nome_Departamento
FROM Disciplina Di
INNER JOIN Departamento De
ON Di.Cod_Departamento = De.Cod_Departamento
INNER JOIN Prof_Disciplina PD
ON Di.Cod_Disciplina = PD.Cod_Disciplina
INNER JOIN Professor P
ON P.Cod_Professor = PD.Cod_Professor
INNER JOIN Curso_Disciplina CD
ON Di.Cod_Disciplina = CD.Cod_Disciplina
INNER JOIN Curso C
ON C.Cod_Curso = CD.Cod_Curso
ORDER BY Di.Nome_Disciplina;