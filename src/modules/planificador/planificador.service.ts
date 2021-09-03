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
     await exec(
      'cd /home/ubuntu/Geocuba/src/optic/ && ./optic-clp domain.pddl prueba.pddl',
      async function (error, stdout, stderr) {
        if (error) {
          throw new BadRequestException(error);
        } else {
          return stdout;
        }
      },
    );
    
  }
}
