select from_unixtime(log.timecreated) as Hora,
user.firstname as Nome,
user.lastname as Sobrenome,
log.component as Componente,
log.eventname as NomedoEvento,
log.origin as Origem,
log.ip as IP,
curso.fullname as Curso,
user.id as IDUsuário,
curso.id as IDCurso

from 
mdl_logstore_standard_log as log
inner join mdl_course as curso on (log.courseid = curso.id)
inner join mdl_user as user on (log.userid = user.id)

#WHERE curso.fullname = 'NEAD/STI/ UFBA' 
where log.timecreated between 1510790400 /* 11/16/2017 @ 12:00am */ and 1515592740 /* 01/10/2018 @ 1:59pm */
order by log.timecreated desc