;Header and description

(define (domain agricultura)

;remove requirements that are not needed
(:requirements :strips :fluents :typing :conditional-effects :negative-preconditions :equality  :durative-actions :timed-initial-literals)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle

 cultivo parcela fecha familia 

)

; un-comment following line if constants are needed
(:constants 
papa yuca boniato ajo berenjena calabaza cebolla col frijol_caupi frijol_colorado frijol_negro frutabomba malanga_xantanosa malanga_colacacia maiz pimiento platano_burro platano_fruta tomate Ningun_cultivo - cultivo
SOLANACEAS  LILIACEAS CRUCIFERAS ALEACEAS COMPUESTAS  LEGUMINOSA Ninguna_familia UMBELIFERAS LEGUMINOSAS QUENOPODIACEAS CUCURBITACEAS - familia
)

(:predicates ;todo: define predicates here
 (parcela_libre ?par - parcela)
 (parcela_sembrada ?par - parcela ?cul - cultivo ) 
 (temporada ?cul - cultivo ?fechainicio ?fechafin - fecha )
 (orden_meses ?anterior ?posterior - fecha) 
  (periodo_del_plan)
 (ultimo_cultivo ?parcela_a_sembrar - parcela ?fami - familia)
 (rotacion ?familia_ultimo_cultivo ?familia_cultivo_a_sembrar - familia) 
 (parcelas_vecinas ?parcela_a_sembrar ?parcela_vecina - parcela )
 (parcela_lista_papa ?parcela_a_sembrar)
 
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
 (temporada_fruta_bomba)
 (temporada_frijol_caupi)
 (parcela_ocupada ?par - parcela)
 (temporada_malanga_xantosoma)
 (temporada_pimiento)
 (temporada_platano_burro)
 (temporada_malanga_colocacia)
 (ordenar)
 
)
(:functions ;todo: define numeric functions here
(cantidad_ha_cultivo ?cul - cultivo)
(cantidad_ha_parcela ?par - parcela)
(coeficiente ?par - parcela ?cul - cultivo)
(costo)
(orden_meses ?mes - fecha)


)
(:durative-action preparar_terreno_papa
    :parameters (?parcela_a_sembrar - parcela)
    :duration (= ?duration 3)
    :condition (and 
        (at start (parcela_libre ?parcela_a_sembrar
        ))
        (over all (parcela_libre ?parcela_a_sembrar 
        ))
        (at end (temporada_papa 
        ))
    )
    :effect (and 
        (at start (not (parcela_libre ?parcela_a_sembrar
        )))
        (at end ( parcela_lista_papa 
        ))
    )
)

(:durative-action Cosechar_papa
    :parameters ( ?parcela_a_sembrar - parcela  ?familia_ultimo_cultivo - familia)
    :duration (= ?duration 3)
    :condition (and  
    
        (at start (periodo_del_plan))    
        (at start  (temporada_papa))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))
        (at start (rotacion ?familia_ultimo_cultivo SOLANACEAS) )       
        (at start  (>(cantidad_ha_cultivo papa)0))
        (at start (parcela_libre ?parcela_a_sembrar)) 
        ;(at end  (temporada_papa))
        (at end (periodo_del_plan) )
    )
  
      
       
    :effect (and 
        (at start (not(parcela_libre ?parcela_a_sembrar ) ))
        (at start (decrease (cantidad_ha_cultivo papa)(*(cantidad_ha_parcela ?parcela_a_sembrar)(coeficiente ?parcela_a_sembrar papa))))
        (at start(increase (costo)(*(*(cantidad_ha_cultivo papa)(cantidad_ha_parcela ?parcela_a_sembrar )) (coeficiente ?parcela_a_sembrar papa ))))
        (at end  (parcela_libre ?parcela_a_sembrar ))
        (at end (ultimo_cultivo ?parcela_a_sembrar SOLANACEAS))
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))) 
                      
                      
                         
                        
     )
)    
(:durative-action Cosechar_boniato
    :parameters ( ?parcela_a_sembrar - parcela  ?familia_ultimo_cultivo - familia)
    :duration (= ?duration 4)
    :condition (and  
    
        (at start (periodo_del_plan))    
         (at start (temporada_boniato))   
       
        (at start (ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))
        (at start (rotacion ?familia_ultimo_cultivo CRUCIFERAS) )       
        (at start  (>(cantidad_ha_cultivo boniato)0))
        (at start (parcela_libre ?parcela_a_sembrar)) 
        (at end (periodo_del_plan) )
        ; (at end  (temporada_boniato))
    )
  
      
       
    :effect (and 
        (at start (not(parcela_libre ?parcela_a_sembrar ) ))
        (at start (decrease (cantidad_ha_cultivo boniato)(*(cantidad_ha_parcela ?parcela_a_sembrar)(coeficiente ?parcela_a_sembrar boniato))))
        (at start(increase (costo)(*(*(cantidad_ha_cultivo boniato)(cantidad_ha_parcela ?parcela_a_sembrar )) (coeficiente ?parcela_a_sembrar boniato ))))
        (at end  (parcela_libre ?parcela_a_sembrar ))
        (at end (ultimo_cultivo ?parcela_a_sembrar CRUCIFERAS))
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))) 
                      
                      
                         
                        
     )
)
(:durative-action Cosechar_yuca
    :parameters ( ?parcela_a_sembrar - parcela  ?familia_ultimo_cultivo - familia)
    :duration (= ?duration 11)
    :condition (and  
    
        (at start (periodo_del_plan))    
          (at start (temporada_yuca))   
        (at start (ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))
        (at start (rotacion ?familia_ultimo_cultivo LILIACEAS) )       
        (at start  (>(cantidad_ha_cultivo yuca)0))
        (at start (parcela_libre ?parcela_a_sembrar)) 
        (at end (periodo_del_plan))
       ; (at end (temporada_yuca))
    )
  
      
       
    :effect (and 
        (at start (not(parcela_libre ?parcela_a_sembrar ) ))
        (at start (decrease (cantidad_ha_cultivo yuca)(*(cantidad_ha_parcela ?parcela_a_sembrar)(coeficiente ?parcela_a_sembrar yuca))))
        (at start(increase (costo)(*(*(cantidad_ha_cultivo yuca)(cantidad_ha_parcela ?parcela_a_sembrar )) (coeficiente ?parcela_a_sembrar yuca ))))
        (at end  (parcela_libre ?parcela_a_sembrar ))
        (at end (ultimo_cultivo ?parcela_a_sembrar LILIACEAS))
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))) 
                      
                      
                         
                        
     )
)
(:durative-action Cosechar_ajo
    :parameters ( ?parcela_a_sembrar - parcela  ?familia_ultimo_cultivo - familia)
    :duration (= ?duration 2)
    :condition (and  
    
        (at start (periodo_del_plan))    
         (at start (temporada_yuca))   
        (at start (ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))
        (at start (rotacion ?familia_ultimo_cultivo ALEACEAS) )       
        (at start  (>(cantidad_ha_cultivo ajo)0))
        (at start (parcela_libre ?parcela_a_sembrar)) 
        (at end (periodo_del_plan) )
        ; (at end (temporada_ajo))
       
    )
  
      
       
    :effect (and 
        (at start (not(parcela_libre ?parcela_a_sembrar ) ))
        (at start (decrease (cantidad_ha_cultivo ajo)(*(cantidad_ha_parcela ?parcela_a_sembrar)(coeficiente ?parcela_a_sembrar ajo))))
        (at start(increase (costo)(*(*(cantidad_ha_cultivo ajo)(cantidad_ha_parcela ?parcela_a_sembrar )) (coeficiente ?parcela_a_sembrar ajo ))))
        (at end  (parcela_libre ?parcela_a_sembrar ))
        (at end (ultimo_cultivo ?parcela_a_sembrar LILIACEAS))
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))) 
                      
                      
                         
                        
     )
)
(:durative-action Cosechar_berenjena
    :parameters ( ?parcela_a_sembrar - parcela  ?familia_ultimo_cultivo - familia)
    :duration (= ?duration 4)
    :condition (and  
    
        (at start (periodo_del_plan))    
        (at start (temporada_berenjena))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))
        (at start (rotacion ?familia_ultimo_cultivo SOLANACEAS) )       
        (at start  (>(cantidad_ha_cultivo berenjena)0))
        (at start (parcela_libre ?parcela_a_sembrar)) 
        (at end (periodo_del_plan) )
        ;(at end (temporada_berenjena))
       
    )
  
      
       
    :effect (and 
        (at start (not(parcela_libre ?parcela_a_sembrar ) ))
        (at start (decrease (cantidad_ha_cultivo berenjena)(*(cantidad_ha_parcela ?parcela_a_sembrar)(coeficiente ?parcela_a_sembrar berenjena))))
        (at start(increase (costo)(*(*(cantidad_ha_cultivo berenjena)(cantidad_ha_parcela ?parcela_a_sembrar )) (coeficiente ?parcela_a_sembrar berenjena ))))
        (at end  (parcela_libre ?parcela_a_sembrar ))
        (at end (ultimo_cultivo ?parcela_a_sembrar SOLANACEAS))
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))) 
                      
                      
                         
                        
     )
)
(:durative-action Cosechar_calabaza
    :parameters ( ?parcela_a_sembrar - parcela  ?familia_ultimo_cultivo - familia)
    :duration (= ?duration 3)
    :condition (and  
    
        (at start (periodo_del_plan))    
        (at start (temporada_calabaza))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))
        (at start (rotacion ?familia_ultimo_cultivo CRUCIFERAS) )       
        (at start  (>(cantidad_ha_cultivo calabaza)0))
        (at start (parcela_libre ?parcela_a_sembrar)) 
        (at end (periodo_del_plan) )
       ; (at end (temporada_calabaza))
    )
  
      
       
    :effect (and 
        (at start (not(parcela_libre ?parcela_a_sembrar ) ))
        (at start (decrease (cantidad_ha_cultivo calabaza)(*(cantidad_ha_parcela ?parcela_a_sembrar)(coeficiente ?parcela_a_sembrar calabaza))))
        (at start(increase (costo)(*(*(cantidad_ha_cultivo berenjena)(cantidad_ha_parcela ?parcela_a_sembrar )) (coeficiente ?parcela_a_sembrar calabaza ))))
        (at end  (parcela_libre ?parcela_a_sembrar ))
        (at end (ultimo_cultivo ?parcela_a_sembrar CRUCIFERAS))
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))) 
                      
                      
                         
                        
     )
)
(:durative-action Cosechar_cebolla
    :parameters ( ?parcela_a_sembrar - parcela  ?familia_ultimo_cultivo - familia)
    :duration (= ?duration 3)
    :condition (and  
    
        (at start (periodo_del_plan))    
        (at start (temporada_cebolla))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))
        (at start (rotacion ?familia_ultimo_cultivo ALEACEAS) )       
        (at start  (>(cantidad_ha_cultivo cebolla)0))
        (at start (parcela_libre ?parcela_a_sembrar)) 
        (at end (periodo_del_plan) )
      ;  (at end (temporada_cebolla))
    )
  
      
       
    :effect (and 
        (at start (not(parcela_libre ?parcela_a_sembrar ) ))
        (at start (decrease (cantidad_ha_cultivo cebolla)(*(cantidad_ha_parcela ?parcela_a_sembrar)(coeficiente ?parcela_a_sembrar cebolla))))
        (at start(increase (costo)(*(*(cantidad_ha_cultivo cebolla)(cantidad_ha_parcela ?parcela_a_sembrar )) (coeficiente ?parcela_a_sembrar cebolla ))))
        (at end  (parcela_libre ?parcela_a_sembrar ))
        (at end (ultimo_cultivo ?parcela_a_sembrar ALEACEAS))
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))) 
                      
                      
                         
                        
     )
)
(:durative-action Cosechar_col
    :parameters ( ?parcela_a_sembrar - parcela  ?familia_ultimo_cultivo - familia)
    :duration (= ?duration 3)
    :condition (and  
    
        (at start (periodo_del_plan))    
        (at start (temporada_col))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))
        (at start (rotacion ?familia_ultimo_cultivo CRUCIFERAS) )       
        (at start  (>(cantidad_ha_cultivo col)0))
        (at start (parcela_libre ?parcela_a_sembrar)) 
        (at end (periodo_del_plan) )
       ; (at end (temporada_col))
    )
  
      
       
    :effect (and 
        (at start (not(parcela_libre ?parcela_a_sembrar ) ))
        (at start (decrease (cantidad_ha_cultivo col)(*(cantidad_ha_parcela ?parcela_a_sembrar)(coeficiente ?parcela_a_sembrar col))))
        (at start(increase (costo)(*(*(cantidad_ha_cultivo cebolla)(cantidad_ha_parcela ?parcela_a_sembrar )) (coeficiente ?parcela_a_sembrar col))))
        (at end  (parcela_libre ?parcela_a_sembrar ))
        (at end (ultimo_cultivo ?parcela_a_sembrar CRUCIFERAS))
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))) 
                      
                      
                         
                        
     )
)
(:durative-action Cosechar_frijo_caupi
    :parameters ( ?parcela_a_sembrar - parcela  ?familia_ultimo_cultivo - familia)
    :duration (= ?duration 5)
    :condition (and  
    
        (at start (periodo_del_plan))    
        (at start (temporada_frijol_caupi))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))
        (at start (rotacion ?familia_ultimo_cultivo LILIACEAS) )       
        (at start  (>(cantidad_ha_cultivo frijol_caupi)0))
        (at start (parcela_libre ?parcela_a_sembrar)) 
        (at end (periodo_del_plan) )
       ; (at end  (temporada_frijol_caupi))
    )
  
      
       
    :effect (and 
        (at start (not(parcela_libre ?parcela_a_sembrar ) ))
        (at start (decrease (cantidad_ha_cultivo frijol_caupi)(*(cantidad_ha_parcela ?parcela_a_sembrar)(coeficiente ?parcela_a_sembrar frijol_caupi))))
        (at start(increase (costo)(*(*(cantidad_ha_cultivo cebolla)(cantidad_ha_parcela ?parcela_a_sembrar )) (coeficiente ?parcela_a_sembrar frijol_caupi))))
        (at end  (parcela_libre ?parcela_a_sembrar ))
        (at end (ultimo_cultivo ?parcela_a_sembrar LILIACEAS))
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))) 
                      
                      
                         
                        
     )
)
(:durative-action Cosechar_frijol_colorado
    :parameters ( ?parcela_a_sembrar - parcela  ?familia_ultimo_cultivo - familia)
    :duration (= ?duration 3)
    :condition (and  
    
        (at start (periodo_del_plan))    
        (at start (temporada_frijol_colorado))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))
        (at start (rotacion ?familia_ultimo_cultivo COMPUESTAS) )       
        (at start  (>(cantidad_ha_cultivo frijol_colorado)0))
        (at start (parcela_libre ?parcela_a_sembrar)) 
        (at end (periodo_del_plan) )
       ; (at end (temporada_frijol_colorado))
    )
  
      
       
    :effect (and 
        (at start (not(parcela_libre ?parcela_a_sembrar ) ))
        (at start (decrease (cantidad_ha_cultivo frijol_colorado)(*(cantidad_ha_parcela ?parcela_a_sembrar)(coeficiente ?parcela_a_sembrar frijol_colorado))))
        (at start(increase (costo)(*(*(cantidad_ha_cultivo frijol_colorado)(cantidad_ha_parcela ?parcela_a_sembrar )) (coeficiente ?parcela_a_sembrar frijol_colorado))))
        (at end  (parcela_libre ?parcela_a_sembrar ))
        (at end (ultimo_cultivo ?parcela_a_sembrar COMPUESTAS))
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))) 
                      
                      
                         
                        
     )
)
(:durative-action Cosechar_frijol_negro
    :parameters ( ?parcela_a_sembrar - parcela  ?familia_ultimo_cultivo - familia)
    :duration (= ?duration 3)
    :condition (and  
    
        (at start (periodo_del_plan))    
        (at start (temporada_frijol_negro))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))
        (at start (rotacion ?familia_ultimo_cultivo COMPUESTAS) )       
        (at start  (>(cantidad_ha_cultivo frijol_negro)0))
        (at start (parcela_libre ?parcela_a_sembrar)) 
        (at end (periodo_del_plan) )
      ;  (at end (temporada_frijol_negro))
    )
  
      
       
    :effect (and 
        (at start (not(parcela_libre ?parcela_a_sembrar ) ))
        (at start (decrease (cantidad_ha_cultivo frijol_negro)(*(cantidad_ha_parcela ?parcela_a_sembrar)(coeficiente ?parcela_a_sembrar frijol_negro))))
        (at start(increase (costo)(*(*(cantidad_ha_cultivo frijol_negro)(cantidad_ha_parcela ?parcela_a_sembrar )) (coeficiente ?parcela_a_sembrar frijol_negro))))
        (at end  (parcela_libre ?parcela_a_sembrar ))
        (at end (ultimo_cultivo ?parcela_a_sembrar COMPUESTAS))
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))) 
                      
                      
                         
                        
     )
)
(:durative-action Cosechar_frutabomba
    :parameters ( ?parcela_a_sembrar - parcela  ?familia_ultimo_cultivo - familia)
    :duration (= ?duration 6)
    :condition (and  
    
        (at start (periodo_del_plan))    
        (at start (temporada_fruta_bomba))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))
        (at start (rotacion ?familia_ultimo_cultivo COMPUESTAS) )       
        (at start  (>(cantidad_ha_cultivo frutabomba)0))
        (at start (parcela_libre ?parcela_a_sembrar)) 
        (at end (periodo_del_plan) )
       ; (at end (temporada_fruta_bomba))
       
    )
  
      
       
    :effect (and 
        (at start (not(parcela_libre ?parcela_a_sembrar ) ))
        (at start (decrease (cantidad_ha_cultivo frutabomba)(*(cantidad_ha_parcela ?parcela_a_sembrar)(coeficiente ?parcela_a_sembrar frutabomba))))
        (at start(increase (costo)(*(*(cantidad_ha_cultivo frutabomba)(cantidad_ha_parcela ?parcela_a_sembrar )) (coeficiente ?parcela_a_sembrar frutabomba))))
        (at end  (parcela_libre ?parcela_a_sembrar ))
        (at end (ultimo_cultivo ?parcela_a_sembrar COMPUESTAS))
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))) 
                      
                      
                         
                        
     )
)
(:durative-action Cosechar_malanga_xantanosa
    :parameters ( ?parcela_a_sembrar - parcela  ?familia_ultimo_cultivo - familia)
    :duration (= ?duration 11)
    :condition (and  
    
        (at start (periodo_del_plan))    
        (at start (temporada_malanga_xantosoma))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))
        (at start (rotacion ?familia_ultimo_cultivo CRUCIFERAS) )       
        (at start  (>(cantidad_ha_cultivo malanga_xantanosa)0))
        (at start (parcela_libre ?parcela_a_sembrar)) 
        (at end (periodo_del_plan) )
       ; (at end (temporada_malanga_xantosoma))
    )
  
      
       
    :effect (and 
        (at start (not(parcela_libre ?parcela_a_sembrar ) ))
        (at start (decrease (cantidad_ha_cultivo malanga_xantanosa)(*(cantidad_ha_parcela ?parcela_a_sembrar)(coeficiente ?parcela_a_sembrar malanga_xantanosa))))
        (at start(increase (costo)(*(*(cantidad_ha_cultivo malanga_xantanosa)(cantidad_ha_parcela ?parcela_a_sembrar )) (coeficiente ?parcela_a_sembrar malanga_xantanosa))))
        (at end  (parcela_libre ?parcela_a_sembrar ))
        (at end (ultimo_cultivo ?parcela_a_sembrar CRUCIFERAS))
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))) 
                      
                      
                         
                        
     )
)
(:durative-action Cosechar_malanga_colocacia
    :parameters ( ?parcela_a_sembrar - parcela  ?familia_ultimo_cultivo - familia)
    :duration (= ?duration 11)
    :condition (and  
    
        (at start (periodo_del_plan))    
        (at start (temporada_malanga_colocacia))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))
        (at start (rotacion ?familia_ultimo_cultivo COMPUESTAS) )       
        (at start  (>(cantidad_ha_cultivo malanga_colacacia)0))
        (at start (parcela_libre ?parcela_a_sembrar)) 
        (at end (periodo_del_plan) )
       ; (at end (temporada_malanga_colocacia))
    )
  
      
       
    :effect (and 
        (at start (not(parcela_libre ?parcela_a_sembrar ) ))
        (at start (decrease (cantidad_ha_cultivo malanga_colacacia)(*(cantidad_ha_parcela ?parcela_a_sembrar)(coeficiente ?parcela_a_sembrar malanga_colacacia))))
        (at start(increase (costo)(*(*(cantidad_ha_cultivo malanga_colacacia)(cantidad_ha_parcela ?parcela_a_sembrar )) (coeficiente ?parcela_a_sembrar malanga_colacacia))))
        (at end  (parcela_libre ?parcela_a_sembrar ))
        (at end (ultimo_cultivo ?parcela_a_sembrar COMPUESTAS))
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))) 
                      
                      
                         
                        
     )
)
(:durative-action Cosechar_pimiento
    :parameters ( ?parcela_a_sembrar - parcela  ?familia_ultimo_cultivo - familia)
    :duration (= ?duration 3)
    :condition (and  
    
        (at start (periodo_del_plan))    
         (at start (temporada_pimiento))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))
        (at start (rotacion ?familia_ultimo_cultivo ALEACEAS) )       
        (at start  (>(cantidad_ha_cultivo pimiento)0))
        (at start (parcela_libre ?parcela_a_sembrar)) 
        (at end (periodo_del_plan) )
       ; (at end (temporada_pimiento))
       
    )
  
      
       
    :effect (and 
        (at start (not(parcela_libre ?parcela_a_sembrar ) ))
        (at start (decrease (cantidad_ha_cultivo pimiento)(*(cantidad_ha_parcela ?parcela_a_sembrar)(coeficiente ?parcela_a_sembrar pimiento))))
        (at start(increase (costo)(*(*(cantidad_ha_cultivo malanga_colacacia)(cantidad_ha_parcela ?parcela_a_sembrar )) (coeficiente ?parcela_a_sembrar pimiento))))
        (at end  (parcela_libre ?parcela_a_sembrar ))
        (at end (ultimo_cultivo ?parcela_a_sembrar ALEACEAS))
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))) 
                      
                      
                         
                        
     )
)
(:durative-action Cosechar_platano_burro
    :parameters ( ?parcela_a_sembrar - parcela  ?familia_ultimo_cultivo - familia)
    :duration (= ?duration 11)
    :condition (and  
    
        (at start (periodo_del_plan))    
        (at start (temporada_platano_burro))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))
        (at start (rotacion ?familia_ultimo_cultivo LEGUMINOSA) )       
        (at start  (>(cantidad_ha_cultivo platano_burro)0))
        (at start (parcela_libre ?parcela_a_sembrar)) 
        (at end (periodo_del_plan) )
       ; (at end (temporada_platano_burro))
       
    )
  
      
       
    :effect (and 
        (at start (not(parcela_libre ?parcela_a_sembrar ) ))
        (at start (decrease (cantidad_ha_cultivo platano_burro)(*(cantidad_ha_parcela ?parcela_a_sembrar)(coeficiente ?parcela_a_sembrar platano_burro))))
        (at start(increase (costo)(*(*(cantidad_ha_cultivo platano_burro)(cantidad_ha_parcela ?parcela_a_sembrar )) (coeficiente ?parcela_a_sembrar platano_burro))))
        (at end  (parcela_libre ?parcela_a_sembrar ))
        (at end (ultimo_cultivo ?parcela_a_sembrar LEGUMINOSA))
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))) 
                      
                      
                         
                        
     )
)
(:durative-action Cosechar_platano_fruta
    :parameters ( ?parcela_a_sembrar - parcela  ?familia_ultimo_cultivo - familia)
    :duration (= ?duration 11)
    :condition (and  
    
        (at start (periodo_del_plan))    
        (at start (temporada_platano_fruta))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))
        (at start (rotacion ?familia_ultimo_cultivo COMPUESTAS) )       
        (at start  (>(cantidad_ha_cultivo platano_fruta)0))
        (at start (parcela_libre ?parcela_a_sembrar)) 
        (at end (periodo_del_plan) )
      ;  (at end (temporada_platano_fruta))
       
    )
  
      
       
    :effect (and 
        (at start (not(parcela_libre ?parcela_a_sembrar ) ))
        (at start (decrease (cantidad_ha_cultivo platano_fruta)(*(cantidad_ha_parcela ?parcela_a_sembrar)(coeficiente ?parcela_a_sembrar platano_fruta))))
        (at start(increase (costo)(*(*(cantidad_ha_cultivo platano_fruta)(cantidad_ha_parcela ?parcela_a_sembrar )) (coeficiente ?parcela_a_sembrar platano_fruta))))
        (at end  (parcela_libre ?parcela_a_sembrar ))
        (at end (ultimo_cultivo ?parcela_a_sembrar COMPUESTAS))
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))) 
                      
                      
                         
                        
     )
)
(:durative-action Cosechar_tomate
    :parameters ( ?parcela_a_sembrar - parcela  ?familia_ultimo_cultivo - familia)
    :duration (= ?duration 4)
    :condition (and  
    
        (at start (periodo_del_plan))    
        (at start (temporada_tomate))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))
        (at start (rotacion ?familia_ultimo_cultivo SOLANACEAS) )       
        (at start  (>(cantidad_ha_cultivo tomate)0))
        (at start (parcela_libre ?parcela_a_sembrar)) 
        (at end (periodo_del_plan) )
       ; (at end (temporada_tomate))
       
    )
  
      
       
    :effect (and 
        (at start (not(parcela_libre ?parcela_a_sembrar ) ))
        (at start (decrease (cantidad_ha_cultivo tomate)(*(cantidad_ha_parcela ?parcela_a_sembrar)(coeficiente ?parcela_a_sembrar tomate))))
        (at start(increase (costo)(*(*(cantidad_ha_cultivo tomate)(cantidad_ha_parcela ?parcela_a_sembrar )) (coeficiente ?parcela_a_sembrar tomate))))
        (at end  (parcela_libre ?parcela_a_sembrar ))
        (at end (ultimo_cultivo ?parcela_a_sembrar SOLANACEAS))
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))) 
                      
                      
                         
                        
     )
)
(:durative-action Cosechar_maiz
    :parameters ( ?parcela_a_sembrar - parcela  ?familia_ultimo_cultivo - familia)
    :duration (= ?duration 3)
    :condition (and  
    
        (at start (periodo_del_plan))    
        (at start (temporada_maiz))
        (at start (ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))
        (at start (rotacion ?familia_ultimo_cultivo LILIACEAS) )       
        (at start  (>(cantidad_ha_cultivo maiz)0))
        (at start (parcela_libre ?parcela_a_sembrar)) 
        (at end (periodo_del_plan) )
       ; (at end (temporada_maiz))
       
    )
  
      
       
    :effect (and 
        (at start (not(parcela_libre ?parcela_a_sembrar ) ))
        (at start (decrease (cantidad_ha_cultivo maiz)(*(cantidad_ha_parcela ?parcela_a_sembrar)(coeficiente ?parcela_a_sembrar maiz))))
        (at start(increase (costo)(*(*(cantidad_ha_cultivo maiz)(cantidad_ha_parcela ?parcela_a_sembrar )) (coeficiente ?parcela_a_sembrar maiz))))
        (at end  (parcela_libre ?parcela_a_sembrar ))
        (at end (ultimo_cultivo ?parcela_a_sembrar LILIACEAS))
        (at end (not(ultimo_cultivo ?parcela_a_sembrar ?familia_ultimo_cultivo))) 
                      
                      
                         
                        
     )
)
;define actions here

)