;Header and description

(define (domain agricultura)

;remove requirements that are not needed
(:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
(parcela_libre ?par - parcela ?fecha - fecha)
 (parcela_sembrada ?par - parcela ?cul - cultivo ?fechainicio ?fechafin - fecha)
 
 (temporada ?cul - cultivo ?fechainicio ?fechafin - fecha )
)


(:functions ;todo: define numeric functions here
(cantidad_ha_cultivo ?cul - cultivo)
(cantidad_ha_parcela ?par - parcela)
(coeficiente ?par - parcela ?cul - cultivo)
(costo)
(numero_temporada  ?cul - cultivo ?fechainicio ?fechafin - fecha  )

)

;define actions here

)