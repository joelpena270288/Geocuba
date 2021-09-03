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

    const {error, stdout, stderr } = await exec('cd /home/ubuntu/Geocuba/src/optic/ && ./optic-clp domain,pddl prueba.pddl');
  
    if (error) {
      console.error(`error: ${error}`);
    }
    return stdout;
  }
 
}
