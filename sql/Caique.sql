

/*
select distinct concat(usuario.firstname, ' ',usuario.lastname) AS nomeUSUÁRIOAFETADO
from mdl_logstore_standard_log as log left join mdl_user as usuario
on log.userid = usuario.id
*/

#seleciona as colunas de ambas tabelas a serem exibidas
select
from_unixtime(lo.timecreated) AS DATAeHORA,
us.firstname AS NOME,
us.lastname AS SOBRENOME,
lo.relateduserid AS idUSUÁRIOAFETADO,
lo.action AS AÇÃO,
lo.target AS COMPONENTE,
lo.objecttable AS NOMEdoEVENTO,
lo.objectid AS IDdoEVENTO,
lo.contextid AS IDdoRECURSO,
lo.contextinstanceid AS IDCursoRecursoAtividade,
lo.origin AS ORIGEM,
lo.ip AS IPdoUSUÁRIO,
lo.courseid AS IDdoCURSO  #Colunas com informações necessárias para exibição dos dados semelhantes ao relatório de LOG na aplicação


from mdl_logstore_standard_log lo #Menciona a tabela de LOGS
#relacionamento de tabelas
inner join mdl_user as us
on lo.userid = us.id #join no ID do usuário que fez o LOG junto a tabela mdl_user
inner join mdl_course as curso 
on lo.courseid = curso.id

#consulta

where us.firstname like '%min' #nome do usuário
#and us.lastname like '%' #sobre nome do usuário
#and lo.origin like '%' #Web ou CLI
#and courseid = 3940 #id do curso
#and lo.action like '%' #deleted ou updated ou ...
order by lo.timecreated desc #Ordem da data decrescente


#Hora: timecreated
#Nome completo: firstname + lastname / userid
#Usuário afetado: relateduserid
#Contexto do Evento: contextid
#Componente:
#Nome do evento: eventname(tabela event) << component\event\target_action
#Descrição: "userid" realizou.. discurção "contextid" no modulo do curso "contextinstanceid"
#Origem: origin
#endereço IP: ip

#select * from mdl_logstore_standard_log