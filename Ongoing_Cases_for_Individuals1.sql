select cc.display_name as "Contact display name", (select ccemp.display_name from civicrm.civicrm_contact ccemp where ccemp.contact_type = 'Organization' and ccemp.id=cc.employer_id) as "Employer organisation name", count(ccase.status_id) as "Number (count) of cases" from civicrm.civicrm_contact cc 
inner join civicrm.civicrm_case_contact ccc on cc.id=ccc.contact_id  
inner join civicrm.civicrm_case ccase on ccase.id=ccc.case_id
where cc.contact_type = 'Individual' and ccase.status_id=1 /*IF CASE STATUS ID MEANT FOR 'ONGOING' CASE STATUS IS KNOWN BEFORE HAND */
group by cc.id;