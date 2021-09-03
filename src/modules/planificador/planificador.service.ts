import { WriteStream, writeFileSync } from 'fs';
import { v4 } from 'node-uuid';

import { exec, spawn } from 'child_process';
import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
@Injectable()
export class PlanificadorService {
  async getPlanPrueba(): Promise<any> {
    let result;
    
   await exec('cd /home/ubuntu/Geocuba/src/optic/ && ./optic-clp domain.pddl problem.pddl', (error, stdout, stderr) => {
    result = stdout;
    console.log(result);
    await this.devolverCadena(stdout) ;
   });
     
   
    
  }
 
 
}
async devolverCadena(stdout): Promise<any>{
  let salidacompleta: String[] = stdout.split("Cost:");
  let  salidaoptima: String[] = salidacompleta[1].split(":");
  let salida: String[] = salidacompleta[1].split("\n"); 
  return salida;
}