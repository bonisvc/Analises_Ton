SELECT * FROM base_chamados;

CREATE VIEW consulta1 
AS
	SELECT Data
			, COUNT(*) Chamados_Dia
		FROM
			base_chamados
		GROUP BY
			Data;

SELECT a.Data
	, a.Chamados_Dia
	, SUM(b.Chamados_Dia) Acumulado_30dias
FROM
	consulta1 a
JOIN
	consulta1 b ON DATEDIFF(a.Data, b.Data) BETWEEN 0 AND 29
GROUP BY
	a.Data, a.Chamados_Dia
ORDER BY
	a.Data;
