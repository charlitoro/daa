------------
-- Solucion Carlos Toro
select *
from (
	select t1.nomestudiante,t1.nomciudad,case
		when lower (t1.nomdepto) like('%tl_ntico%') or 
			 lower (t1.nomdepto) like('%olivar%') or   
			 lower (t1.nomdepto) like('%esar%') or
			 lower (t1.nomdepto) like('%ordoba%') or 
			 lower (t1.nomdepto) like('%uajira%') or
			 lower (t1.nomdepto) like('%agdalena%') or 
			 lower (t1.nomdepto) like('%an%ndr_s%') or
			 lower (t1.nomdepto) like('%ucre%') then 'ATLANTICA'
		when lower (t1.nomdepto) like('%mazonas%') or 
			 lower (t1.nomdepto) like('%rauca%') or   
			 lower (t1.nomdepto) like('%asanare%') or
			 lower (t1.nomdepto) like('%uainia%') or 
			 lower (t1.nomdepto) like('%uaviare%') or
			 lower (t1.nomdepto)like('%utumayo%') or 
			 lower (t1.nomdepto) like('%aupes%') or
			 lower (t1.nomdepto) like('%ichada%') then 'ORINOQUIA'
		when lower (t1.nomdepto) like('%oyac_%') or 
			 lower (t1.nomdepto) like('%undinamarca%') or   
			 lower (t1.nomdepto) like('%orte%antander%') or
			 lower (t1.nomdepto) like('%antander%') or 
			 lower (t1.nomdepto) like('%eta%') then 'ORIENTE'
		when lower (t1.nomdepto) like('%aldas%') or 
			 lower (t1.nomdepto) like('%isaralda%') or   
			 lower (t1.nomdepto) like('%uindio%') or
			 lower (t1.nomdepto) like('%uila%') or 
			 lower (t1.nomdepto) like('%olima%') or 
			 lower (t1.nomdepto) like('%aqueta%') then 'CENTRAL'
		when lower (t1.nomdepto) like('%auca%') or 
			 lower (t1.nomdepto) like('%hoco%') or   
			 lower (t1.nomdepto) like('%ari_o%') or
			 lower (t1.nomdepto) like('%alle%auca%') then 'PASIFICA'
		when lower (t1.nomdepto) like('%ogot_%') then 'BOGOTA'
		when lower (t1.nomdepto) like('%ntioquia%') then 'ANTIOQUIA'
		else 'OTHER'
		end as region
	from (estudiantes join ciudades on ciudad=codciudad
			join departamentos on departamento=coddepto
			join regnotas on codestudiante=estudiante
			join materias on materia=codmateria) as t1
		join (estudiantes join ciudades on ciudad=codciudad
			join departamentos on departamento=coddepto
			join regnotas on codestudiante=estudiante
			join materias on materia=codmateria) as t2
		on t1.codestudiante = t2.codestudiante
	where t1.nommateria like '%rogramaci_n%O_O%' and 
			t2.nommateria like '%ase%ato%'
) as t3
where region='PASIFICA'
order by t3.nomciudad;
