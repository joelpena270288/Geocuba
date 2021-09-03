import { Module } from '@nestjs/common';
import { PlanificadorService } from './planificador.service';
import { PlanificadorController } from './planificador.controller';
@Module({
  imports: [],
  exports: [],
  providers: [PlanificadorService],
  controllers: [PlanificadorController],
})
export class PlanificadorModule {}
