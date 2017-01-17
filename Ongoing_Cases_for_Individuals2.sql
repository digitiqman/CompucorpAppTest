select cc.display_name as "Contact display name", (select ccemp.display_name from civicrm.civicrm_contact ccemp where ccemp.contact_type = 'Organization' and ccemp.id=cc.employer_id) as "Employer organisation name", count(ccase.status_id) as "Number (count) of cases" from civicrm.civicrm_contact cc 
inner join civicrm.civicrm_case_contact ccc on cc.id=ccc.contact_id  
inner join civicrm.civicrm_case ccase on ccase.id=ccc.case_id
where cc.contact_type = 'Individual' and ccase.status_id= (select cov.value from civicrm.civicrm_option_value cov where cov.label='Ongoing') /*IF CASE STATUS ID IS NOT KNOWN BUT LABEL OPTION VALUE 'ONGOING' IS KNOWN */
group by cc.id;