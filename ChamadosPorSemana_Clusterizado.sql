SELECT MAX(Data) 
INTO @Ultimo_dia 
FROM base_chamados;

SELECT YEARWEEK(Data) AS Semana
	, CASE WHEN Cluster = -1 THEN count(Cluster) END AS Cluster_1
    , CASE WHEN Cluster = 0 THEN count(Cluster) END AS Cluster_2
FROM
	base_chamados
WHERE
	Data BETWEEN DATE_ADD(@Ultimo_dia, INTERVAL -90 DAY) AND @Ultimo_dia
GROUP BY
	Semana
ORDER BY
	Semana;
    