import {
  Body,
  Controller,
  Get,
  Param,
  ParseIntPipe,
  ParseUUIDPipe,
  Post,
  UseGuards,
} from '@nestjs/common';
import { Peticion } from './dto/peticion.dto';
import { PlanificadorService } from './planificador.service';

@Controller('planificador')
export class PlanificadorController {
  constructor(private readonly _planificadorService: PlanificadorService) {}
  @Get(':nombredominio/:nombreproblema')
  getPlan(
    @Param('nombredominio') nombredominio: string,
    @Param('nombreproblema') nombreproblema: string,
  ) {
    return this._planificadorService.getPlanPrueba(
      nombredominio,
      nombreproblema,
    );
  }
  @Get()
  ping() {
    const html = `
    <!doctype html>
    <html>
        
      <body>  
      <div style="width:800px; margin:0 auto;">
      <h1>Bienvenido al servicio de Planificación</h1> 
      <p>Uno de los mayores desafíos para el hombre es poder hacer una planificación de un proceso en la vida cotidiana, en aras de optimizar recursos obtener mayores rendimientos y reducir el tiempo de ejecución de las tareas, teniendo en cuenta que pueden intervenir muchas variables y cálculos, tomar decisiones que lleven a un buen resultado es un gran reto, con la aparición de los sistemas de expertos se creó un gran compromiso para los investigadores, modelar el conocimiento de las personas y que perduren en el tiempo es una de las grandes metas hoy en día.</p>
      <p>Dentro de la Inteligencia Artificial el campo de la planificación tiene como objetivo la construcción de algoritmos de control que permitan a un agente sintetizar una secuencia de acciones que le lleven a alcanzar sus objetivos.</p>
      <p>Los problemas de planificación en IA son problemas de búsquedas donde deben seguir una secuencia de acciones partiendo de un estado inicial hasta un estado objetivo. Modelar la solución de dichos problemas suelen ser complejos ya que se tienen que ir comparando las distintas soluciones y brindar la mejor.</p>
      <p>Lenguaje PDDL. 
      El lenguaje PDDL fue diseñado para ser una especificación neutral del problema de planificación. 
      </p>
      <p>Este servicio está desarrollado con el planificador OPTIC, el cual nos permite resolver problemas temporales.</p>
      <h2>Instrucciones para trabajar con el servicio</h2>
      <p>1- En el  EndPoint http://ec2-3-15-13-138.us-east-2.compute.amazonaws.com/api/planificador por el método POST debe introducir el dominio y problema en formato de texto</p>
      <p>2- Por el método Get en el EndPoint http://ec2-3-15-13-138.us-east-2.compute.amazonaws.com/api/planificador pasando el nombre de un dominio y el nombre de un problema por parametro puedes ver una corrida del planificador se irán actualizando los juegos de dominios y problemas</p>
      <h4>Ejemplo:</h4>
      <p>http://ec2-3-15-13-138.us-east-2.compute.amazonaws.com/api/planificador/domain/problem</p>
      
      <p>3- La respuesta son las secuencias temporales de la solución en formato JSON</p>
      
      
     </div>
      </body>
    </html>
  `;
    return html;
  }
  @Post()
  createPlan(@Body() peticion: Peticion) {
    return peticion.domain;
    /*return this._planificadorService.createPlan(
      peticion.domain,
      peticion.problem,
    );*/
  }
}
