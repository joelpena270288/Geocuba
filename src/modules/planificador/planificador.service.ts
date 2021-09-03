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
        async function (error, stdout, stderr) {
          if (error) {
            throw new BadRequestException(error);
          }
          const salidacompleta: string[] = stdout.split('Cost:');
          const salidaoptima: string[] = salidacompleta[1].split(':');
          const salida: string[] = salidacompleta[1].split('\n');
          result = await salida;
          return salida;
        },
      );
    } catch (e) {
      throw new BadRequestException(e);
    }
    return result;
  }
}
