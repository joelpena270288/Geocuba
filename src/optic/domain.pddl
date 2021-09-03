(define (domain agricultura)

;remove requirements that are not needed
(:requirements :strips :fluents :typing :conditional-effects :negative-preconditions :equality)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
(parcela_libre ?par - parcela ?mes - fecha )
(parcela_sembrada ?par - parcela ?cul - cultivo ?mesinicio ?mesfin - fecha )
)


(:functions ;todo: define numeric functions here
(cant_ha_cultivo ?cul - cultivo)

)
(:action cocechar
    :parameters (?par - parcela ?cul - cultivo ?mesinicio ?mesfin - fecha)
    :precondition (and 
    (parcela_libre ?par ?mesinicio )
    )
    :effect (and
    (parcela_sembrada ?par ?cul ?mesinicio ?mesfin)
     )
)

;define actions here

)