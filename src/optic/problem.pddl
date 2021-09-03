(define (problem problema) (:domain agricultura)
(:objects 
papa - cultivo
P1 P2 - parcela
enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre - fecha
)

(:init

(parcela_libre P1 enero)
(parcela_libre P1 febrero)
(parcela_libre P1 marzo)
(parcela_libre P1 abril)
(parcela_libre P1 mayo)
(parcela_libre P1 junio)
(parcela_libre P1 julio)
(parcela_libre P1 agosto)
(parcela_libre P1 septiembre)
(parcela_libre P1 octubre)
(parcela_libre P1 noviembre)
(parcela_libre P1 diciembre)
    ;todo: put the initial state's facts and numeric values here
)


(:goal (and
(parcela_sembrada P1 papa enero febrero)
    ;todo: put the goal condition here
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
