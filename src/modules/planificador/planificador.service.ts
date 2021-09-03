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
  async getPlanPrueba(): Promise<string[]> {
    let result = [];
    try {
      await exec(
        'cd /home/ubuntu/Geocuba/src/optic/ && ./optic-clp domain.pddl prueba.pddl',
        (error, stdout, stderr) => {
          if (error) {
            throw new BadRequestException(error);
          }

          result =  this.picarSalida(stdout);
        },
      );
    } catch (e) {
      throw new BadRequestException(e);
    }
    return result;
  }
  async picarSalida(stdout): Promise<string[]> {
    const salidacompleta: string[] = stdout.split('Cost:');
    const salidaoptima: string[] = salidacompleta[1].split(':');
    const salida: string[] = salidacompleta[1].split('\n');
    return salida;
  }
}
