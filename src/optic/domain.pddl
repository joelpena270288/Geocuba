;Header and description

(define (domain agricultura)

;remove requirements that are not needed
(:requirements :strips :fluents :typing :conditional-effects :negative-preconditions :equality  :durative-actions :timed-initial-literals)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle

 cultivo parcela fecha familia 

)
 
; un-comment following line if constants are needed
(:constants 
papa yuca boniato ajo berenjena calabaza cebolla col frijol_caupi frijol_colorado frijol_negro frutabomba malanga_xantosoma malanga_colocasia maiz pimiento platano_burro platano_fruta tomate Ningun_cultivo - cultivo
SOLANACEAS  LILIACEAS CRUCIFERAS ALEACEAS COMPUESTAS  LEGUMINOSA Ninguna_familia UMBELIFERAS LEGUMINOSAS QUENOPODIACEAS CUCURBITACEAS - familia
)

(:predicates ;todo: define predicates here
 (parcela_libre ?par - parcela)
 (parcela_sembrada ?par - parcela ?cul - cultivo ) 
 (temporada ?cul - cultivo ?fechainicio ?fechafin - fecha )
 (orden_meses ?anterior ?posterior - fecha) 
 (periodo_del_plan)
 (ultimo_cultivo ?parcela_a_sembrar - parcela ?cultivo_anterior - cultivo)
 (rotacion ?cultivo_anterior  ?cultivo_a_sembrar - cultivo) 
 (parcelas_vecinas ?parcela_a_sembrar ?parcela_vecina - parcela )
 
 (familia_cultivo ?cul - cultivo ?fami - familia)
 
 (temporada_papa)
 (temporada_boniato)
 (temporada_yuca)
 (temporada_ajo)
 (temporada_tomate)
 (temporada_frijol_negro)
 (temporada_cebolla)
 (temporada_frijol_colorado)
 (temporada_calabaza)
 (temporada_berenjena)
 (temporada_col)
 (temporada_maiz)
 (temporada_platano_fruta)
 (temporada_frutabomba)
 (temporada_frijol_caupi)
 (parcela_ocupada ?par - parcela)
 (temporada_malanga_xantosoma)
 (temporada_pimiento)
 (temporada_platano_burro)
 (temporada_malanga_colocasia)
 (parcela_lista_papa ?parcela_a_sembrar - parcela)
 (parcela_lista_boniato ?parcela_a_sembrar - parcela )
 (parcela_lista_yuca ?parcela_a_sembrar - parcela )
 (parcela_lista_maiz ?parcela_a_sembrar - parcela )
 (parcela_lista_malanga_xantosoma ?parcela_a_sembrar - parcela )
 (parcela_lista_malanga_colocasia ?parcela_a_sembrar - parcela )
 (parcela_lista_frijol_caupi ?parcela_a_sembrar - parcela )
 (parcela_lista_frijol_negro ?parcela_a_sembrar - parcela )
 (parcela_lista_frijol_colorado ?parcela_a_sembrar - parcela )
 (parcela_lista_pimiento ?parcela_a_sembrar - parcela )
 (parcela_lista_ajo ?parcela_a_sembrar - parcela )
 (parcela_lista_tomate ?parcela_a_sembrar - parcela )
 (parcela_lista_cebolla ?parcela_a_sembrar - parcela )
 (parcela_lista_calabaza ?parcela_a_sembrar - parcela )
 (parcela_lista_berenjena ?parcela_a_sembrar - parcela )
 (parcela_lista_col ?parcela_a_sembrar - parcela )
 (parcela_lista_platano_fruta ?parcela_a_sembrar - parcela )
 (parcela_lista_platano_burro ?parcela_a_sembrar - parcela )
 (parcela_lista_frutabomba ?parcela_a_sembrar - parcela )
 (tomate_sembrado ?parcela - parcela)
 
 

 
)
(:functions ;todo: define numeric functions here
    (cantidad_ha_cultivo ?cul - cultivo)
    (cantidad_ha_parcela ?par - parcela)
    (coeficiente ?par - parcela ?cul - cultivo)
    (costo)
    (diferencia)
    (orden_meses ?mes - fecha)
    (mes_actual)
)

(:durative-action tiempo_preparacion_frijol_negro
    :parameters ( ?parcela_a_sembrar - parcela)
    :duration (= ?duration 1)
    :condition (and 
         (at start (parcela_libre ?parcela_a_sembrar))                  
         (over all (periodo_del_plan))
         (at end (temporada_frijol_negro))     
    )      
    :effect (and 
        (at start(increase (costo)0.1))
        (at start(not (parcela_libre ?parcela_a_sembrar)))             
        (at end ( parcela_lista_frijol_negro ?parcela_a_sembrar))       
        (at end (not (parcela_libre ?parcela_a_sembrar)))    
    )
)

(:durative-action tiempo_preparacion_tomate
    :parameters ( ?parcela_a_sembrar - parcela )
    :duration (= ?duration 1)
    :condition (and     
        (at start (parcela_libre ?parcela_a_sembrar)) 
        (over all (periodo_del_plan) )
        (at end (temporada_tomate))          
    )
    :effect (and    
       ; (at start(increase (costo)0.1))
        (at start (not (parcela_libre ?parcela_a_sembrar))) 
        (at end ( parcela_lista_tomate ?parcela_a_sembrar))
        (at end (not (parcela_libre ?parcela_a_sembrar)))    
    )
)

(:durative-action tiempo_preparacion_ajo
    :parameters ( ?parcela_a_sembrar - parcela )
    :duration (= ?duration 1)
    :condition (and 
         (at start (parcela_libre ?parcela_a_sembrar))
         (over all (periodo_del_plan) )
         (at end (temporada_ajo) )
         )
    :effect (and 
       
        (at start (not (parcela_libre ?parcela_a_sembrar)))
        (at end ( parcela_lista_ajo ?parcela_a_sembrar ))
        (at end (not (parcela_libre ?parcela_a_sembrar)))    
    )
)

(:durative-action tiempo_preparacion_papa
    :parameters ( ?parcela_a_sembrar - parcela )
    :duration (= ?duration 2)
    :condition (and 
        (at start (parcela_libre ?parcela_a_sembrar))  
        (over all (periodo_del_plan) )       
        (at end (temporada_papa))
    )
    :effect (and    
        (at start (not (parcela_libre ?parcela_a_sembrar)))       
        (at end (not (parcela_libre ?parcela_a_sembrar)))
        (at end ( parcela_lista_papa ?parcela_a_sembrar ))
    )
)

(:durative-action tiempo_preparacion_yuca
    :parameters ( ?parcela_a_sembrar - parcela )
    :duration (= ?duration 1)
    :condition (and 
        (at start (parcela_libre ?parcela_a_sembrar)) 
        (over all (periodo_del_plan) )
        (at end (temporada_yuca) )
    )
    :effect (and 
      
           ;(at start(increase (costo)0.1))
          (at start (not (parcela_libre ?parcela_a_sembrar)))
          (at end ( parcela_lista_yuca ?parcela_a_sembrar ))
          
          (at end (not (parcela_libre ?parcela_a_sembrar)))
          
    )
)

(:durative-action tiempo_preparacion_boniato
    :parameters ( ?parcela_a_sembrar - parcela )
    :duration (= ?duration 1)
    :condition (and 
     (at start (parcela_libre ?parcela_a_sembrar))
        (over all (periodo_del_plan) )
         (at end (temporada_boniato) )
    )
    :effect (and 
         
           ;(at start(increase (costo)0.1))
          (at start (not (parcela_libre ?parcela_a_sembrar)))      
        (at end ( parcela_lista_boniato ?parcela_a_sembrar ))
        (at end (not (parcela_libre ?parcela_a_sembrar)))
       
    )
)

(:durative-action tiempo_preparacion_maiz
    :parameters ( ?parcela_a_sembrar - parcela )
    :duration (= ?duration 1)
    :condition (and 
       
         (at start (parcela_libre ?parcela_a_sembrar))
          (over all (periodo_del_plan) )
         (at end (temporada_maiz))
    )
    :effect (and 
         ;(at start (increase (costo)(*(costo)0.9)))
          ; (at start(increase (costo)0.1))
          (at start (not (parcela_libre ?parcela_a_sembrar))) 
        (at end ( parcela_lista_maiz ?parcela_a_sembrar ))
        (at end (not (parcela_libre ?parcela_a_sembrar)))
         
        
    )
)
(:durative-action tiempo_preparacion_malanga_xantosoma
    :parameters ( ?parcela_a_sembrar - parcela )
    :duration (= ?duration 1)
    :condition (and 
      
         (at start (parcela_libre ?parcela_a_sembrar))
          (over all (periodo_del_plan) )
         (at end (temporada_malanga_xantosoma) )
    )
    :effect (and 
          ;(at start (increase (costo)(*(costo)0.9))) 
           ;(at start(increase (costo)0.1))
          (at start (not (parcela_libre ?parcela_a_sembrar)))
         (at end ( parcela_lista_malanga_xantosoma ?parcela_a_sembrar ))
        (at end (not (parcela_libre ?parcela_a_sembrar)))
       
        
    )
)
(:durative-action tiempo_preparacion_malanga_colocasia
    :parameters ( ?parcela_a_sembrar - parcela )
    :duration (= ?duration 1)
    :condition (and 
       
         (at start (parcela_libre ?parcela_a_sembrar))
         (over all (periodo_del_plan) )
         (at end (temporada_malanga_colocasia) )
    )
    :effect (and 
        ;(at start(increase (costo)0.1))
        (at start (not (parcela_libre ?parcela_a_sembrar)))
        (at end ( parcela_lista_malanga_colocasia ?parcela_a_sembrar ))
        (at end (not (parcela_libre ?parcela_a_sembrar)))
        
        
    )
)
(:durative-action tiempo_preparacion_frijol_caupi
    :parameters ( ?parcela_a_sembrar - parcela )
    :duration (= ?duration 1)
    :condition (and 
       
        (at start (parcela_libre ?parcela_a_sembrar))
        (over all (periodo_del_plan) )
        (at end (temporada_frijol_caupi) )
    )
    :effect (and 
        ;(at start(increase (costo)0.1))
        (at start (not (parcela_libre ?parcela_a_sembrar)))
        (at end ( parcela_lista_frijol_caupi ?parcela_a_sembrar ))
        (at end (not (parcela_libre ?parcela_a_sembrar)))
        
        
    )
)
(:durative-action tiempo_preparacion_frijol_colorado
    :parameters ( ?parcela_a_sembrar - parcela )
    :duration (= ?duration 1)
    :condition (and 
        
        (at start (parcela_libre ?parcela_a_sembrar))
        (over all (periodo_del_plan) )
        (at end (temporada_frijol_colorado) )
    )
    :effect (and 
       ; (at start(increase (costo)0.1))
        (at start (not (parcela_libre ?parcela_a_sembrar)))
        (at end ( parcela_lista_frijol_colorado ?parcela_a_sembrar ))
        (at end (not (parcela_libre ?parcela_a_sembrar)))
        
        
    )
)

(:durative-action tiempo_preparacion_pimiento
    :parameters ( ?parcela_a_sembrar - parcela )
    :duration (= ?duration 1)
    :condition (and 
       
         (at start (parcela_libre ?parcela_a_sembrar))
          (over all (periodo_del_plan) )
         (at end (temporada_pimiento) )
    )
    :effect (and 
        ; (at start(increase (costo)0.1))
        (at end (not (parcela_libre ?parcela_a_sembrar)))
        (at end ( parcela_lista_pimiento ?parcela_a_sembrar ))
        (at end (not (parcela_libre ?parcela_a_sembrar)))
         
    )
)


(:durative-action tiempo_preparacion_cebolla
    :parameters ( ?parcela_a_sembrar - parcela )
    :duration (= ?duration 1)
    :condition (and 
        (at start (parcela_libre ?parcela_a_sembrar)) 
         (over all (periodo_del_plan) )
        (at end (temporada_cebolla) )
    )
    :effect (and 
           ;(at start(increase (costo)0.1))
          (at start (not (parcela_libre ?parcela_a_sembrar)))
         (at end ( parcela_lista_cebolla ?parcela_a_sembrar ))
          (at end (not (parcela_libre ?parcela_a_sembrar)))
        
       
       
       
        
    )
)

(:durative-action tiempo_preparacion_calabaza
    :parameters ( ?parcela_a_sembrar - parcela )
    :duration (= ?duration 1)
    :condition (and 
       
        (at start (parcela_libre ?parcela_a_sembrar))
        (over all (periodo_del_plan) )
        (at end (temporada_calabaza) )
    )
    :effect (and 
        ;(at start(increase (costo)0.1))
        (at start (not (parcela_libre ?parcela_a_sembrar)))
        (at end ( parcela_lista_calabaza ?parcela_a_sembrar ))
        (at end (not (parcela_libre ?parcela_a_sembrar)))
       
    )
)
(:durative-action tiempo_preparacion_berenjena
    :parameters ( ?parcela_a_sembrar - parcela )
    :duration (= ?duration 1)
    :condition (and 
       
         (at start (parcela_libre ?parcela_a_sembrar))
          (over all (periodo_del_plan) )
         (at end (temporada_berenjena) )
    )
    :effect (and  
         ;(at start(increase (costo)0.1))       
        (at start (not (parcela_libre ?parcela_a_sembrar)))
        (at end ( parcela_lista_berenjena ?parcela_a_sembrar ))
        (at end (not (parcela_libre ?parcela_a_sembrar)))
      
    )
)
(:durative-action tiempo_preparacion_col
    :parameters ( ?parcela_a_sembrar - parcela )
    :duration (= ?duration 1)
    :condition (and 
      
         (at start (parcela_libre ?parcela_a_sembrar))
          (over all (periodo_del_plan) )
         (at end (temporada_col) )
    )
    :effect (and 
         ;(at start(increase (costo)0.1))
         (at start (not (parcela_libre ?parcela_a_sembrar)))
        (at end ( parcela_lista_col ?parcela_a_sembrar ))
        (at end (not (parcela_libre ?parcela_a_sembrar)))
        
    )
)
(:durative-action tiempo_preparacion_platano_fruta
    :parameters ( ?parcela_a_sembrar - parcela )
    :duration (= ?duration 1)
    :condition (and 
         
         (at start (parcela_libre ?parcela_a_sembrar))
          (over all (periodo_del_plan) )
         (at end (temporada_platano_fruta) )
    )
    :effect (and 
          ;(at start(increase (costo)0.1))
         (at start (not (parcela_libre ?parcela_a_sembrar)))
        (at end ( parcela_lista_platano_fruta ?parcela_a_sembrar ))
        (at end (not (parcela_libre ?parcela_a_sembrar)))
        
    )
)
(:durative-action tiempo_preparacion_platano_burro
    :parameters ( ?parcela_a_sembrar - parcela )
    :duration (= ?duration 1)
    :condition (and 
       
         (at start (parcela_libre ?parcela_a_sembrar))
          (over all (periodo_del_plan) )
         (at end (temporada_platano_burro) )
    )
    :effect (and 
         ;(at start (increase (costo)(*(costo)0.9)))
         ; (at start(increase (costo)0.1))
         (at start (not (parcela_libre ?parcela_a_sembrar)))
        (at end ( parcela_lista_platano_burro ?parcela_a_sembrar ))
        (at end (not (parcela_libre ?parcela_a_sembrar)))
       
    )
)
(:durative-action tiempo_preparacion_frutabomba
    :parameters ( ?parcela_a_sembrar - parcela )
    :duration (= ?duration 1)
    :condition (and 
       
         (at start (parcela_libre ?parcela_a_sembrar))
          (over all (periodo_del_plan) )
         (at end (temporada_frutabomba) )
    )
    :effect (and 
         ;(at start (increase (costo)(*(costo)0.9)))
          ; (at start(increase (costo)0.1))
          (at start (not (parcela_libre ?parcela_a_sembrar)))
        (at end ( parcela_lista_frutabomba ?parcela_a_sembrar ))
        (at end (not (parcela_libre ?parcela_a_sembrar)))
       
    )
)
(:durative-action Cosechar_frijol_negro
    :parameters ( ?parcela_a_sembrar - parcela  ?cultivo_anterior - cultivo)
    :duration (= ?duration 3)
    :condition (and          
         (at start (ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))
         (over all (parcela_lista_frijol_negro ?parcela_a_sembrar))
         (at start (rotacion ?cultivo_anterior frijol_negro))       
         (at start  (>(cantidad_ha_cultivo frijol_negro)0))      
         (over all (periodo_del_plan) )      
    )
        
    :effect (and       
              
        (at start(increase (costo)(- 1(coeficiente ?parcela_a_sembrar frijol_negro))))  
        (at start (not(parcela_lista_frijol_negro ?parcela_a_sembrar ) )) 
        (at start (decrease (cantidad_ha_cultivo frijol_negro)(cantidad_ha_parcela ?parcela_a_sembrar)))
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))) 
        (at end (ultimo_cultivo ?parcela_a_sembrar frijol_negro))
        (at end (not(parcela_lista_frijol_negro ?parcela_a_sembrar ) ))   
        (at end  (parcela_libre ?parcela_a_sembrar ))
         
             
     )
)
(:durative-action Cosechar_tomate
    :parameters ( ?parcela_a_sembrar - parcela  ?cultivo_anterior - cultivo)
    :duration (= ?duration 4)
    :condition (and      
       
        (at start (parcela_lista_tomate ?parcela_a_sembrar))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))
        (at start (rotacion ?cultivo_anterior tomate) )       
        (at start  (>(cantidad_ha_cultivo tomate)0))
        (over all (periodo_del_plan) )       
    )     
    :effect (and        
        (at start (decrease (cantidad_ha_cultivo tomate)(cantidad_ha_parcela ?parcela_a_sembrar)))
        (at start(increase (costo)(- 1(coeficiente ?parcela_a_sembrar tomate)))) 
        (at start (not(parcela_lista_tomate ?parcela_a_sembrar) ))       
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior)))
        (at end (ultimo_cultivo ?parcela_a_sembrar tomate))       
        (at end (not(parcela_lista_tomate ?parcela_a_sembrar) ))
        (at end (parcela_libre ?parcela_a_sembrar ))                      
     )
)
(:durative-action Cosechar_ajo
    :parameters ( ?parcela_a_sembrar - parcela  ?cultivo_anterior - cultivo)
    :duration (= ?duration 2)
    :condition (and  
    
         (at start (parcela_lista_ajo ?parcela_a_sembrar))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))
        (at start (rotacion ?cultivo_anterior ajo) )       
        (at start  (>(cantidad_ha_cultivo ajo)0))
        (over all (periodo_del_plan) )      
    )    
       
    :effect (and 
        (at start (decrease (cantidad_ha_cultivo ajo)(cantidad_ha_parcela ?parcela_a_sembrar)))
       (at start(increase (costo)(- 1(coeficiente ?parcela_a_sembrar ajo))))             
         (at start (not (parcela_lista_ajo ?parcela_a_sembrar)))        
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))) 
        (at end (ultimo_cultivo ?parcela_a_sembrar ajo))        
        (at end (not(parcela_lista_ajo ?parcela_a_sembrar ) ))             
        (at end  (parcela_libre ?parcela_a_sembrar )) 
        )
)



(:durative-action Cosechar_papa
    :parameters ( ?parcela_a_sembrar - parcela  ?cultivo_anterior - cultivo)
    :duration (= ?duration 3)
    :condition (and             
        (at start (parcela_lista_papa ?parcela_a_sembrar))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))
        (at start (rotacion ?cultivo_anterior papa) )       
        (at start  (>(cantidad_ha_cultivo papa)0))       
        (over all (periodo_del_plan) )
       
    )  
    :effect (and        
       
        (at start (decrease (cantidad_ha_cultivo papa)(cantidad_ha_parcela ?parcela_a_sembrar)))
       (at start(increase (costo)(- 1(coeficiente ?parcela_a_sembrar papa))))    
        (at start (not (parcela_lista_papa ?parcela_a_sembrar)))
         (at end (not(ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))) 
        (at end (ultimo_cultivo ?parcela_a_sembrar papa))       
        (at end (not(parcela_lista_papa ?parcela_a_sembrar ) ))   
        (at end  (parcela_libre ?parcela_a_sembrar ))
     )
)

(:durative-action Cosechar_cebolla
    :parameters ( ?parcela_a_sembrar - parcela  ?cultivo_anterior - cultivo)
    :duration (= ?duration 3)
    :condition (and  
    
       (at start (parcela_lista_cebolla ?parcela_a_sembrar))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))
        (at start (rotacion ?cultivo_anterior cebolla) )       
        (at start  (>(cantidad_ha_cultivo cebolla)0))
        (over all (parcela_lista_cebolla ?parcela_a_sembrar)) 
         (over all (periodo_del_plan) )    
     
    )
    :effect (and 
        (at start (decrease (cantidad_ha_cultivo cebolla)(cantidad_ha_parcela ?parcela_a_sembrar)))
        (at start(increase (costo)(- 1(coeficiente ?parcela_a_sembrar cebolla))))    
         (at start (not (parcela_lista_cebolla ?parcela_a_sembrar)))
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))) 
        (at end (ultimo_cultivo ?parcela_a_sembrar cebolla))
        (at end (not(parcela_lista_cebolla ?parcela_a_sembrar ) ))  
         (at end  (parcela_libre ?parcela_a_sembrar ))               
                     
     )
)
(:durative-action Cosechar_maiz

    :parameters ( ?parcela_a_sembrar - parcela  ?cultivo_anterior - cultivo)
    :duration (= ?duration 3)
    :condition (and 
        (at start (parcela_lista_maiz ?parcela_a_sembrar))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))
        (at start (rotacion ?cultivo_anterior maiz) )       
        (at start  (>(cantidad_ha_cultivo maiz)0))
         (over all (periodo_del_plan) ) 
    )
       
    :effect (and 
        (at start (decrease (cantidad_ha_cultivo maiz)(cantidad_ha_parcela ?parcela_a_sembrar)))
        (at start(increase (costo)(- 1(coeficiente ?parcela_a_sembrar maiz))))  
         (at start (not (parcela_lista_maiz ?parcela_a_sembrar)))
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))) 
        (at end (ultimo_cultivo ?parcela_a_sembrar maiz))
        (at end (not(parcela_lista_maiz ?parcela_a_sembrar )))                
        (at end  (parcela_libre ?parcela_a_sembrar ))          
                        
     )
)

(:durative-action Cosechar_boniato
    :parameters ( ?parcela_a_sembrar - parcela  ?cultivo_anterior - cultivo)
    :duration (= ?duration 4)
    :condition (and         
         (at start (parcela_lista_boniato ?parcela_a_sembrar))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))
        (at start (rotacion ?cultivo_anterior boniato) )       
        (at start  (>(cantidad_ha_cultivo boniato)0))     
         (over all (periodo_del_plan) ) 
       
    )
    :effect (and        
        (at start (decrease (cantidad_ha_cultivo boniato)(cantidad_ha_parcela ?parcela_a_sembrar)))
        (at start(increase (costo)(- 1(coeficiente ?parcela_a_sembrar boniato)))) 
        (at start (not (parcela_lista_boniato ?parcela_a_sembrar)))        
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))) 
        (at end (ultimo_cultivo ?parcela_a_sembrar boniato))        
        (at end (not(parcela_lista_boniato ?parcela_a_sembrar ) ))  
        (at end  (parcela_libre ?parcela_a_sembrar )) 
     )
)
(:durative-action Cosechar_yuca
    :parameters ( ?parcela_a_sembrar - parcela  ?cultivo_anterior - cultivo)
    :duration (= ?duration 11)
    :condition (and      
         (at start (parcela_lista_yuca ?parcela_a_sembrar))
        (at start  (ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))
        (at start (rotacion ?cultivo_anterior yuca) )      
        (at start  (>(cantidad_ha_cultivo yuca)0))
         (over all (periodo_del_plan) )     
      
    ) 
    :effect (and       
        (at start (decrease (cantidad_ha_cultivo yuca)(cantidad_ha_parcela ?parcela_a_sembrar)))
        (at start(increase (costo)(- 1(coeficiente ?parcela_a_sembrar yuca))))         
        (at start (not (parcela_lista_yuca ?parcela_a_sembrar)))        
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))) 
        (at end (ultimo_cultivo ?parcela_a_sembrar yuca))        
        (at end (not(parcela_lista_yuca ?parcela_a_sembrar ) )) 
        (at end  (parcela_libre ?parcela_a_sembrar )) 
     )
)

(:durative-action Cosechar_berenjena
    :parameters ( ?parcela_a_sembrar - parcela  ?cultivo_anterior - cultivo)
    :duration (= ?duration 4)
    :condition (and     
         (at start (parcela_lista_berenjena ?parcela_a_sembrar))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))
        (at start (rotacion ?cultivo_anterior berenjena) )       
        (at start  (>(cantidad_ha_cultivo berenjena)0))
        (over all (periodo_del_plan) ) 
    ) 
    :effect (and 
        (at start (decrease (cantidad_ha_cultivo berenjena)(cantidad_ha_parcela ?parcela_a_sembrar)))
        (at start(increase (costo)(- 1(coeficiente ?parcela_a_sembrar berenjena)))) 
        (at start (not(parcela_lista_berenjena ?parcela_a_sembrar ) )) 
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))) 
        (at end (ultimo_cultivo ?parcela_a_sembrar berenjena))      
        (at end (not(parcela_lista_berenjena ?parcela_a_sembrar ) ))                 
         (at end  (parcela_libre ?parcela_a_sembrar ))         
                         
                        
     )
)
(:durative-action Cosechar_calabaza
    :parameters ( ?parcela_a_sembrar - parcela  ?cultivo_anterior - cultivo)
    :duration (= ?duration 3)
    :condition (and 
        (at start (parcela_lista_calabaza ?parcela_a_sembrar))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))
        (at start (rotacion ?cultivo_anterior calabaza) )       
        (at start  (>(cantidad_ha_cultivo calabaza)0))
         (over all (periodo_del_plan) ) 
      
    )
    :effect (and 
        (at start (decrease (cantidad_ha_cultivo calabaza)(cantidad_ha_parcela ?parcela_a_sembrar)))
        (at start(increase (costo)(- 1(coeficiente ?parcela_a_sembrar calabaza))))       
         (at start (not(parcela_lista_calabaza ?parcela_a_sembrar ) )) 
         (at end (not(ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))) 
        (at end (ultimo_cultivo ?parcela_a_sembrar calabaza))       
        (at end (not(parcela_lista_calabaza ?parcela_a_sembrar ) ))                
        (at end  (parcela_libre ?parcela_a_sembrar )) 
     )
)

(:durative-action Cosechar_col
    :parameters ( ?parcela_a_sembrar - parcela  ?cultivo_anterior - cultivo)
    :duration (= ?duration 3)
    :condition (and  
         (at start (parcela_lista_col ?parcela_a_sembrar))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))
        (at start (rotacion ?cultivo_anterior col) )       
        (at start  (>(cantidad_ha_cultivo col)0))        
        (over all (periodo_del_plan) ) 
    )
     :effect (and 
        (at start (decrease (cantidad_ha_cultivo col)(cantidad_ha_parcela ?parcela_a_sembrar)))
        (at start(increase (costo)(- 1(coeficiente ?parcela_a_sembrar col)))) 
        (at start (not(parcela_lista_col ?parcela_a_sembrar ) ))       
        (at end (ultimo_cultivo ?parcela_a_sembrar col))
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))) 
        (at end (not(parcela_lista_col ?parcela_a_sembrar ) ))                 
          (at end  (parcela_libre ?parcela_a_sembrar ))   
     )
)
(:durative-action Cosechar_frijol_caupi
    :parameters ( ?parcela_a_sembrar - parcela  ?cultivo_anterior - cultivo)
    :duration (= ?duration 5)
    :condition (and 
          (at start (parcela_lista_frijol_caupi ?parcela_a_sembrar))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))
        (at start (rotacion ?cultivo_anterior frijol_caupi) )       
        (at start  (>(cantidad_ha_cultivo frijol_caupi)0))
         (over all (periodo_del_plan) ) 
    ) 
    :effect (and 
        (at start (decrease (cantidad_ha_cultivo frijol_caupi)(cantidad_ha_parcela ?parcela_a_sembrar)))
        (at start(increase (costo)(- 1(coeficiente ?parcela_a_sembrar frijol_caupi)))) 
          (at start (not(parcela_lista_frijol_caupi ?parcela_a_sembrar ) ))
         (at end (not(ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))) 
        (at end (ultimo_cultivo ?parcela_a_sembrar frijol_caupi))       
        (at end (not(parcela_lista_frijol_caupi ?parcela_a_sembrar ) ))                
        (at end  (parcela_libre ?parcela_a_sembrar ))        
     )
)
(:durative-action Cosechar_frijol_colorado
    :parameters ( ?parcela_a_sembrar - parcela  ?cultivo_anterior - cultivo)
    :duration (= ?duration 3)
    :condition (and 
        (at start (parcela_lista_frijol_colorado ?parcela_a_sembrar)) 
        (at start (ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))
        (at start (rotacion ?cultivo_anterior frijol_colorado) )       
        (at start  (>(cantidad_ha_cultivo frijol_colorado)0))
         (over all (periodo_del_plan) ) 
    )   
    :effect (and 
        (at start (decrease (cantidad_ha_cultivo frijol_colorado)(cantidad_ha_parcela ?parcela_a_sembrar)))
        (at start(increase (costo)(- 1(coeficiente ?parcela_a_sembrar frijol_colorado)))) 
         (at start (not(parcela_lista_frijol_colorado ?parcela_a_sembrar ) )) 
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))) 
        (at end (ultimo_cultivo ?parcela_a_sembrar frijol_colorado))        
        (at end (not(parcela_lista_frijol_colorado ?parcela_a_sembrar ) ))                
         (at end  (parcela_libre ?parcela_a_sembrar )) 
     )
)

(:durative-action Cosechar_frutabomba
    :parameters ( ?parcela_a_sembrar - parcela  ?cultivo_anterior - cultivo)
    :duration (= ?duration 6)
    :condition (and 
        (at start (parcela_lista_frutabomba ?parcela_a_sembrar))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))
        (at start (rotacion ?cultivo_anterior frutabomba) )       
        (at start  (>(cantidad_ha_cultivo frutabomba)0))        
        (over all (periodo_del_plan) ) 
         )
  
    :effect (and       
        (at start (decrease (cantidad_ha_cultivo frutabomba)(cantidad_ha_parcela ?parcela_a_sembrar)))
        (at start(increase (costo)(- 1(coeficiente ?parcela_a_sembrar frutabomba)))) 
         (at start (not(parcela_lista_frutabomba ?parcela_a_sembrar ) ))        
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))) 
        (at end (ultimo_cultivo ?parcela_a_sembrar frutabomba))        
        (at end  (parcela_libre ?parcela_a_sembrar ))              
        (at end (not(parcela_lista_frutabomba ?parcela_a_sembrar ) ))  
        )
)
(:durative-action Cosechar_malanga_xantosoma
    :parameters ( ?parcela_a_sembrar - parcela  ?cultivo_anterior - cultivo)
    :duration (= ?duration 11)
    :condition (and 
        (at start (parcela_lista_malanga_xantosoma ?parcela_a_sembrar))       
        (at start (ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))
        (at start (rotacion ?cultivo_anterior malanga_xantosoma) )       
        (at start  (>(cantidad_ha_cultivo malanga_xantosoma)0))
        (over all (periodo_del_plan) ) 
    ) 
    :effect (and 
        (at start (decrease (cantidad_ha_cultivo malanga_xantosoma)(cantidad_ha_parcela ?parcela_a_sembrar)))
        (at start(increase (costo)(- 1(coeficiente ?parcela_a_sembrar malanga_xantosoma)))) 
         (at start (not(parcela_lista_malanga_xantosoma ?parcela_a_sembrar ) ))          
          (at end (not(ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))) 
        (at end (ultimo_cultivo ?parcela_a_sembrar malanga_xantosoma))      
        (at end (not(parcela_lista_malanga_xantosoma ?parcela_a_sembrar ) ))                
         (at end  (parcela_libre ?parcela_a_sembrar ))             
                        
     )
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(:durative-action Cosechar_malanga_colocasia
    :parameters ( ?parcela_a_sembrar - parcela  ?cultivo_anterior - cultivo)
    :duration (= ?duration 11)
    :condition (and  
         (at start (parcela_lista_malanga_colocasia ?parcela_a_sembrar))          
        (at start (temporada_malanga_colocasia))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))
        (at start (rotacion ?cultivo_anterior malanga_colocasia) )       
        (at start  (>(cantidad_ha_cultivo malanga_colocasia)0))
         (over all (periodo_del_plan) )       
    ) 
    :effect (and
        (at start (decrease (cantidad_ha_cultivo malanga_colocasia)(cantidad_ha_parcela ?parcela_a_sembrar)))
        (at start(increase (costo)(- 1(coeficiente ?parcela_a_sembrar malanga_colocasia)))) 
          (at start (not(parcela_lista_malanga_colocasia ?parcela_a_sembrar ) ))  
         (at end (not(ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))) 
        (at end (ultimo_cultivo ?parcela_a_sembrar malanga_colocasia))       
        (at end (not(parcela_lista_malanga_colocasia ?parcela_a_sembrar ) ))                 
        (at end  (parcela_libre ?parcela_a_sembrar )) 
     )
)
(:durative-action Cosechar_pimiento
    :parameters ( ?parcela_a_sembrar - parcela  ?cultivo_anterior - cultivo)
    :duration (= ?duration 3)
    :condition (and     
        (at start (parcela_lista_pimiento ?parcela_a_sembrar))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))
        (at start (rotacion ?cultivo_anterior pimiento) )       
        (at start  (>(cantidad_ha_cultivo pimiento)0))
        (over all (periodo_del_plan) )       
    )      
    :effect (and 
        (at start (decrease (cantidad_ha_cultivo pimiento)(cantidad_ha_parcela ?parcela_a_sembrar)))
        (at start(increase (costo)(- 1(coeficiente ?parcela_a_sembrar pimiento)))) 
          (at start (not(parcela_lista_pimiento ?parcela_a_sembrar ) )) 
         (at end (not(ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))) 
        (at end (ultimo_cultivo ?parcela_a_sembrar pimiento))       
        (at end (not(parcela_lista_pimiento ?parcela_a_sembrar ) ))                
          (at end  (parcela_libre ?parcela_a_sembrar )) 
     )
)
(:durative-action Cosechar_platano_burro
    :parameters ( ?parcela_a_sembrar - parcela  ?cultivo_anterior - cultivo)
    :duration (= ?duration 11)
    :condition (and 
        (at start (parcela_lista_platano_burro ?parcela_a_sembrar))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))
        (at start (rotacion ?cultivo_anterior platano_burro) )       
        (at start  (>(cantidad_ha_cultivo platano_burro)0))       
        (over all (periodo_del_plan) )
    )
    :effect (and
        (at start (decrease (cantidad_ha_cultivo platano_burro)(cantidad_ha_parcela ?parcela_a_sembrar)))
        (at start(increase (costo)(- 1(coeficiente ?parcela_a_sembrar platano_burro)))) 
        (at start (not(parcela_lista_platano_burro ?parcela_a_sembrar ) ))        
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))) 
        (at end (ultimo_cultivo ?parcela_a_sembrar platano_burro))       
        (at end (not(parcela_lista_platano_burro ?parcela_a_sembrar ) ))                 
        (at end  (parcela_libre ?parcela_a_sembrar ))  
     )
)
(:durative-action Cosechar_platano_fruta
    :parameters ( ?parcela_a_sembrar - parcela  ?cultivo_anterior - cultivo)
    :duration (= ?duration 11)
    :condition (and 
        (at start(parcela_lista_platano_fruta ?parcela_a_sembrar)) 
        (at start (ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))
        (at start (rotacion ?cultivo_anterior platano_fruta) )       
        (at start  (>(cantidad_ha_cultivo platano_fruta)0))       
        (over all (periodo_del_plan) )
    )
    :effect (and 
        (at start (decrease (cantidad_ha_cultivo platano_fruta)(cantidad_ha_parcela ?parcela_a_sembrar)))
        (at start(increase (costo)(- 1(coeficiente ?parcela_a_sembrar platano_fruta))))  
         (at start (not(parcela_lista_platano_fruta ?parcela_a_sembrar ) ))     
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?cultivo_anterior))) 
        (at end (ultimo_cultivo ?parcela_a_sembrar platano_fruta))        
        (at end (not(parcela_lista_platano_fruta ?parcela_a_sembrar ) ))                
        (at end  (parcela_libre ?parcela_a_sembrar )) 
     )
)

)