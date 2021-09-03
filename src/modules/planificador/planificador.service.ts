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

    const cmder = async cmd => {
      return new Promise((resolve, reject) => {
        exec('cd /home/ubuntu/Geocuba/src/optic/ && ./optic-clp domain.pddl prueba.pddl', (err, stdout, stderr) => {
          if(err) {
            reject(err);
            return;
          }
          
          return stdout;
        })
      })
    }
   return cmder;
   
  }
  async picarSalida(stdout): Promise<string[]> {
    const salidacompleta: string[] = stdout.split('Cost:');
    const salidaoptima: string[] = salidacompleta[1].split(':');
    const salida: string[] = salidacompleta[1].split('\n');
    return salida;
  }
}
