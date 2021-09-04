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
      nombredominio, nombreproblema
    );
  }
  @Get()
  ping() {
   const html =`
    <!doctype html>
    <html>
        
      <body>  
      <h1>Bienvenido al servicio de Planificación</h1> 
       
      </body>
    </html>
  ` ;
    return html; 
  }
}
