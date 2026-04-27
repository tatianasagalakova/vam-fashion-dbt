
    
    

select
    object_id as unique_field,
    count(*) as n_records

from "vam_fashion"."main"."stg_vam_fashion"
where object_id is not null
group by object_id
having count(*) > 1


